import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart'; // For dummy image placeholder
import 'package:shimmer/shimmer.dart'; // For shimmer effect

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const EcommerceScreen(),
    );
  }
}

class EcommerceScreen extends StatelessWidget {
  const EcommerceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(child: Text('Shopping')),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ItemList(),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Eggs Pasua', price: 2.00, imageUrl: 'assets/eggs_pasua.jpeg'),
    Item(
        name: 'Smokies Pasua',
        price: 1.50,
        imageUrl: 'assets/smokies_pasua.jpeg'),
    Item(name: 'Cookies', price: 3.00, imageUrl: 'assets/cookies.jpeg'),
    Item(name: 'Cakes', price: 5.00, imageUrl: 'assets/cakes.jpeg'),
    Item(name: 'Sweets', price: 0.50, imageUrl: 'assets/sweets.jpeg'),
  ];

  ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // Align items in a row
              children: [
                _buildImage(items[index].imageUrl), // Image
                const SizedBox(width: 10), // Space between image and text
                Expanded(
                  // Allow text to take remaining space
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(items[index].name),
                      Text('\$${items[index].price.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
                QuantitySelector(
                    item:
                        items[index]), // Quantity Selector aligned to the right
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage(String imageUrl) {
    return ClipOval(
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: imageUrl,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
        imageErrorBuilder: (context, error, stackTrace) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(width: 50, height: 50, color: Colors.white),
          );
        },
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  final Item item;

  const QuantitySelector({super.key, required this.item});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Align buttons horizontally
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            if (quantity > 1) {
              setState(() {
                quantity--;
              });
            }
          },
        ),
        Text('$quantity', style: const TextStyle(fontSize: 20)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantity++;
            });
          },
        ),
        GestureDetector(
          // Use GestureDetector for custom button styling
          onTap: () {
            for (var i = 0; i < quantity; i++) {
              Provider.of<CartProvider>(context, listen: false)
                  .addToCart(widget.item);
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${widget.item.name} added to cart')),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0), // Padding for button
            decoration: BoxDecoration(
              color: Colors.green, // Button color
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: const Text('Add to Cart',
                style: TextStyle(color: Colors.white)), // Button text
          ),
        ),
      ],
    );
  }
}

class CartProvider extends ChangeNotifier {
  final List<Item> _cartItems = [];

  void addToCart(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  List<Item> get cartItems => _cartItems;
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).cartItems;

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cartItems[index].name),
              subtitle: Text('\$${cartItems[index].price.toStringAsFixed(2)}'),
            );
          }),
    );
  }
}

class Item {
  final String name;
  final double price;
  final String imageUrl;

  Item({required this.name, required this.price, required this.imageUrl});
}

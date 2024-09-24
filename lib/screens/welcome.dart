import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'HOME PAGE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Welcome !',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.asset("lib/assets/images/homepage.jpg"),
              const SizedBox(height: 10),
              const Text(
                'Welcome to tim412 Youth applicaation. ',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'This appplication is there to help you get tasks done in a much easier and less comlicated manner.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Center(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Thumbs',
                        style: TextStyle(
                            backgroundColor: Colors.black,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ))),
              const SizedBox(height: 20),
              const Text(
                "Submit Your details, see upcoming events, donate and even shop",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 50),
              Transform.rotate(
                angle: -45,
                child: const Text(
                  "DSP>>>>>>>> HavingFunInChrist",
                  style: TextStyle(fontSize: 15, color: Colors.green),
                ),
              ),
              const SizedBox(height: 10),
            ]),
          ),
        ));
  }
}

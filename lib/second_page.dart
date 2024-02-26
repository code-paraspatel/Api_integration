import 'package:flutter/material.dart';

class Mysecond extends StatelessWidget {
  const Mysecond(
      {super.key,
      required this.value,
      required this.firstname,
      required this.lastname,
      required this.age,
      required this.ratting});

   final int value;
   final String firstname;
   final String lastname;
   final String age;
   final int ratting;

  @override
  Widget build(BuildContext context) {
    String name = firstname;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,firstname);
                },
                child: const Text('Return first page')),
            const SizedBox(
              height: 20,
            ),
            Text('Name: $firstname  $lastname'),
            const SizedBox(
              height: 20,
            ),
            Text('Age: $age'),
            const SizedBox(
              height: 20,
            ),
            Text('Ratting: $ratting star'),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/forth');
            }, child: const Text('go forth page'))
          ],
        ),
      ),
    );
  }
}

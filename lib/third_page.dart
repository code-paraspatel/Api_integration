import 'package:flutter/material.dart';

class Mythird extends StatelessWidget {
   Mythird({super.key});

   var _return = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var routeArgs =ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    var value=routeArgs['value'];
    var firstname=routeArgs['firstname'];
    var lastname=routeArgs['lastname'];
    var age=routeArgs['age'];
    var ratting=routeArgs['ratting'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Third page'),
      ),
      body: Column(
        children: [
          Text('Count: $value'),
          const SizedBox(
            height: 20,
          ),
           Text('Name: $firstname $lastname'),
          const SizedBox(
            height: 10,
          ),
           Text('Age: $age'),
          const SizedBox(
            height: 20,
          ),
           Text('Ratting: $ratting'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context,_return.text.toString());
              },
              child: const Text('Go First page')),
          const SizedBox(height: 20,),
          TextField(
            controller: _return,
          ),
        ],
      ),
    );
  }
}

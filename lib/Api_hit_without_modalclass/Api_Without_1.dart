import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ApiWithoutModal_1 extends StatefulWidget {
  const ApiWithoutModal_1({super.key});

  @override
  State<ApiWithoutModal_1> createState() => _ApiWithoutModal_1State();
}

class _ApiWithoutModal_1State extends State<ApiWithoutModal_1> {
var data;
Future getData()async{
  final Uri url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response=await http.get(url);
  data = json.decode(response.body.toString());
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api WithoutModal 1'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
              return ListView.builder(
                itemCount: data.length,
                  itemBuilder:(context, index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Title',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Text(data[index]['title'].toString()),
                          const Text('Body',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                          Text(data[index]['body'].toString()),
                        ],
                      ),
                    );
                  }, );
            },),
          )
        ],
      ),
    );
  }
}

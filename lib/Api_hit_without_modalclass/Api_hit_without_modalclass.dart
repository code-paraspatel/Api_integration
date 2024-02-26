import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiWithoutModal extends StatefulWidget {
  const ApiWithoutModal({super.key});

  @override
  State<ApiWithoutModal> createState() => _ApiWithoutModalState();
}

class _ApiWithoutModalState extends State<ApiWithoutModal> {

  List<Data> userdata=[];

  Future getData()async{
    final Uri url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response=await http.get(url);
    Iterable unknown=json.decode(response.body.toString());
    List<Data> post=List<Data>.from(unknown.map((e) => Data(title: e['title'], body: e['body'], userId: e['userId'], id: e['id'])));
     userdata=post;
     return userdata;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Without Modal'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getData(),
                builder:(context,AsyncSnapshot snapshot) {
                  return ListView.builder(
                    itemCount: userdata.length,
                      itemBuilder:(context, index) {
                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const Text('Title',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text(userdata[index].title,style: const TextStyle(fontSize: 14)),
                              const Text('Body',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold),),
                              Text(userdata[index].body.toString())


                            ],
                          ),
                        );
                      },);
                }, ),
          )
        ],
      ),
    );
  }
}


class Data{
  String title,body;
  int id,userId;
 Data({required this.title,required this.body,required this.userId,required this.id});
}
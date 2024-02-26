import 'dart:convert';

import 'package:data_tranfer_in_page/Modal_class/json_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyApi extends StatefulWidget {
  const MyApi({super.key});
  @override
  State<MyApi> createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  List <Data> usersList=[];

  Future getDataFromServer()async{
  final Uri url = Uri.parse('https://reqres.in/api/users?page=2');
  var response = await http.get(url);
  Iterable unknownData=json.decode(response.body)['data']; 
  List<Data> post=List<Data>.from(unknownData.map((e) => Data.fromJson(e)));
  usersList=post;
  setState(() {
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('How to Api Hit'),
      ),
      body: FutureBuilder(
        future:getDataFromServer(),
       builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${usersList[index].firstName
                        .toString()} ${usersList[index].lastName.toString()}'),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(usersList[index].avatar
                            .toString())),
                    subtitle: Text(usersList[index].email.toString()),
                    trailing: Text(usersList[index].id.toString()),
                  );
                },),
            );
          } else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

       },
      )
    );  
  }
}

import 'dart:convert';

import 'package:data_tranfer_in_page/Modal_class/getPostData_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MYGetPostApi extends StatefulWidget {
  const MYGetPostApi({super.key});

  @override
  State<MYGetPostApi> createState() => _MYGetPostApiState();
}

class _MYGetPostApiState extends State<MYGetPostApi> {
  
  List<Modalclass> userdata=[];
  
  
  Future getPostApi()async{
    final Uri url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var respons= await http.get(url);
    Iterable unknowndata=json.decode(respons.body);
    List<Modalclass> post=List<Modalclass>.from(unknowndata.map((e) => Modalclass.fromJson(e)));
    userdata=post;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('GetPost Api'),),
      body:Center(
        child: FutureBuilder(
          future: getPostApi(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return ListView.builder(
                itemCount: userdata.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              const Text('User Id : '),
                              Text(userdata[index].userId.toString())
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              const Text('Id : '),
                              Text(userdata[index].id.toString())
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Title : '),
                                Flexible(
                                    child: Text(
                                      userdata[index].title.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Body : '),
                              Flexible(
                                child: Text(
                                  userdata[index].body.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }else{
              return const CircularProgressIndicator();
              }
            },
        ),
      )
    );
  }
}

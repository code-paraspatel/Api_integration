import 'dart:convert';

import 'package:data_tranfer_in_page/Dummy%20api/on_tap.dart';
import 'package:data_tranfer_in_page/Modal_class/Dummy_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class MyDummy_Api extends StatefulWidget {
  const MyDummy_Api({super.key});

  @override
  State<MyDummy_Api> createState() => _MyDummy_ApiState();
}

class _MyDummy_ApiState extends State<MyDummy_Api> {
  TextEditingController searchController=TextEditingController();
  String searchBar='';
  List<Products> userdata=[];
  Future getDummyApi()async{
    final Uri url =Uri.parse('https://dummyjson.com/products');
    var res=await http.get(url);
    Iterable data=json.decode(res.body)['products'];
    List<Products> post=List<Products>.from(data.map((e) => Products.fromJson(e)));
    userdata=post;
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Api'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search For Anything',
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
      )
      ),
              onChanged: (value) {
                setState(() {
                  searchBar=value;
                });
              },
              ),
          ),

          Expanded(
            child: FutureBuilder(
              future: getDummyApi(),
              builder: (context,snapshot) {
                if (snapshot.connectionState==ConnectionState.waiting){
                 return ListView.builder(
                   itemCount: userdata.length,
                   itemBuilder: (context, index) {
                     late var searchText = userdata[index].title.toString();
                     late var searchText1 = userdata[index].brand.toString();
                     if(searchBar.isEmpty){
                     return Card(
                       child: Column(
                         children: [
                           ListTile(
                             onTap: () {
                               Navigator.push(context,
                                   MaterialPageRoute(
                                       builder: (context) => GetApiData(data: userdata[index],)));
                             },
                             leading: CircleAvatar(
                               backgroundImage: NetworkImage(userdata[index].thumbnail.toString()),
                             ),
                             title: Text(userdata[index].title.toString()),
                             subtitle: Text(userdata[index].description.toString(),overflow: TextOverflow.ellipsis,maxLines: 1,),
                             trailing: Text(userdata[index].price.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                           ),

                         ],
                       ),
                     );
                     }else if(searchText.toLowerCase().contains(searchController.text.toString())){
                       return  Card(
                         child: Column(
                           children: [
                             ListTile(
                               onTap: () {
                                 Navigator.push(context,
                                     MaterialPageRoute(
                                         builder: (context) => GetApiData(data: userdata[index],)));
                               },
                               leading: CircleAvatar(
                                 backgroundImage: NetworkImage(userdata[index].thumbnail.toString()),
                               ),
                               title: Text(userdata[index].title.toString()),
                               subtitle: Text(userdata[index].description.toString(),overflow: TextOverflow.ellipsis,maxLines: 1,),
                               trailing: Text(userdata[index].price.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                             ),

                           ],
                         ),
                       );
                     }
                     else if(searchText.toUpperCase().contains(searchController.text.toString())){
                       return Card(
                         child: Column(
                           children: [
                             ListTile(
                               onTap: () {
                                 Navigator.push(context,
                                     MaterialPageRoute(
                                         builder: (context) => GetApiData(data: userdata[index],)));
                               },
                               leading: CircleAvatar(
                                 backgroundImage: NetworkImage(userdata[index].thumbnail.toString()),
                               ),
                               title: Text(userdata[index].title.toString()),
                               subtitle: Text(userdata[index].description.toString(),overflow: TextOverflow.ellipsis,maxLines: 1,),
                               trailing: Text(userdata[index].price.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                             ),

                           ],
                         ),
                       );
                     }else if(searchText1.toLowerCase().contains(searchController.text.toString())){
                       return Card(
                         child: Column(
                           children: [
                             ListTile(
                               onTap: () {
                                 Navigator.push(context,
                                     MaterialPageRoute(
                                         builder: (context) => GetApiData(data: userdata[index],)));
                               },
                               leading: CircleAvatar(
                                 backgroundImage: NetworkImage(userdata[index].thumbnail.toString()),
                               ),
                               title: Text(userdata[index].title.toString()),
                               subtitle: Text(userdata[index].description.toString(),overflow: TextOverflow.ellipsis,maxLines: 1,),
                               trailing: Text(userdata[index].price.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                             ),

                           ],
                         ),
                       );
                     }else{
                       return Container();
                     }
                   },);
                }else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

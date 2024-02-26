import 'dart:js';

import 'package:data_tranfer_in_page/Modal_class/Dummy_class.dart';
import 'package:flutter/material.dart';
class GetApiData extends StatefulWidget {
   GetApiData({super.key, required this.data,});

  final Products data;

  @override
  State<GetApiData> createState() => _GetApiDataState();
}

class _GetApiDataState extends State<GetApiData> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Card(
             child: AspectRatio(
               aspectRatio: 4/2,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: widget.data.images?.length,
                   itemBuilder:(context, index) {
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                         child: Image(
                           image: NetworkImage(widget.data.images![index].toString()),
                           fit: BoxFit.cover,),
                       ),
                     );
                   },),
             ),
           ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(widget.data.title.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('(${widget.data.brand.toString()})',style: const TextStyle(fontSize: 10),)
              ],
            ),

            Text(widget.data.description.toString()),
            const SizedBox(height: 10,),
            Text('Rs.${widget.data.price.toString()}',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text('Rating:${widget.data.rating.toString()}'),
            Text('Discount: ${widget.data.discountPercentage.toString()}%'),
            Text('Qty Available: ${widget.data.stock.toString()}Pcs'),


          ],
        ),
      ),
    );
  }
}

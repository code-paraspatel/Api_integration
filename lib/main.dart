
import 'dart:convert';

import 'package:data_tranfer_in_page/Api_hit_without_modalclass/Api_hit_without_modalclass.dart';
import 'package:data_tranfer_in_page/Dummy%20api/Dummy_Api.dart';
import 'package:data_tranfer_in_page/HomePage.dart';
import 'package:data_tranfer_in_page/Image_picker/image_picker.dart';
import 'package:data_tranfer_in_page/api_hit.dart';
import 'package:data_tranfer_in_page/getPost_Api.dart';
import 'package:data_tranfer_in_page/url_launcher.dart';
import 'package:data_tranfer_in_page/third_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Api_hit_without_modalclass/Api_Without_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: '/',


       routes: {

         '/':(context) => const LoginPage(),
         '/first':(context) => const MyHomePage(title: 'Flutter Demo Home Page'),
         '/third':(context)=>  Mythird(),
         '/forth':(context)=> const Myweb(),
         '/five':(context)=> const MyApi(),
         '/six':(context)=>const MYGetPostApi(),
         '/sevan':(context)=>const MyDummy_Api(),
         '/eight':(context)=> const ApiWithoutModal(),
         '/nine':(context)=> const ApiWithoutModal_1(),
         '/ten':(context)=> const MyImagePicker(),

       },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool? result;
  var formkey=GlobalKey<FormState>();

void login (String email,password)async{
 try{
   Response response=  await post(
       Uri.parse('https://reqres.in/api/register'),
       body: {
         'email':email,
         'password':password,
       }
   );
   if(response.statusCode==200){
     result=true;

   }else{
     result=false;

   }

 }catch(e){
   print(e.toString());
 }


}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,letterSpacing: 2,color: Colors.blue),),
                const SizedBox(height: 40,),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Enter Email';
                    }else{
                      return null ;
                    }
                  },
                  controller:emailController ,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Enter your Password';
                    }else if (value.length<5){
                      return 'enter atlist 5 cherecter';
                    }
                    else{
                      return null;
                    }
                  },
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))

                  ),
                    onPressed: () async {
                      if(formkey.currentState!.validate()){
                    // login(emailController.text.toString(), passwordController.text.toString());
                        userRagister();
                     if(result==true) {
                      await Navigator.pushNamed(context, '/first');
                     }
                    setState(() {
                    });
                      }

                }, child: const Text('Sign Up',style: TextStyle(fontSize: 18,color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
  void userRagister()async{
  var  url='https://reqres.in/api/register';
  var data={
    'email':emailController.text,
    'password':passwordController.text,
  };
  var body=json.encode(data); // Content ne jsonform ma convert kare.
  Response response = await post(
                       Uri.parse(url),
                       body: body,
                       headers: {'Content-Type':'application/json'} // ani under content kaya form ma che te darshave.
                                  );
  if(response.statusCode==200) {
    var userdata=jsonDecode(response.body.toString());
    result=true;
    print('account create');
    print(userdata['token']);
  }else{
    print('error');
  }
  }
}

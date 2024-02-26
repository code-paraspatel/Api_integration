import 'package:data_tranfer_in_page/second_page.dart';
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _return='';
  var name='';
  var firstname=TextEditingController();
  var lastname=TextEditingController();
  var age=TextEditingController();
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  int ratting=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    var data = await Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Mysecond(
                                  ratting: ratting,
                                  value: _counter,
                                  firstname:firstname.text.toString().toUpperCase(),
                                  lastname: lastname.text.toString().toUpperCase(),
                                  age: age.text.toString(),)
                        ));
                    setState((){
                      name=data;
                    });

                  },
                  child: const Text('Go Second Page')),

              const SizedBox(height: 10,),
              Text('Welcome $name'),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: TextField(
                  controller: firstname,
                  decoration: const InputDecoration(
                      hintText: 'Enter Your firstName'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: TextField(
                  controller: lastname,
                  decoration: const InputDecoration(
                      hintText: 'Enter Your LastName'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50,right: 50),
                child: TextField(
                  controller: age,
                  decoration: const InputDecoration(
                      hintText: 'Enter Your Age'
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ratting=1;
                      });
                    },
                    icon: ratting>=1?const Icon(Icons.star):const Icon(Icons.star_border),
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    splashRadius: 1,
                    splashColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ratting=2;
                      });
                    },
                    icon: ratting>=2?const Icon(Icons.star):const Icon(Icons.star_border),
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    splashRadius: 1,
                    splashColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ratting=3;
                      });
                    },
                    icon: ratting>=3?const Icon(Icons.star):const Icon(Icons.star_border),
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    splashRadius: 1,
                    splashColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ratting=4;
                      });
                    },
                    icon: ratting>=4?const Icon(Icons.star):const Icon(Icons.star_border),
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    splashRadius: 1,
                    splashColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ratting=5;
                      });
                    },
                    icon: ratting>=5?const Icon(Icons.star):const Icon(Icons.star_border),
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    splashRadius: 1,
                    splashColor: Colors.transparent,
                  ),


                ],
              ),
              ElevatedButton(onPressed: () async {
                var thirdreturn= await Navigator.of(context).pushNamed( '/third',
                    arguments:{
                      'value':_counter.toString(),
                      'firstname':firstname.text.toString().toUpperCase(),
                      'lastname':lastname.text.toString().toUpperCase(),
                      'age':age.text.toString(),
                      'ratting':ratting.toString(),
                    });
                setState(() {
                  _return=thirdreturn.toString();
                });

              }, child: const Text('Go Third page')),
              const SizedBox(height: 20,),
              Text(_return),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/forth');

              },
                  child: const Text('Go ForthPage')),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/five');
              }, child: const Text('Api')),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/six');
              }, child: const Text('GetPost Api')),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/sevan');
              },child: const Text('Dummy Api')),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/eight');
              },child: const Text('Without Modal Api')),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/nine');
              },child: const Text('Without Modal Api 1')),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/ten');
              },child: const Text('Image Picker')),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
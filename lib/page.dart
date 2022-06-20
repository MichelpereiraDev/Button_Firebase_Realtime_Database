import 'package:button_iot/controller/controllerShared.dart';
import 'package:button_iot/pageshared.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

PageSharedState pageshare = new PageSharedState();
ControllerShared controllerSharedPage = new ControllerShared();
class PageApp extends StatefulWidget {
  const PageApp({super.key});

  @override
  State<PageApp> createState() => PageAppState();
}

class PageAppState extends State<PageApp> {
  late bool _valor = false;

  late final DatabaseReference valorRef;

  @override
  void initState() {
     controllerSharedPage.ende();
    super.initState();
   
    valorRef = FirebaseDatabase.instance.ref();
  }

  
  like() async {
  
    await valorRef.child("/HomeIot/${controllerSharedPage.one}/Interruptor/Lamp01").set(_valor);
    
  }

  late double ScreenHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: const Text('ToqTec Iot',
        style:  TextStyle(color: Colors.white),)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.key, color:  Colors.white,),
            tooltip: 'Chave',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${controllerSharedPage.one}")));
            },
          ),]),
        backgroundColor: Colors.deepPurpleAccent,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(1.0, 4.0),
                            color: Colors.grey,
                            blurRadius: .5,
                            spreadRadius: 1.0,
                          ),
                        ]),
                    child: IconButton(
                      splashColor: Colors.cyan,
                      icon: new Icon(Icons.lightbulb_outlined),
                      color: _valor ? Colors.grey : Colors.blue,
                      iconSize: 100,
                      onPressed: () {
                        setState(() => _valor = !_valor);

                        like();

                        print(_valor);
                      },
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PageShared()),
                    );
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 30,
                    color: Colors.white,
                  ))
            ]));
  }
}

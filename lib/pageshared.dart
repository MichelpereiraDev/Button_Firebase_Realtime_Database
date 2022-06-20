import 'dart:convert';

import 'package:button_iot/controller/controllerShared.dart';
import 'package:button_iot/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

ControllerShared controllerShared = new ControllerShared();

class PageShared extends StatefulWidget {
  const PageShared({super.key});

  @override
  State<PageShared> createState() => PageSharedState();
}

class PageSharedState extends State<PageShared> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, actions: <Widget>[
          Center(
              child: const Text(
            'Chave atual',
            style: TextStyle(color: Colors.white),
          )),
          IconButton(
            icon: const Icon(
              Icons.key,
              color: Colors.white,
            ),
            tooltip: 'Chave',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${controllerSharedPage.one}")));
            },
          ),
        ]),
        backgroundColor: Colors.deepPurpleAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Palavra Chave",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 199, 198, 198))),
            Center(
              child: Container(
                  width: 500,
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      new TextFormField(
                          keyboardType: TextInputType.name,
                          controller: controllerShared.emailController,
                          decoration: InputDecoration(
                            labelText: 'Nome Completo',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: controllerShared.pController,
                          decoration: InputDecoration(
                            labelText: 'senha',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ))
                    ],
                  )),
            ),
            Container(
               

                child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 47, 1, 73),
                      ),
                      onPressed: () {
                        controllerShared.salvar();

                      
                      },
                      child: Text(
                        "Salvar",
                        style: TextStyle(
                            color: Color.fromARGB(255, 189, 189, 189)),
                      )),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ))
          ],
        ));
  }
}

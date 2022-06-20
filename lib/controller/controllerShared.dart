import 'package:button_iot/pageshared.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

PageSharedState pageSharedController = new PageSharedState();

class ControllerShared {
   TextEditingController emailController = TextEditingController();
TextEditingController pController = TextEditingController();

 
  String _dados = "";

   var dados = ListTile();

  String one = "";
  late String two = "";

  salvar() async {
    var prefs = await SharedPreferences.getInstance();

 Future<bool> dados = prefs.setStringList(
       'Head', <String>[emailController.text,pController.text]) ;
     
  }

  void ende() async {
    var prefs = await SharedPreferences.getInstance();

   final List<String>? dados = prefs.getStringList('Head') ;
if (dados != null){
    one = dados![0];
    two = dados[1];
   }
  
  }
  

}

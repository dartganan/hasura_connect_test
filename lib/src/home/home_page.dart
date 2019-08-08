import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hasura_connect2/src/home/home_bloc.dart';
import 'package:hasura_connect2/src/home/home_module.dart';
import 'package:hasura_connect2/src/shared/models/messageModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {

  final bloc = HomeModule.to.getBloc<HomeBloc>();
  MeesageModel message = MeesageModel();


    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Hasura"),
      ),
      body: Column(
        children: <Widget>[
          /* MaterialButton(
            onPressed: (){
              bloc.carrega();
            },
            child: Text("Carregar"),
            color: Colors.red,
          ), */
           StreamBuilder(
             stream: bloc.snap.stream ,
             builder: (BuildContext context, AsyncSnapshot snapshot){
               if(!snapshot.hasData) return CircularProgressIndicator();

              List<MeesageModel> teste = (snapshot.data['data']['message'] as List).map((val) => MeesageModel.fromJson(val)).toList();

               return Expanded(
                 child: ListView.builder(
                   itemCount: teste.length,
                   itemBuilder: (BuildContext context, int index) {
                   return Text(teste[index].mesContent);
                  },
                 ),
               );
             },
           ),
        ],
      ),
    );
  }
}

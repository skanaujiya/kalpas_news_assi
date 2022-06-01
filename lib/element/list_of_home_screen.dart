import 'package:flutter/material.dart';
import 'package:kalpas_as/api/news_api.dart';
ApiServices news=ApiServices();

Widget screen(int n){
  String str="The FIRSnce session: \"How to Talk to a Board so the Board will Talk Back\". Helen explains how perspectives may differ between security practitioners in the weeds of vulnerabilities and an upper management’s big picture point of view. Get a taste of Helen s conference presentation as she discusses how to establish and maintain board relationships and explain the value of risk to non-experts.";
  List _widegtList=<Widget>[
    FutureBuilder(
      future: news.fetchNews(),
        builder: (context,AsyncSnapshot<List>snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index)=> Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(5),
                  child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      shadowColor: Colors.black,
                      elevation: 20,
                      child:  ListTile(
                          textColor: Colors.black,
                          title: Text(snapshot.data![index]['title'],style: TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: RichText(
                            text: TextSpan(
                                text: "\n"+snapshot.data![index]['summary'].toString()+'...\n\n',
                                style:const TextStyle(color: Colors.black),
                                children:  [
                                  TextSpan(
                                      text: snapshot.data![index]['published'],
                                      style: TextStyle(color: Colors.grey)
                                  )
                                ]
                            ),
                          ),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.favorite_border,size: 35,),
                              )
                            ],
                          )

                      )
                  )
              )
          );
        }else{
          return CircularProgressIndicator();
        }
        }
    ),
    const Text('Fav')
    //Here we can use Future builder and store the fav news in
    // local database hive or any other database which is connected to tha api
  ];
  return  _widegtList[n];
}
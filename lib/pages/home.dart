import 'dart:convert';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Json Practice'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // to show json file
              FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('local_api/services.json'),
                builder: (context, snapshot) {
                  var myData = json.decode(snapshot.data.toString());
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: myData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(myData[index]['image'],fit: BoxFit.cover,),
                              ),
                              Divider(thickness: 2.0,color: Colors.cyan,),
                              Text(myData[index]['title'],textScaleFactor: 1.25,),
                              Text('Rs. ' + myData[index]['price'].toString(),textScaleFactor: 1.25,),
                            ],
                          
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class ServiceDetails extends StatefulWidget {
  final service;
  ServiceDetails({@required this.service});
  @override
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //image
             Image.network(widget.service['image']),
            // // name
            Text(widget.service['title']),
            // // price
            Text(widget.service['price']),
          ],
        ),
      ),
    );
  }
}

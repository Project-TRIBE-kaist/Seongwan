import 'package:flutter/material.dart';
import 'package:pratice/constants/common_size.dart';
import 'package:pratice/profile_body.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _appbar(),
            ProfileBody(),
          ]
        ),
      )
    );
  }


  Row _appbar() {
    return Row(
            children: <Widget>[
              SizedBox(width: 44,),
              Expanded(
                child: Text(
                  'The Coding PaPa',
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.menu)
              )
            ],
          );
  }
}
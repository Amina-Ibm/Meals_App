import 'package:flutter/material.dart';

class ItemLabel extends StatelessWidget{
  ItemLabel({super.key, required this.Label, required this.icon });
  final String Label;
  final IconData icon;


  Widget build(BuildContext context){
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 3,),
        Text(Label,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }

}
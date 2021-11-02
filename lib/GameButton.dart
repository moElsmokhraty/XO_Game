import 'package:flutter/material.dart';

class GameButton extends StatelessWidget{

  String text;
  Function onButtonClicked;
  int index;

  GameButton(this.text, this.onButtonClicked, this.index){
  }
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
          margin: EdgeInsets.all(4),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.indigo),
            ),
            onPressed: (){
              onButtonClicked(index);
            },
            child: Text(text,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
      )
      );
  }


}
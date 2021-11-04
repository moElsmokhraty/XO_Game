import 'package:flutter/material.dart';
import 'package:xo_game/GameBoard.dart';

class LogIn extends StatelessWidget{

  static String ROUTE_NAME = 'Log In';
  String player1 = '';
  String player2 = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Log In',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
      ),
      ),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(
            hintText: 'Enter Player1',
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )
          ),
            onChanged: (text){
            player1 = text;
            }
          ),
          SizedBox(height: 10,),
          TextField(decoration: InputDecoration(
              hintText: 'Enter Player2',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
          ),
            onChanged: (text){
            player2 = text;
            },
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, GameBoardScreen.ROUTE_NAME,
                arguments: GameBoardArguments(player1, player2));
          },
              child: Text('Log In')),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:xo_game/GameButton.dart';

class GameBoardScreen extends StatefulWidget {
  static String ROUTE_NAME='GameBoard';

  @override
  _GameBoardScreenState createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  int player1Score= 0;

  int player2Score= 0;

  List<String> buttonsText=[
    '','','',
    '','','',
    '','','',
  ];

  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
      ),
      body: Column(
        children: [
          Text('Score',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('player1: $player1Score',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              Text('player2: $player2Score',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(buttonsText[0],onButtonClicked,0),
                GameButton(buttonsText[1],onButtonClicked,1),
                GameButton(buttonsText[2],onButtonClicked,2)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(buttonsText[3],onButtonClicked,3),
                GameButton(buttonsText[4],onButtonClicked,4),
                GameButton(buttonsText[5],onButtonClicked,5)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(buttonsText[6],onButtonClicked,6),
                GameButton(buttonsText[7],onButtonClicked,7),
                GameButton(buttonsText[8],onButtonClicked,8)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonClicked(int index){
    if(buttonsText[index].isNotEmpty)
      return ;

    if(counter%2==0){
      buttonsText[index]='o';

    }else{
      buttonsText[index]='x';
    }
    if(checkWinner(counter%2==0?'o':'x') =='o' ){
      player1Score++;
      clearBoard();
      return ;
    }else if(checkWinner(counter%2==0?'o':'x') =='x'){
      player2Score++;
      clearBoard();
      return;
    }
    if(counter==8){
      clearBoard();
      return;
    }
    counter++;
  setState(() {

  });
  }
  clearBoard(){
    buttonsText=[
      '','','',
      '','','',
      '','','',
    ];
    counter=0;
    setState(() {

    });
  }
 String  checkWinner(String symbol){
    for(int i=0;i<=2;i++){
      if(buttonsText[i*3]==symbol &&buttonsText[(i*3)+1]==symbol&&buttonsText[(i*3)+2]==symbol){
        return symbol;
      }
    }
    for(int i=0;i<=2;i++){
      if(buttonsText[i]==symbol &&buttonsText[(i+3)]==symbol&&buttonsText[i+6]==symbol){
        return symbol;
      }
    }
    if(buttonsText[0]==symbol &&buttonsText[4]==symbol&&buttonsText[8]==symbol){
      return symbol;
    }
    if(buttonsText[2]==symbol &&buttonsText[4]==symbol&&buttonsText[6]==symbol){
      return symbol;
    }
    return 'No Winner';
  }
}

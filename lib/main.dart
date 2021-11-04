import 'package:flutter/material.dart';
import 'package:xo_game/GameBoard.dart';
import 'package:xo_game/LogIn.dart';

void main() {
  runApp(MaterialApp(
    title: 'XO Game',
    routes: {
      LogIn.ROUTE_NAME: (context)=> LogIn(),
      GameBoardScreen.ROUTE_NAME: (context)=> GameBoardScreen(),
    },
    initialRoute: LogIn.ROUTE_NAME,
  )
  );
  }

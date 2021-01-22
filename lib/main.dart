import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/album_screens.dart';
import 'package:flutter_practice/api/services.dart';
import 'package:flutter_practice/bloc/albums/bloc.dart';
import 'package:flutter_practice/model/albums_list.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
          child: AlbumScreen()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VStack(
          [
            text("Hello from Velocity X"),
            text("Hello from Velocity X"),
            text("Hello from Velocity X"),
            text("Hello from Velocity X"),
            text("Hello from Velocity X"),
            text("Hello from Velocity X"),
          ],
          alignment: MainAxisAlignment.center,
          crossAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}

Widget text(String text) => text.text.red500.bold.xl2.underline.make();

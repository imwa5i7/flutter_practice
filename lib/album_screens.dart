import 'package:flutter/material.dart';
import 'package:flutter_practice/bloc/albums/bloc.dart';
import 'package:flutter_practice/bloc/albums/events.dart';
import 'package:flutter_practice/bloc/albums/states.dart';
import 'package:flutter_practice/model/albums_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumScreen extends StatefulWidget {
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadedAlbums();
  }

  _loadedAlbums() async {
    context.read<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Albums".text.make(),
      ),
      body: _body(),
    );
  }

  _body() {
    return VStack([
      BlocBuilder<AlbumsBloc, AlbumState>(
          builder: (BuildContext context, AlbumState state) {
        if (state is AlbumsListError) {
          final error = state.error;
          return Text(error.message);
        }
        if (state is AlbumsLoaded) {
          List<Albums> albums = state.albums;
          return _list(albums);
        }
        return CircularProgressIndicator();
      }),
    ]);
  }

  _list(List<Albums> albums) {
    return Expanded(
      child: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (_, index) {
            Albums album = albums[index];
            return Text(album.title);
          }),
    );
  }
}

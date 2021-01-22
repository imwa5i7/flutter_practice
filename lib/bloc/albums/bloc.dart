import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/api/exceptions.dart';
import 'package:flutter_practice/api/services.dart';
import 'package:flutter_practice/bloc/albums/events.dart';
import 'package:flutter_practice/bloc/albums/states.dart';
import 'package:flutter_practice/model/albums_list.dart';

class AlbumsBloc extends Bloc<AlbumEvents, AlbumState> {
  final AlbumsRepo albumsRepo;
  List<Albums> albums;
  AlbumsBloc({this.albumsRepo}) : super(AlbumsInitState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumsRepo.getAlbumList();
          yield AlbumsLoaded(albums: albums);
        } on SocketException {
          yield AlbumsListError(error: NoInternetException("No Internet"));
        } on HttpException {
          yield AlbumsListError(
              error: NoServiceFoundException("No Service Found"));
        } on FormatException {
          yield AlbumsListError(
              error: InvalidFormatException("Invalid Response Format"));
        } catch (err) {
          yield AlbumsListError(error: UnknownException("Unknown Error"));
        }

        break;
    }
  }
}

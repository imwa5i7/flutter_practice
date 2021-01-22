import 'package:equatable/equatable.dart';
import 'package:flutter_practice/model/albums_list.dart';

abstract class AlbumState extends Equatable {
  //equatable let us compare two objects

  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumState {}

class AlbumsLoading extends AlbumState {}

class AlbumsLoaded extends AlbumState {
  final List<Albums> albums;
  AlbumsLoaded({this.albums});
}

class AlbumsListError extends AlbumState {
  final error;
  AlbumsListError({this.error});
}

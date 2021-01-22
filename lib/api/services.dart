import 'package:flutter_practice/model/albums_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class AlbumsRepo {
  Future<List<Albums>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  @override
  Future<List<Albums>> getAlbumList() async {
    const _baseUrl = "jsonplaceholder.typicode.comm";
    const _GET_ALBUMS = "/albums";

    Uri uri = Uri.https(_baseUrl, _GET_ALBUMS);
    Response response = await http.get(uri);
    List<Albums> albums = albumsFromJson(response.body);
    return albums;
  }
}

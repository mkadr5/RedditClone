import 'package:redditclone/model/post.dart';
import 'package:redditclone/repos/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Post> fetchPost() {
    return _provider.fetcPost();
  }
}

class NetworkError extends Error {}

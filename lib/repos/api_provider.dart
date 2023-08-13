import 'package:http/http.dart' as http;
import 'package:redditclone/model/post.dart';

class ApiProvider {
  final String _baseUrl =
      "https://www.reddit.com/r/flutterdev/top.json?count=20";

  Future<Post> fetcPost() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      throw Exception("Failed to load");
    }
  }
}

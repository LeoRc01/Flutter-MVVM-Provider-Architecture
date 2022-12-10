import 'package:provider_test/Model/Post.dart';

class PostRepository {
  static Future<List<Post>> getPosts() {
    return Future.delayed(
      const Duration(seconds: 5),
      () {
        return [
          Post(title: "First post", description: "This is a description"),
          Post(title: "A post", description: "This is a description"),
          Post(title: "Urlo del", description: "This is a description"),
          Post(title: "asd", description: "This is a description"),
          Post(title: "First123", description: "This is a description"),
          Post(title: "123post", description: "This is a description"),
        ];
      },
    );
  }
}

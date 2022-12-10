import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_test/Repository/postRepo.dart';

import '../Model/Post.dart';

class PostViewModel with ChangeNotifier {
  List<Post> posts = [];

  late bool isFetchingData = true;

  Future<void> setPosts() async {
    isFetchingData = true;
    //notifyListeners();
    try {
      posts = await PostRepository.getPosts();
    } catch (e) {
      log(e.toString());
    }
    isFetchingData = false;
    notifyListeners();
  }

  Future<void> addMorePosts() async {
    isFetchingData = true;
    notifyListeners();
    try {
      var morePosts = await PostRepository.getPosts();
      for (var element in morePosts) {
        posts.add(element);
      }
    } catch (e) {
      log(e.toString());
    }
    isFetchingData = false;
    notifyListeners();
  }
}

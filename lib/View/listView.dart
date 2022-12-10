import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/Model/Post.dart';
import 'package:provider_test/ViewModel/listViewModel.dart';
import 'package:provider_test/Widget/postTile.dart';
import 'package:provider_test/Widget/shimmerMainPage.dart';
import 'package:shimmer/shimmer.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late PostViewModel postViewModel;

  @override
  void initState() {
    postViewModel = Provider.of<PostViewModel>(context, listen: false);
    postViewModel.setPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostViewModel>(
      create: ((context) => postViewModel),
      child: Consumer<PostViewModel>(
        builder: (context, postViewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: postViewModel.isFetchingData
                    ? const ShimmerMainPage()
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemCount: postViewModel.posts.length,
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemBuilder: (context, index) {
                                return PostTile(
                                  title: postViewModel.posts[index].title,
                                  description:
                                      postViewModel.posts[index].description,
                                );
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              postViewModel.addMorePosts();
                            },
                            child: const Text("Add more data"),
                          )
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

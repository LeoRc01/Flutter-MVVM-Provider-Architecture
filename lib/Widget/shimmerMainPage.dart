import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMainPage extends StatelessWidget {
  const ShimmerMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 800),
      baseColor: const Color.fromARGB(255, 81, 81, 81),
      highlightColor: const Color.fromARGB(255, 188, 188, 188),
      child: const Text("Loading data..."),
    );
  }
}

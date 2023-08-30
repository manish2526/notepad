import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../res/assets.dart';


class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AnimationAssets.empty),
        Text("Things looks like empty here, tap + to start")
      ],
    );
  }
}

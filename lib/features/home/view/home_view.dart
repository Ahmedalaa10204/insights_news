import 'package:flutter/material.dart';
import 'package:insights_news/features/home/widgets/home_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              HomeHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
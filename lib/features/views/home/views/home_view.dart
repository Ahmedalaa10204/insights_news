import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_styles.dart';
import 'package:insights_news/features/views/home/widgets/home_header.dart';
import 'package:insights_news/features/views/home/widgets/news_list_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                const HomeHeader(),
                CarouselSlider.builder(
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        'assets/rodri.png',
                        height: 200,
                      );
                    },
                    itemCount: 5,
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    )),
                SmoothPageIndicator(
                  controller: PageController(initialPage: currentIndex),
                  count: 5,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                      spacing: 8.0,
                      dotWidth: 10,
                      dotHeight: 10,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.primary),
                ),
                const Gap(20),
                ButtonsTabBar(
                    // Customize the appearance and behavior of the tab bar
                    backgroundColor: AppColors.primary,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    buttonMargin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    unselectedBackgroundColor: AppColors.cardColor,
                    labelStyle: getBodyStyle(color: AppColors.background),
                    unselectedLabelStyle: getBodyStyle(),
                    // Add your tabs here
                    tabs: const [
                      Tab(text: 'Science'),
                      Tab(text: 'Entertainment'),
                      Tab(text: 'Sports'),
                      Tab(text: 'Business'),
                    ]),
                const Gap(20),
                const Expanded(
                    child: TabBarView(children: [
                  NewsListBuilder(
                    category: 'Science',
                  ),
                  NewsListBuilder(
                    category: 'Entertainment',
                  ),
                  NewsListBuilder(
                    category: 'sports',
                  ),
                  NewsListBuilder(
                    category: 'Business',
                  ),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

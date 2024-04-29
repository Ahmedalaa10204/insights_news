import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_styles.dart';
import 'package:insights_news/core/widgets/custom_btn.dart';
import 'package:insights_news/features/model/news_model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key, required this.model});
  final Article model;
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(model.url ?? ''))) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppColors.white,
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: CustomButton(
            text: 'Go to Website',
            onPressed: () {
              _launchUrl();
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                model.urlToImage ?? '',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    model.title ?? '',
                    style: getTitleStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
            const Gap(15),
            Row(
              children: [
                Text(
                  model.author ?? '',
                  style: getBodyStyle(color: AppColors.primary),
                ),
              ],
            ),
            const Gap(15),
            Row(
              children: [
                Text(
                  model.publishedAt?.split('T')[0] ?? '',
                  style: getSmallStyle(),
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    model.description ?? '',
                    style: getBodyStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
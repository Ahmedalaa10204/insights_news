import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_styles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    var image = AppLocalStorage.getCachedData('image');
    var name = AppLocalStorage.getCachedData('name');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                    radius: 80,
                    backgroundImage: image.isNotEmpty
                        ? FileImage(File(image)) as ImageProvider
                        : const AssetImage('assets/user.png')),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                        radius: 20, child: Icon(Icons.camera_alt_rounded)),
                  ),
                )
              ],
            ),
            const Gap(30),
            Divider(
              color: AppColors.primary,
            ),
            const Gap(30),
            Row(
              children: [
                Text(
                  name,
                  style: getTitleStyle(color: AppColors.primary),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.primary,
                    child: CircleAvatar(
                        radius: 17,
                        foregroundColor: AppColors.primary,
                        child: const Icon(Icons.edit)),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
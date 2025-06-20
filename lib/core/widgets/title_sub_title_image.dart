import 'package:flutter/material.dart';
import 'package:disease_detective/core/widgets/custom_image.dart';
import 'package:disease_detective/core/widgets/custom_sub_title.dart';
import 'custom_head_title_back_button.dart';

class TitleSubTitleImage extends StatelessWidget {
  const TitleSubTitleImage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeadTitleBackButton(title: title),
        const SizedBox(height: 20),
        CustomImage(image: image),
        const SizedBox(
          height: 20,
        ),
        CustomSubTitle(
          subtitle: subtitle,
        ),
      ],
    );
  }
}

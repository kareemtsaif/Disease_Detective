import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/widgets/custom_head_title.dart';

class CustomHeadTitleBackButton extends StatelessWidget {
  const CustomHeadTitleBackButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.grey,
              width: 2.0,
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColor.subColor,
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        CustomHeadTitle(title: title),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}

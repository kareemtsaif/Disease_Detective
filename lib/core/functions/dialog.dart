import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/images.dart';
import 'package:disease_detective/core/utils/router.dart';
import 'package:disease_detective/core/utils/strings.dart';

Future<void> dialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Material(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 105,
                    height: 103,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImage.resetDialog),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      AppString.passwordChangedSuccessfully,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.bodyColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const SizedBox(
                    width: 255,
                    child: Text(
                      AppString.descriptionDialog,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.subColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MaterialButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kSignInView);
                    },
                    child: Container(
                      width: 141,
                      height: 56,
                      decoration: ShapeDecoration(
                        color: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppString.signin,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

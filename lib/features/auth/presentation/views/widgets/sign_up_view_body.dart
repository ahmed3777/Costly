import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/background_container.dart';
import 'package:costly/core/widgets/custom_appbar.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/features/auth/presentation/views/widgets/sign_up_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    return BackgroundContainer(
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05), // Responsive padding
        child: Column(
          children: [
            CustomAppbar(
              title: S.of(context).signUp,
              backgroundColor: AppColors.primaryColor.withOpacity(0.01),
            ),
            Expanded(
              // Use Expanded to take available space
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: screenSize.height * 0.05), // Responsive height
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${S.of(context).welcome}\n',
                          style: TextStyles.regular20
                              .copyWith(color: Colors.white),
                        ),
                        TextSpan(
                          text: S.of(context).sign_up_as,
                          style:
                              TextStyles.bold24.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                      height: screenSize.height * 0.1), // Responsive height
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          // Make button full width
                          onPressed: () {
                            // Implement action for vendor sign up
                            Navigator.pushNamed(
                                context, SignUpFormField.routeName,
                                arguments: 'customer');
                          },
                          text: S.of(context).customer,
                        ),
                      ),
                      SizedBox(width: 20.h),
                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          onPressed: () {
                            // Implement action for customer sign up
                            Navigator.pushNamed(
                                context, SignUpFormField.routeName,
                                arguments: 'provider');
                          },
                          text: S.of(context).vendor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

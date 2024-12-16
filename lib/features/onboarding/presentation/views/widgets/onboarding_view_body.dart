import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/background_container.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/features/auth/presentation/views/signin_view.dart';
import 'package:costly/features/auth/presentation/views/signup_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BackgroundContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: SvgPicture.asset(
                    Assets.imagesLogo,
                    fit: BoxFit.cover,
                    height: constraints.maxHeight * 0.8,
                    width: constraints.maxWidth * 0.8,
                  ),
                ),
                WelcomeText(),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                ),
                SizedBox(
                  width: 200.w,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpView.routeName);
                    },
                    text: S.of(context).signUp,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                AlreadyHaveAnAccount(),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${S.of(context).welcome}\n',
            style: TextStyles.regular20.copyWith(color: Colors.white),
          ),
          TextSpan(
            text: 'Costly.Live',
            style: TextStyles.bold24.copyWith(color: Colors.white),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth * 0.9,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                // Use Flexible here
                child: Text(
                  S.of(context).alreadyHaveAnAccount,
                  style: TextStyles.bold16.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis, // Handle overflow
                ),
              ),
              SizedBox(width: constraints.minWidth * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignInView.routeName);
                },
                child: Text(
                  S.of(context).signIn,
                  style: TextStyles.bold16.copyWith(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.white,
                    height: 0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

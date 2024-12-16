import 'package:costly/core/services/firebase_services.dart';
import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/auth/data/repos/auth_repo_imp.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:costly/core/widgets/background_container.dart';
import 'package:costly/features/splash/presentation/views/widgets/slidingtext.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    excuteNavigation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void excuteNavigation() async {
    Future.delayed(const Duration(seconds: 3), () async {
      try {
        bool isLoggedInSocial = FirebaseAuthService().isLoggedIn();
        bool isLoggedIn = await getIt<AuthRepoImp>().isUserLoggedIn();
        // Navigate based on login status
        if (isLoggedInSocial || isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      } catch (e) {
        print("Error during navigation: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _WelcomeText(),
          SvgPicture.asset(
            Assets.imagesLogo,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SlidingText(
                animationController: animationController, offset: offset),
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    offset = Tween<Offset>(
      begin: const Offset(0, 3),
      end: const Offset(0.0, 0.0),
    ).animate(animationController);

    animationController.forward();
  }
}

class _WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 196),
      child: Text.rich(
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
      ),
    );
  }
}

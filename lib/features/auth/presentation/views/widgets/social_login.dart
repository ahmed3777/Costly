import 'package:costly/features/auth/presentation/cubits/cubit/signupcubit/sign_up_cubit.dart';
import 'package:costly/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: SocialLoginButton(
                  image: 'assets/images/google.png',
                  onPressed: () {
                    context.read<SignUpCubit>().signinWithGoogle();
                  })),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            flex: 1,
            child: SocialLoginButton(
                image: 'assets/images/facebook.png',
                onPressed: () {
                  context.read<SignUpCubit>().signinWithFacebook();
                }),
          ),
        ],
      ),
    );
  }
}

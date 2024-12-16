import 'package:costly/core/helper_functions/build_error_bar.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_appbar.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signupcubit/sign_up_cubit.dart';
import 'package:costly/features/auth/presentation/views/widgets/social_login.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'sign_in_form.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColors.darkPrimaryColor,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomAppbar(
                title: "",
                backgroundColor: AppColors.darkPrimaryColor,
              ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                S.of(context).Or_signin_with_social_account,
                style: TextStyles.regular14.copyWith(color: Colors.white),
              ),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    Navigator.pushReplacementNamed(
                      context,
                      HomeView.routeName,
                    );
                  }
                  if (state is SignUpFailure) {
                    buildErrorBar(context, state.errMessage.split(',')[0]);
                  }
                },
                builder: (context, state) {
                  return SocialLogin();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter, child: SignInForm()))
            ],
          )),
    );
  }
}

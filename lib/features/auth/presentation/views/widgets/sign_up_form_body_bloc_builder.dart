import 'package:costly/core/helper_functions/build_error_bar.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_progress_hub.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signupcubit/sign_up_cubit.dart';
import 'package:costly/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:costly/features/auth/presentation/views/widgets/social_login.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpFormBodyBlocBuilder extends StatelessWidget {
  const SignUpFormBodyBlocBuilder({super.key, required this.userType});
  final String userType;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if (state is SignUpFailure) {
          buildErrorBar(context, state.errMessage.split(',')[0]);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SignUpLoading,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              children: [
                Flexible(
                    flex: 10,
                    child: SignUpForm(
                      userType: userType,
                    )),
                Flexible(flex: 2, child: SocialLoginContainer()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SocialLoginContainer extends StatelessWidget {
  const SocialLoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            S.of(context).Or_signin_with_social_account,
            style: TextStyles.regular14.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(child: SocialLogin()),
        ],
      ),
    );
  }
}

import 'package:costly/core/helper_functions/show_error_bar.dart';
import 'package:costly/core/widgets/custom_progress_hub.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signincubit/cubit/signin_cubit.dart';
import 'package:costly/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBodyConsumer extends StatelessWidget {
  const SignInViewBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if (state is SigninFailure) {
          showErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is SigninLoading, child: SignInViewBody());
      },
    );
  }
}

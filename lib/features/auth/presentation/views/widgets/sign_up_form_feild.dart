import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signupcubit/sign_up_cubit.dart';
import 'package:costly/features/auth/presentation/views/widgets/sign_up_form_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormField extends StatelessWidget {
  const SignUpFormField({super.key, required this.userType});
  final String userType;
  static const String routeName = 'signUpFormField';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: Scaffold(
        // make the keyboard floating
        resizeToAvoidBottomInset: false,
        body: SignUpFormBodyBlocBuilder(
          userType: userType,
        ),
      ),
    );
  }
}

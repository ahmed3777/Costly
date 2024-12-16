import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signincubit/cubit/signin_cubit.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signupcubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/signin_view_body_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SigninCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SignUpCubit>(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SignInViewBodyConsumer(),
      ),
    );
  }
}

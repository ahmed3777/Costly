import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/core/widgets/password_field.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signincubit/cubit/signin_cubit.dart';
import 'package:costly/features/auth/presentation/views/forget_password_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late String phone, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400.w,
        height: 320.h,
        decoration: ShapeDecoration(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
          ),
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                S.of(context).login,
                style: TextStyles.bold24.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomTextFormField(
                hintText: S.of(context).phoneNumber,
                onSaved: (value) {
                  phone = value!;
                },
                keyboardType: TextInputType.phone,
                validatorMassege: 'Please enter a valid phone number',
              ),
              SizedBox(
                height: 10.h,
              ),
              PasswordField(
                onSaved: (value) => password = value!,
                hintText: S.of(context).password,
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPasswordView.routeName);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    S.of(context).forgotPassword,
                    style:
                        TextStyles.regular12.copyWith(color: Color(0xffe66957)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 150.w,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CustomButton(
                    text: S.of(context).login,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<SigninCubit>().signinWithPhoneAndPassword(
                            phone: phone, password: password);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

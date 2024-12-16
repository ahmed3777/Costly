import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: AppColors.darkPrimaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(80)),
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
                        S.of(context).forgotPassword,
                        style: TextStyles.bold24.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomTextFormField(
                        hintText: S.of(context).email,
                        onSaved: (value) {
                          email = value!;
                        },
                        keyboardType: TextInputType.phone,
                        validatorMassege: 'Please enter a valid email ',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CustomButton(
                            text: S.of(context).login,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ]),
                  ),
                )),
          ],
        ));
  }
}

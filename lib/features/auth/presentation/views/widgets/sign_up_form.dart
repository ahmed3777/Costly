import 'package:costly/core/helper_functions/build_error_bar.dart';
import 'package:costly/core/widgets/custom_appbar.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_chek_box_widget.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/core/widgets/password_field.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signupcubit/sign_up_cubit.dart';
import 'package:costly/features/auth/presentation/views/widgets/services_view_body.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.userType});
  final String userType;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, rePassword, name, phoneNumber;
  String? selectedServiceId;
  String? businessName;
  bool? hasAHomeServices = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Color(0xFF1D3139),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
        ),
      ),
      child: Column(
        children: [
          CustomAppbar(
            backgroundColor: Colors.transparent,
            title: S.of(context).signUp,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Form(
                  key: _formKey,
                  autovalidateMode: autoValidateMode,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        onSaved: (value) => name = value!,
                        hintText: S.of(context).fulltName,
                        keyboardType: TextInputType.name,
                        validatorMassege: 'Please enter your name',
                      ),
                      SizedBox(height: 5.h),
                      CustomTextFormField(
                        onSaved: (value) => email = value!,
                        hintText: S.of(context).email,
                        keyboardType: TextInputType.emailAddress,
                        validatorMassege: 'Please enter your Email',
                      ),
                      SizedBox(height: 5.h),
                      CustomTextFormField(
                        onSaved: (value) => phoneNumber = value!,
                        hintText: S.of(context).phoneNumber,
                        keyboardType: TextInputType.phone,
                        validatorMassege: 'Please enter your phone number',
                      ),
                      SizedBox(height: 5.h),
                      PasswordField(
                        onSaved: (value) => password = value!,
                        hintText: S.of(context).password,
                      ),
                      SizedBox(height: 5.h),
                      PasswordField(
                        onSaved: (value) => rePassword = value!,
                        hintText: S.of(context).repeatPassword,
                      ),
                      SizedBox(height: 5.h),
                      if (widget.userType == 'provider') ...[
                        CustomTextFormField(
                          onSaved: (value) => businessName = value!,
                          hintText: S.of(context).businessName,
                          keyboardType: TextInputType.name,
                          validatorMassege: 'Please enter your business name',
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomCheckBoxWidget(
                          onChanged: (value) {
                            setState(() {
                              hasAHomeServices = value;
                            });
                          },
                          text: 'Have A Home visit service',
                        ),
                        SizedBox(height: 5.h),
                        // TODO: Add services view
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ServicesViewBody(
                              onServiceSelected: (serviceId) {
                                selectedServiceId = serviceId;
                                print("service id $serviceId");
                              },
                            )),
                      ],
                      SizedBox(height: 10.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: CustomButton(
                          onPressed: () {
                            // Add button press logic here
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (password != rePassword) {
                                buildErrorBar(
                                    context, 'Passwords do not match');
                              } else {
                                businessName = (widget.userType == 'provider' ||
                                        widget.userType == 'company')
                                    ? businessName
                                    : null;
                                hasAHomeServices =
                                    (widget.userType == 'provider' ||
                                            widget.userType == 'company')
                                        ? hasAHomeServices
                                        : null;

                                selectedServiceId =
                                    (widget.userType == 'provider' ||
                                            widget.userType == 'company')
                                        ? selectedServiceId
                                        : null;
                                context.read<SignUpCubit>().signUp(
                                    email: email,
                                    password: password,
                                    name: name,
                                    phoneNumber: phoneNumber,
                                    userType: widget.userType,
                                    businessName: businessName,
                                    hasAHomeServices: hasAHomeServices,
                                    serviceId: selectedServiceId);
                              }
                            } else {
                              setState(() {
                                autoValidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                          text: S.of(context).signUp,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

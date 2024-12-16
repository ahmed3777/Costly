import 'dart:io';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/core/widgets/custom_information_text_field.dart';
import 'package:costly/core/widgets/password_field.dart';
import 'package:flutter/material.dart';

class UserSettingViewBody extends StatefulWidget {
  const UserSettingViewBody(
      {super.key,
      required this.scaffoldKey,
      required this.userName,
      required this.userEmail,
      required this.userImageUrl,
      required this.userPhoneNumber});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String userName;
  final String userEmail;
  final String userImageUrl;
  final String userPhoneNumber;
  @override
  State<UserSettingViewBody> createState() => _UserSettingViewBodyState();
}

class _UserSettingViewBodyState extends State<UserSettingViewBody> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHomeAppBar(
          scaffoldKey: widget.scaffoldKey,
          centerText: "SETTING",
        ),
        SizedBox(height: 15),
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(widget.userImageUrl),
        ), // Profile image)
        // ImageField(
        //       onImageSelected: (image){
        //         this.image = image;
        //       },
        //     ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Personal Information",
              style: TextStyles.regular16.copyWith(color: Colors.red),
            ),
            SizedBox(height: 10),
            Text(
              "Name",
              style: TextStyles.regular12,
            ),
            SizedBox(height: 5),
            CustomInformationTextField(
              text: widget.userName,
            ),
            SizedBox(height: 10),
            Text(
              "Email",
              style: TextStyles.regular12,
            ),
            CustomInformationTextField(
              text: widget.userEmail,
            ),
            SizedBox(height: 10),
            Text(
              "Phone Number",
              style: TextStyles.regular12,
            ),
            CustomInformationTextField(
              text: widget.userPhoneNumber,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Password",
                  style: TextStyles.regular16,
                ),
                Spacer(),
                ChangePasswordProfile(),
               ],
                     ) ,
                   SizedBox(height: 5),
                   CustomInformationTextField(
              text: "**********",
            ),
          ]),
        ),
      ],
    );
  }
}
 
 class ChangePasswordProfile extends StatelessWidget {
  const ChangePasswordProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                              padding:MediaQuery.of(context).viewInsets,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(  horizontal: 8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Change Password",
                                        style: TextStyles.regular18,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      PasswordField(
                                        textStyle: TextStyles.regular12.copyWith(color: Colors.black),
                                        hintText: "Old Password",
                                        hintTextStyle: TextStyles.regular12
                                        .copyWith(color: Colors.grey),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyles.regular12
                                          .copyWith(color: Colors.red),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      PasswordField(
                                         textStyle: TextStyles.regular12.copyWith(color: Colors.black),
                                          hintText: "New Password",
                                          hintTextStyle: TextStyles.regular12
                                              .copyWith(color: Colors.grey)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      PasswordField(
                                         textStyle: TextStyles.regular12.copyWith(color: Colors.black),
                                          hintText: "Repeat Password",
                                          hintTextStyle: TextStyles.regular12
                                              .copyWith(color: Colors.grey)),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox( 
                                        height: 50,
                                        width: MediaQuery.of(context).size.width ,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(50),
                                                      topRight:
                                                          Radius.circular(50),
                                                    
                                                    )
                                              ),
                                              backgroundColor: AppColors
                                                  .primaryColor // Replace with your AppColor.primaryColor
                                              ),
                                          onPressed: () {},
                                          child: Text(
                                            "Save Password",
                                            style: TextStyles.regular14
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                        child: Text(
                          "Change",
                          style: TextStyles.regular14.copyWith(color: Colors.grey),
                        ));
                    
  }
}
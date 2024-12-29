import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/core/widgets/custom_information_text_field.dart';
import 'package:costly/features/user_profile/presentation/cubit/cubit/user_profile_cubit.dart';
import 'package:costly/features/user_profile/presentation/views/widgets/change_password_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSettingViewBody extends StatefulWidget {
  const UserSettingViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<UserSettingViewBody> createState() => _UserSettingViewBodyState();
}

class _UserSettingViewBodyState extends State<UserSettingViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserProfileSuccess) {
          var user = state.profile;
          String userImage = user.logoUrl;
          ImageProvider? _getBackgroundImage() {
            if (userImage.isNotEmpty &&
                (userImage.startsWith('http://') ||
                    userImage.startsWith('https://'))) {
              return NetworkImage(userImage);
            }
            return null; // Return null if no valid image URL
          }

          return Column(
            children: [
              CustomHomeAppBar(
                scaffoldKey: widget.scaffoldKey,
                centerText: "SETTING",
              ),
              SizedBox(height: 15),
              CircleAvatar(
                radius: 30.0,
                backgroundImage: _getBackgroundImage(), // Profile image
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        text: user.name,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Email",
                        style: TextStyles.regular12,
                      ),
                      CustomInformationTextField(
                        text: user.email,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Phone Number",
                        style: TextStyles.regular12,
                      ),
                      CustomInformationTextField(
                        text: user.phone ?? "0123456789",
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
                      ),
                      SizedBox(height: 5),
                      CustomInformationTextField(
                        text: "**********",
                      ),
                    ]),
              ),
            ],
          );
        } else if (state is UserProfileFailure) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}

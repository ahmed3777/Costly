import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_drawer_item.dart';
import 'package:costly/features/auth/data/repos/auth_repo_imp.dart';
import 'package:costly/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:costly/features/cart/presentation/views/cart_view.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:costly/features/category/presentation/views/category_view.dart';
import 'package:costly/features/services/presentation/views/services_view.dart';
import 'package:costly/features/user_profile/presentation/views/user_account_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String userName = '';
  String imageUrl = '';

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  void _loadUserData() async {
    String fetchedUserName =
        await SharedPref.getString(SharedPrefKeys.userName);
    String fetchedImageUrl =
        await SharedPref.getString(SharedPrefKeys.userImageUrl);
    setState(() {
      userName = fetchedUserName;
      imageUrl = fetchedImageUrl;
    });
  }

  ImageProvider? _getBackgroundImage() {
    if (imageUrl.isNotEmpty &&
        (imageUrl.startsWith('http://') || imageUrl.startsWith('https://'))) {
      return NetworkImage(imageUrl);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.black,
      elevation: 100,
      width: 300.w,
      backgroundColor: AppColors.primaryColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
            color: AppColors.primaryColor,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: _getBackgroundImage(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    userName,
                    style: TextStyles.bold18.copyWith(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Menu Items (Expands to push logout to the bottom)
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                buildDrawerItem(
                  iconPath: Assets.imagesHome,
                  title: S.of(context).home,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, HomeView.routeName);
                  },
                ),
                buildDrawerItem(
                  iconPath: Assets.imagesProfile,
                  title: S.of(context).account,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, UserAccountView.routeName);
                  },
                ),
                buildDrawerItem(
                  icon: Icons.table_chart_outlined,
                  title: S.of(context).products,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CategoryView.routeName);
                  },
                ),
                buildDrawerItem(
                  icon: Icons.wallet,
                  title: S.of(context).services,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ServicesView.routeName);
                  },
                ),
                buildDrawerItem(
                  icon: Icons.shopping_basket_outlined,
                  title: S.of(context).cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, CartView.routeName);
                  },
                ),
                buildDrawerItem(
                  icon: Icons.mail_outline,
                  title: S.of(context).contact,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialLoginButton(
                width: 30.w,
                height: 30.h,
                image: Assets.imagesFacebook,
                onPressed: () {},
              ),
              SizedBox(
                width: 10.w,
              ),
              SocialLoginButton(
                width: 30.w,
                height: 30.h,
                image: Assets.imagesSnapchat,
                onPressed: () {},
              ),
              SizedBox(
                width: 10.w,
              ),
              SocialLoginButton(
                width: 30.w,
                height: 30.h,
                image: Assets.imagesInstagram,
                onPressed: () {},
              ),
              SizedBox(
                width: 10.w,
              ),
              SocialLoginButton(
                width: 30.w,
                height: 30.h,
                image: Assets.imagesTwitter,
                onPressed: () {},
              ),
              SizedBox(
                width: 10.w,
              ),
              SocialLoginButton(
                width: 30.w,
                height: 30.h,
                image: Assets.imagesLinkedin,
                onPressed: () {},
              ),
            ],
          ),
          // Logout Button at the Bottom
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout, color: AppColors.primaryColor),
                TextButton(
                  child: Text(
                    S.of(context).logout,
                    style: TextStyles.bold20
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  onPressed: () async {
                    await getIt<AuthRepoImp>().logout();
                    Navigator.pushReplacementNamed(
                        context, OnBoardingView.routeName);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

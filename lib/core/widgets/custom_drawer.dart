import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/auth/data/repos/auth_repo_imp.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:costly/features/category/presentation/views/category_view.dart';
import 'package:costly/features/services/presentation/views/services_view.dart';
import 'package:costly/features/user_profile/presentation/views/user_account_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String userName = '';
  late String imageUrl = '';
  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

// Load the user data asynchronously
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
    return null; // Return null if no valid image URL
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor, // Background color for the header
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: _getBackgroundImage(), // Profile image
                ),
                const SizedBox(width: 10),
                Text(
                  "${S.of(context).welcome} \n $userName",
                  style: TextStyles.regular20.copyWith(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // TextStyle(

                  //   overflow: TextOverflow.ellipsis,
                  //   color: Colors.white,
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
              ],
            ),
          ),

          // Drawer Items
          ListTile(
            leading: SvgPicture.asset(
              Assets.imagesHome,
              colorFilter: const ColorFilter.mode(
                  AppColors.secondaryColor, BlendMode.srcIn),
              width: 20,
              height: 20,
            ),
            title: Text(
              S.of(context).home,
              style: TextStyles.regular18.copyWith(color: Colors.white),
            ),
            onTap: () {
              // Navigate to home screen or perform an action
              Navigator.pushNamed(context, HomeView.routeName);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.imagesProfile,
              colorFilter: const ColorFilter.mode(
                  AppColors.secondaryColor, BlendMode.srcIn),
              width: 20,
              height: 20,
            ),
            title: Text(
              S.of(context).account,
              style: TextStyles.regular18.copyWith(color: Colors.white),
            ),
            onTap: () {
              // Navigate to profile screen or perform an action
              Navigator.pushNamed(context, UserAccountView.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.table_chart_outlined,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              S.of(context).products,
              style: TextStyles.regular18.copyWith(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, CategoryView.routeName);
            },
          ),

          // ListTile(
          //   leading: Icon(
          //     Icons.photo_filter,
          //     color: AppColors.secondaryColor,
          //   ),
          //   title: Text(
          //     'Categories',
          //     style: TextStyles.regular18.copyWith(color: Colors.white),
          //   ),
          //   onTap: () {
          //     // Navigate to profile screen or perform an action
          //     Navigator.pop(context);
          //   },
          // ),

          ListTile(
            leading: Icon(
              Icons.wallet,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              S.of(context).services,
              style: TextStyles.regular18.copyWith(color: Colors.white),
            ),
            onTap: () {
              // Navigate to settings screen or perform an action
              Navigator.pushNamed(context, ServicesView.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_basket_outlined,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              S.of(context).cart,
              style: TextStyles.regular18.copyWith(color: Colors.white),
            ),
            onTap: () {
              // Navigate to profile screen or perform an action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.mail_outline,
              color: AppColors.secondaryColor,
            ),
            title: Text(
              S.of(context).contact,
              style: TextStyles.regular18.copyWith(color: Colors.white),
            ),
            onTap: () {
              // Navigate to profile screen or perform an action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.secondaryColor),
            title: Text(
              S.of(context).logout,
              style: TextStyles.regular18.copyWith(color: Colors.white),
            ),
            onTap: () async {
              await getIt<AuthRepoImp>()
                  .logout(); // Implement logout functionality
              Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
            },
          ),
        ],
      ),
    );
  }
}


import 'package:costly/core/networking/api_constants.dart';
import 'package:costly/core/services/shared_preferences_singleton.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/user_profile/presentation/views/user_setting.dart';
import 'package:flutter/material.dart';

class UserAccountViewBody extends StatefulWidget {
  const UserAccountViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState>scaffoldKey;   @override
  State<UserAccountViewBody> createState() => _UserAccountViewBodyState();
}

class _UserAccountViewBodyState extends State<UserAccountViewBody> {
     String userName = '';
     String imageUrl = '';
     String userEmail= '';
     String userPhoneNumber= '';
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
    String fetchedUserEmail =
        await SharedPref.getString(SharedPrefKeys.userEmail);
    String fetchedUserPhoneNumber =
        await SharedPref.getString(SharedPrefKeys.userPhoneNumber);
    setState(() {
      userName = fetchedUserName;
      imageUrl = fetchedImageUrl;
      userEmail = fetchedUserEmail;
      userPhoneNumber = fetchedUserPhoneNumber;
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
    return Column(
      children: [
        CustomHomeAppBar(scaffoldKey: widget.scaffoldKey),
        ListTile(
          onTap: () {
            // Handle profile picture tap
          },
          title: Text(userName),
          subtitle: Text(userEmail),
          subtitleTextStyle: TextStyle(color: Colors.grey),
          leading:  CircleAvatar(
                  radius: 30.0,
                  backgroundImage: _getBackgroundImage(), // Profile image
                ), 
        ),
         SizedBox(height: 20),
          ListTile(
            onTap: (){
              // Handle orders
            },
           
            title: Text("MY Orders",style: TextStyles.regular16,),
            subtitle: Text("View your orders",style: TextStyles.regular11.copyWith(color: Colors.grey),),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
          ),
           ListTile(
            title: Text("Shipping Address",style: TextStyles.regular16,),
            subtitle: Text("1 Address",style: TextStyles.regular11.copyWith(color: Colors.grey),),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
          ),
           ListTile(
            title: Text("Promocode",style: TextStyles.regular16,),
            subtitle: Text("You have special promocode",style: TextStyles.regular11.copyWith(color: Colors.grey),),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
          ),
           ListTile(
            onTap: (){// Handle settings  
              Navigator.pushNamed(context, UserSetting.routeName,
                arguments: {
                  'userName':userName,
                  'userEmail':userEmail,
                  'userImageUrl':imageUrl,
                  'userPhoneNumber':userPhoneNumber
                }
            
              );
            },
            title: Text("Settings",style: TextStyles.regular16,),
            subtitle: Text("Notifications,Password",style: TextStyles.regular11.copyWith(color: Colors.grey),),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
          ),
      ],
          
    );
  }
}
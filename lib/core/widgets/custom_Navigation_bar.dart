import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/cart/presentation/views/cart_view.dart';
import 'package:costly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState>
      scaffoldKey; // Accept scaffoldKey as a parameter
  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 1;

  // Method to handle bottom navigation item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex =
          index; // Update the selected index when an item is tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define _widgetOptions inside build method to access widget.scaffoldKey correctly
    final List<Widget> widgetOptions = <Widget>[
      // const Center(child: Text('Bag Screen')),
      CartView(),
      HomeViewBody(
          scaffoldKey: widget.scaffoldKey), // Pass scaffoldKey to HomeViewBody
      const Center(child: Text('Profile Screen')),
    ];

    return Scaffold(
      body: widgetOptions[
          _selectedIndex], // Show the corresponding widget based on selected index
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.imagesBag,
                  colorFilter:
                      const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                  width: 20,
                  height: 20,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8.0), // Padding for icon
                  child: SvgPicture.asset(
                    Assets.imagesBag,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 30,
                    height: 30,
                  ),
                ),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.imagesHome,
                  colorFilter:
                      const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                  width: 20,
                  height: 20,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.imagesHome,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 30,
                    height: 30,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.imagesProfile,
                  colorFilter:
                      const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                  width: 20,
                  height: 20,
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.imagesProfile,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    width: 30,
                    height: 30,
                  ),
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex, // Set the currently selected item
            selectedItemColor: AppColors.secondaryColor,
            unselectedItemColor: const Color.fromARGB(255, 69, 70, 70),
            showSelectedLabels: false, // Hide labels for a cleaner look
            onTap: _onItemTapped, // Update selected index on tap
          ),
        ),
      ),
    );
  }
}

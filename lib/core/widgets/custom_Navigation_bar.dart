import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/cart/presentation/views/cart_view.dart';
import 'package:costly/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'custom_bottom_nav_item.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 1;

  // Handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      CartView(),
      HomeViewBody(scaffoldKey: widget.scaffoldKey),
      const Center(child: Text('Profile Screen')),
    ];

    return Scaffold(
      body: widgetOptions[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height:  MediaQuery.of(context).size.height * 0.1, // ~9% of screen height 
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: BottomNavigationBar(
            items: [
              CustomBottomNavItem(
                icon: Assets.imagesBag,
                label: S.of(context).bag,
                isSelected: _selectedIndex == 0,
              ),
              CustomBottomNavItem(
                icon: Assets.imagesHome,
                label: S.of(context).home,
                isSelected: _selectedIndex == 1,
              ),
              CustomBottomNavItem(
                icon: Assets.imagesProfile,
                label: S.of(context).profile,
                isSelected: _selectedIndex == 2,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.secondaryColor,
            unselectedItemColor:AppColors.darkPrimaryColor,
            showSelectedLabels: false,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

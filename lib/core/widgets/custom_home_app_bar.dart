import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/features/search/presentation/cubit/cubit/search_cubit.dart';
import 'package:costly/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:costly/core/widgets/notification_widget.dart';
import 'package:costly/features/search/presentation/views/search_products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key, 
    this.centerText, 
    required this.scaffoldKey, 
    this.visibleNotification, 
    this.searchController,
    this.onBackPressed,
  });
  final String? centerText;
  final bool? visibleNotification;
  final GlobalKey<ScaffoldState> scaffoldKey; 
  final TextEditingController? searchController;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = searchController ?? TextEditingController();

    return SizedBox(
      height: 140.h,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120.h,
          color: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    onBackPressed != null ? Icons.arrow_back : Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (onBackPressed != null) {
                      onBackPressed!();
                    } else {
                      scaffoldKey.currentState!.openDrawer();
                    }
                  },
                ),
                centerText != null && centerText!.isNotEmpty
                    ? Text(
                        centerText!,
                        style: TextStyles.medium24.copyWith(
                            color: Colors
                                .white), // Customize your text style as needed
                      )
                    : SizedBox(
                        width: 152.w,
                        height: 31.30.h,
                        child: Image.asset("assets/images/costly.png"),
                      ),
                NotificationWidget(
                  visible: visibleNotification ?? false,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          top: 100,
          child: SearchField(
            controller: controller,
            onSearchPressed: () {
             final query = controller.text.trim();
             if (query.isNotEmpty) {
             if (ModalRoute.of(context)?.settings.name != SearchProductsView.routeName) {
               Navigator.pushNamed(
                context,
                SearchProductsView.routeName,
                arguments: query).then((_){
                  controller.clear();
                  });
                }else{
                  // نحن بالفعل في صفحة البحث، نستخدم Bloc لإجراء بحث جديد
                  final searchCubit = context.read<SearchCubit>();
                  searchCubit.searchByKeyword(keyword: query);
                  // إخفاء لوحة المفاتيح بعد البحث
                  FocusScope.of(context).unfocus();
                   }
             }
            },
          ),
        ), //search
      ]),
    );
  }
}

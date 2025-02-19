import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'summary_item_list.dart';

class SummerySection extends StatefulWidget {
  const SummerySection({super.key, required this.pageController});
    final PageController pageController;
  

  @override
  State<SummerySection> createState() => _SummerySectionState();
}

class _SummerySectionState extends State<SummerySection> {
  @override
  void initState() {
    super.initState();    
    BlocProvider.of<CartCubit>(context).getCart();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(S.of(context).summary, style: TextStyles.regular18,),
            SizedBox(height: 8.h,),
            SummaryItemList(),
            SizedBox(height: 5.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(S.of(context).shippingAddress, style: TextStyles.regular18,),
                  Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red ,
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 20) // White check for selected
                , // Empty for unselected
               ),
                ],),
                SizedBox(height: 5.h,),
                SizedBox( width: MediaQuery.of(context).size.width/2, child: Text("12, Bay brook, Sharps Rd, Keilor East, Melbourne, Australia", style: TextStyles.light12,)),
                SizedBox(height: 5.h,),
                InkWell(
                  onTap: () { 
                    //move to the first page in the page view (Address Section) number 0
                    widget.pageController.animateToPage(0,
                     duration: const Duration(milliseconds: 300), 
                     curve: Curves.easeInOut);
                    },
                  child: Text(S.of(context).change, style: TextStyles.light13.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    color: Colors.red 
                  ),),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(S.of(context).payment, style: TextStyles.regular18,),
                  Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red ,
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 20) // White check for selected
                , // Empty for unselected
               ),
                ],),
                SizedBox(height: 5.h,),
                SizedBox( width: MediaQuery.of(context).size.width, child: ListTile( 
                  leading: Image.asset(Assets.imagesMastercard) ,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Master Card", style: TextStyles.light12,),
                      Text("**** **** **** 4543", style: TextStyles.light13,),
                    ],
                  )
                )),
                InkWell(
                  onTap: () { 
                    //move to the first page in the page view (Address Section) number 0
                    widget.pageController.previousPage(
                    duration: const Duration(milliseconds: 300), 
                    curve: Curves.easeInOut);
                    },
                  child: Text(S.of(context).change, style: TextStyles.light13.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    color: Colors.red 
                  ),),
                ),
              ],
            )
        ],
      ),
      ),
        );
     }
}


  
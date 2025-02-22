import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_check_box.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: (16),vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckBox(isChecked: true, onChecked: (value) {
                  },isCheckedColor: Colors.red), 
                  SizedBox(width: 5.w,),
                  Expanded(child: Text (S.of(context).BillingAddressIsTheSameAsDeliveryAddress, 
                  style:TextStyles.regular14, overflow: TextOverflow.ellipsis, maxLines: 2,)),
                ],
              ),
            ),
                SizedBox(height: 20.h,),
                Form (
                  child: 
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(S.of(context).address, style: TextStyles.light12,),
                      SizedBox(height: 2.h),
                      CustomTextFormField(hintText: "1234 Main St",
                     hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                     textStyle:  TextStyles.light10.copyWith(color: Colors.black),
                     borderSideColor: AppColors.grey,
                     keyboardType: TextInputType.streetAddress,),
                      SizedBox(height: 10.h),
                      Text(S.of(context).addressLine2, style: TextStyles.light12,),
                      SizedBox(height: 2.h),
                      CustomTextFormField(hintText:"1234 Main St",
                      borderSideColor: AppColors.grey,
                      textStyle:  TextStyles.light10.copyWith(color: Colors.black),
                      hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                      keyboardType: TextInputType.streetAddress,),
                      SizedBox(height: 10.h),
                      Text(S.of(context).city, style: TextStyles.light12,),
                      SizedBox(height: 2.h), 
                      CustomTextFormField(hintText: "New York", 
                     borderSideColor: AppColors.grey,
                     textStyle:  TextStyles.light10.copyWith(color: Colors.black),
                     hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                     keyboardType: TextInputType.streetAddress,),
                      SizedBox(height: 10.h),
                      Row(
                      children: [
                        Expanded(child: Text(S.of(context).state, style: TextStyles.light12,)),
                        SizedBox(width: 10.w,),
                        Expanded(child: Text(S.of(context).country, style: TextStyles.light12,)),
                      ],
                      ),
                     Row(
                      children: [
                       // Text(S.of(context).state, style: TextStyles.light12,),
                        Expanded(child: CustomTextFormField(hintText: "1234 Main St",
                         hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                         textStyle:  TextStyles.light10.copyWith(color: Colors.black),
                         borderSideColor: AppColors.grey,
                         keyboardType: TextInputType.streetAddress,)
                         ),
                        SizedBox(width: 10.w,),
                       // Text(S.of(context).country, style: TextStyles.light12,),
                        Expanded(child: CustomTextFormField(hintText: "Egypt", 
                        borderSideColor: AppColors.grey,
                        textStyle:  TextStyles.light10.copyWith(color: Colors.black),
                        hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                        keyboardType: TextInputType.streetAddress,)),
                        ],
                      ),
                ]),
                  
                )
          ],
        ),
      ),
    );
  }
}
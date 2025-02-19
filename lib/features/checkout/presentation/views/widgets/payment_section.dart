import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/features/checkout/presentation/views/widgets/payment_method_selected.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              PaymentMethodSelected(),
              const SizedBox(height: 20),
              Form (
                
                child: 
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(S.of(context).nameOnCard, style: TextStyles.light12,),
                    SizedBox(height: 2.h),
                    CustomTextFormField(hintText: "Hend Ali Gafar",
                     hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                    textStyle:  TextStyles.light10.copyWith(color: Colors.black),
                    borderSideColor: AppColors.grey,
                    keyboardType: TextInputType.streetAddress,),
                    SizedBox(height: 10.h),
                    Text(S.of(context).cardNumber, style: TextStyles.light12,),
                    SizedBox(height: 2.h),
                    CustomTextFormField(hintText:"4560   5644   3224   4543",
                    borderSideColor: AppColors.grey,
                    textStyle:  TextStyles.light10.copyWith(color: Colors.black),
                    hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                    keyboardType: TextInputType.streetAddress,),
                    SizedBox(height: 10.h),
                    Row(
                    children: [
                      Expanded(child: Text(S.of(context).expiryDate, style: TextStyles.light12,)),
                      SizedBox(width: 10.w,),
                      Expanded(child: Text(S.of(context).cvv, style: TextStyles.light12,)),
                    ],
                    ),
                   Row(
                    children: [
                     // Text(S.of(context).state, style: TextStyles.light12,),
                      Expanded(child: CustomTextFormField(hintText: "09 / 20",
                       hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                       textStyle:  TextStyles.light10.copyWith(color: Colors.black),
                       borderSideColor: AppColors.grey,
                       keyboardType: TextInputType.streetAddress,)
                       ),
                      SizedBox(width: 10.w,),
                     // Text(S.of(context).country, style: TextStyles.light12,),
                      Expanded(child: CustomTextFormField(hintText: "467", 
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
        ) ,
    );
  }
}
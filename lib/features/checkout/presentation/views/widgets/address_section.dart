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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: (16),vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCheckBox(isChecked: true, onChecked: (value) {}), 
                 SizedBox(width: 5.w,),
                Expanded(child: Text (S.of(context).BillingAddressIsTheSameAsDeliveryAddress, style:TextStyles.regular14, overflow: TextOverflow.ellipsis, maxLines: 2,)),
              ],
            ),
          ),
              SizedBox(height: 20.h,),
              Form (child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(S.of(context).address, style: TextStyles.light12,),
                   SizedBox(height: 2.h),
                   CustomTextFormField(hintText: S.of(context).address,
                   hintTextStyle: TextStyles.light10.copyWith(color: Colors.black)
                    ,keyboardType: TextInputType.streetAddress,),
                   SizedBox(height: 10.h),
                   CustomTextFormField(hintText: S.of(context).addressLine2,
                   hintTextStyle: TextStyles.light10.copyWith(color: Colors.black)
                   , keyboardType: TextInputType.streetAddress,),
                   SizedBox(height: 10.h),
                   CustomTextFormField(hintText: S.of(context).city, 
                   hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                   keyboardType: TextInputType.streetAddress,),
                   SizedBox(height: 10.h),
                   Row(
                    children: [
                      Expanded(child: CustomTextFormField(hintText: S.of(context).state,
                       hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                       keyboardType: TextInputType.streetAddress,)),
                      SizedBox(width: 10.w,),
                      Expanded(child: CustomTextFormField(hintText: S.of(context).country, 
                      hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                      keyboardType: TextInputType.streetAddress,)),
                    ],
                   ),
      
              ]),
                
              )
        ],
      ),
    );
  }
}
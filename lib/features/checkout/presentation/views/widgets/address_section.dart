import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_check_box.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/features/cart/presentation/views/widgets/city_dropdown.dart';
import 'package:costly/features/cart/presentation/views/widgets/country_dropdown.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}
   
class _AddressSectionState extends State<AddressSection> {
     String ? selectedCountryId;
     String ? selectedCityId;
     void onCountrySelected(String? countryId) {
       setState(() {
      selectedCountryId = countryId;
      selectedCityId = null; // Reset city when country changes
      });
  }

  void onCitySelected(String? cityId) {
      setState(() {
      selectedCityId = cityId;
      });
  }
  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: (16), vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckBox(
                      isChecked: true,
                      onChecked: (value) {},
                      isCheckedColor: Colors.red),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                      child: Text(
                    S.of(context).BillingAddressIsTheSameAsDeliveryAddress,
                    style: TextStyles.regular14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).address,
                      style: TextStyles.light12,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextFormField(
                      hintText: "1234 Main St",
                      hintTextStyle:
                          TextStyles.light10.copyWith(color: Colors.black),
                      textStyle:
                          TextStyles.light10.copyWith(color: Colors.black),
                      borderSideColor: AppColors.grey,
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      S.of(context).addressLine2,
                      style: TextStyles.light12,
                    ),
                    SizedBox(height: 2.h),
                    CustomTextFormField(
                      hintText: "1234 Main St",
                      borderSideColor: AppColors.grey,
                      textStyle:
                          TextStyles.light10.copyWith(color: Colors.black),
                      hintTextStyle:
                          TextStyles.light10.copyWith(color: Colors.black),
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(height: 20.h),
                   
                  
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          S.of(context).country,
                          style: TextStyles.light12,
                        )),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                            child: Text(
                          S.of(context).city,
                          style: TextStyles.light12,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        // Text(S.of(context).state, style: TextStyles.light12,),
                         Expanded(
                          child:
                              CountryDropdown(onCountrySelected: onCountrySelected),
                              ),
                        
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child:
                              CityDropdown(  onCitySelected: onCitySelected,
                                  countryID: selectedCountryId,
                                  selectedCityId: selectedCityId,
                                  ) // Pass selected country ID
                        ),
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

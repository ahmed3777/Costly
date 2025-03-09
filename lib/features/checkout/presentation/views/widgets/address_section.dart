import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_check_box.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/features/cart/presentation/views/widgets/city_dropdown.dart';
import 'package:costly/features/cart/presentation/views/widgets/country_dropdown.dart';
import 'package:costly/features/user_profile/presentation/cubit/cubit/user_profile_cubit.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSection extends StatefulWidget {
  const AddressSection({super.key});

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  String? selectedCountryId;
  String? selectedCityId;
  String? addressController;
  String? address2Controller;
  String? postalCodeController;
@override
  void initState() {
    super.initState();
    final userProfileState = context.read<UserProfileCubit>().state;
    if (userProfileState is UserProfileSuccess) {
      setUserData(userProfileState);
    }
  }
  void setUserData(UserProfileSuccess state) {
    setState(() {
      addressController = state.profile.billingAddressOne;
      address2Controller = state.profile.billingAddressTwo;
      postalCodeController = state.profile.billingPostalCode;
      selectedCountryId = state.profile.billingCountryId;
      selectedCityId = state.profile.billingCityId;
    });
  }
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
    return BlocListener<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          if (state is UserProfileSuccess) {
            setUserData(state);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomCheckBox(
                      isChecked: true,
                      onChecked: (value) {},
                      isCheckedColor: Colors.red,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        S.of(context).BillingAddressIsTheSameAsDeliveryAddress,
                        style: TextStyles.regular14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).address, style: TextStyles.light12),
                      SizedBox(height: 2.h),
                      CustomTextFormField(
                        hintText: addressController ?? S.of(context).fakeAddress,
                        hintTextStyle:TextStyles.light10.copyWith(color: Colors.black),
                        textStyle:TextStyles.light10.copyWith(color: Colors.black),
                        onSaved: (value) {
                          addressController = value;
                        },
                        borderSideColor: AppColors.grey,
                        keyboardType: TextInputType.streetAddress,
                      ),
                      SizedBox(height: 10.h),
                      Text(S.of(context).addressLine2,
                          style: TextStyles.light12),
                      SizedBox(height: 2.h),
                      CustomTextFormField(
                        hintText: address2Controller ?? S.of(context).fakeAddress,
                        borderSideColor: AppColors.grey,
                        textStyle:TextStyles.light10.copyWith(color: Colors.black),
                        hintTextStyle:TextStyles.light10.copyWith(color: Colors.black),
                        onSaved: (value) {
                          address2Controller = value;
                        },
                        keyboardType: TextInputType.streetAddress,
                      ),
                      SizedBox(height: 10.h),
                       Text(S.of(context).postalCode, style: TextStyles.light12),
                       SizedBox(height: 2.h),
                       CustomTextFormField(
                        hintText:  postalCodeController ?? S.of(context).postalCode,
                        borderSideColor: AppColors.grey,
                        textStyle: TextStyles.light10.copyWith(color: Colors.black),
                        hintTextStyle: TextStyles.light10.copyWith(color: Colors.black),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          postalCodeController = value;
                        },
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(S.of(context).country,
                                style: TextStyles.light12),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(S.of(context).city,
                                style: TextStyles.light12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CountryDropdown(
                              onCountrySelected: onCountrySelected,
                              initialCountryId: selectedCountryId,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: CityDropdown(
                              onCitySelected: onCitySelected,
                              countryID: selectedCountryId,
                              selectedCityId: selectedCityId, // Preselect city
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
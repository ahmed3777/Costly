import 'package:costly/core/helper_functions/build_error_bar.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_textfield.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvancedSizePicker extends StatefulWidget {
  const AdvancedSizePicker({super.key, required this.productId, required this.productVariationId});
  
  final String productId;
  final String productVariationId;

  @override
  State<AdvancedSizePicker> createState() => _AdvancedSizePickerState();
}

class _AdvancedSizePickerState extends State<AdvancedSizePicker> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  int quantity = 1;
  int? length;
  int? chest;
  int? waist;
  int? hip;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          height: 900.h,
          child: Form( // Wrap the Column with a Form
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Text(
                  'Size Chart',
                  style: TextStyles.bold18.copyWith(color: Colors.black),
                ),
                SizedBox(height: 40.h),
                Image.asset(
                  Assets.imagesFittingGuide,
                  height: 230.h,
                  width: 250.w,
                ),
                SizedBox(height: 20.h),
                // Length Input
                SizedBox(
                  height: 70.h,
                  child: CustomTextFormField(
                    hintText: 'Length',
                    hintTextStyle: const TextStyle(color: Colors.black),
                    textStyle:  TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    validatorMassege: "Please enter a valid length",
                    onSaved: (value) {
                      length = int.tryParse(value!);
                    },
                  ),
                ),
                // Chest Input
                SizedBox(
                  height: 70.h,
                  child: CustomTextFormField(
                    hintText: 'Chest',
                    hintTextStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    validatorMassege: "Please enter a valid chest size",
                    onSaved: (value) {
                      chest = int.tryParse(value!);
                    },
                  ),
                ),

                // Hip Input
                SizedBox(
                  height: 70.h,
                  child: CustomTextFormField(
                    hintText: 'Hip',
                    hintTextStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    validatorMassege: "Please enter a valid hip size",
                    onSaved: (value) {
                      hip = int.tryParse(value!);
                    },
                  ),
                ),
                // Waist Input
                SizedBox(
                  height: 70.h,
                  child: CustomTextFormField(
                    hintText: 'Waist',
                    hintTextStyle: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    validatorMassege: "Please enter a valid waist size",
                    onSaved: (value) {
                      waist = int.tryParse(value!);
                    },
                  ),
                ),
                // Submit Button
                SizedBox(
                  width: 300.w,
                  child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save(); // Save the input values

                        context.read<CartCubit>().addToCart(
                              productId: widget.productId,
                              productVariationId: widget.productVariationId,
                              quantity: quantity,
                              length: length!,
                              chest: chest!,
                              waist: waist!,
                              hip: hip!,
                            );
                        Navigator.pop(context);
                        buildErrorBar(context, 'Product added to cart successfully.');
                      }
                    },
                    text: "Submit",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

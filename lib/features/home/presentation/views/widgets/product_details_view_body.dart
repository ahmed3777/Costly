import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/widgets/Horizontal_graidel_of_productcard.dart';
import 'package:costly/core/widgets/custom_appbar.dart';
import 'package:costly/core/widgets/custom_bottom_for_sizes.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_button_brown.dart';
import 'package:costly/core/widgets/row_text_space_between.dart';
import 'package:costly/features/home/data/models/product_details/product_details.dart';
import 'package:costly/features/home/presentation/views/widgets/color_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productDetails});
  final ProductDetails productDetails;
  @override
  Widget build(BuildContext context) {
    var productRelated = productDetails.payload!.relatedProducts;

    List<Map<String, dynamic>> availableColors = [
      {'name': 'Red', 'value': Colors.red},
      {'name': 'Blue', 'value': Colors.blue},
      {'name': 'Green', 'value': Colors.green},
    ];
    // List <Map<String, dynamic>> colorsAvailable= productDetails.payload!.product!.mainVariation!.color as Map<String ,dynamic>  ;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (8.0),
      ),
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                  imageAsset: "assets/images/costly.png",
                  backgroundColor: Colors.white,
                  arrowColor: Colors.black),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  child: Image.network(
                    productDetails.payload!.product!.mainMediaUrl ,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10.h,
              ),
              Text(
                isArabic()
                    ? productDetails.payload!.product!.arName
                    : productDetails.payload!.product!.enName,
                style:
                    TextStyles.bold24.copyWith(color: AppColors.primaryColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "LE${productDetails.payload!.product!.mainVariation!.priceAfterDiscount}",
                        style: TextStyles.light12.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: " ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                          text:
                              '(LE${productDetails.payload!.product!.mainVariation!.price})',
                          style: TextStyles.light12.copyWith(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: availableColors.map((colorData) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ColorOptionWidget(
                          colorValue: colorData['value'],
                        ),
                      );
                    }).toList(),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 105.w,
                    height: 34.h,
                    child: CustomButton(
                      text: isArabic() ? 'الأحجام' : 'Sizes',
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => CustomShetButtom());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Html(
                data: isArabic()
                    ? '${productDetails.payload!.product!.arOverview}'
                    : '${productDetails.payload!.product!.enOverview}',
                style: {
                  'body': Style(
                    fontSize: FontSize(14.0),
                    color: Colors.black,
                  ),
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Html(
                data: isArabic()
                    ? '${productDetails.payload!.product!.arOverview}'
                    : '${productDetails.payload!.product!.enOverview}',
                style: {
                  'body': Style(
                    fontSize: FontSize(14.0),
                    color: Colors.grey,
                  ),
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButtonBrown(
                text: isArabic() ? 'المواصفات' : 'Specification',
                onPressed: () {
                  // Handle button pressed
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              SpaceBetweenTextRow(
                leftText: isArabic()
                    ? 'يمكنك أيضا أن تحب هذا'
                    : 'You can also like this ',
                rightText: isArabic() ? 'المزيد' : 'See all',
              ),
              SizedBox(
                height: 10.h,
              ),
              HorizontalListOfProductCard(relatedProduct: productRelated)
            ],
          ),
        ),
      ]),
    );
  }
}

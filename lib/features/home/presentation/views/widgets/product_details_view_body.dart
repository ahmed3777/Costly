import 'package:carousel_slider/carousel_slider.dart';
import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/Horizontal_graidel_of_productcard.dart';
import 'package:costly/core/widgets/custom_appbar.dart';
import 'package:costly/core/widgets/custom_button_sheet.dart';
import 'package:costly/features/home/presentation/views/widgets/size_picker_bottom_sheet.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_button_brown.dart';
import 'package:costly/core/widgets/row_text_space_between.dart';
import 'package:costly/features/home/data/models/product_details/product_details.dart';
import 'package:costly/features/home/presentation/views/widgets/color_option_widget.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'advanced_size_picker_sheet.dart';

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
                  imageAsset: Assets.imagesCostly,
                  backgroundColor: Colors.white,
                  arrowColor: Colors.black),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  child:productDetails.payload!.product!.mediaLinks != null &&
                        productDetails.payload!.product!.mediaLinks!.isNotEmpty
                    ? CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * .3,
                          autoPlay: false,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: true,
                        ),
                        items: productDetails.payload!.product!.mediaLinks!
                            .map((mediaLink) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  mediaLink.link ??
                                      'https://costly.mix-code.com/storage/5/beach-2_a122bd1ba7611a9dd03c8f59077830a4.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      )
                    : Center(
                        child: Text('No images available'),
                      ),
              ),
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
              SizedBox(height: 10.h),
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
              SizedBox(height: 10.h),
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
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Material(
                            type: MaterialType
                                .transparency, // Makes the background transparent
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomBottomSheet(
                                child: AdvancedSizePicker(
                                  productId:
                                      productDetails.payload!.product!.id,
                                  productVariationId: productDetails
                                      .payload!.product!.mainVariation!.id,
                                ),
                              ),
                            ),
                          );
                        },
                      );

                      // showModalBottomSheet(
                      //     context: context,
                      //     builder: (context) => AdvancedSizePicker(productId: productDetails.payload!.product!.id,
                      //      productVariationId: productDetails
                      //             .payload!.product!.mainVariation!.id,
                      //     ));
                    },
                    child: Text("CustomSizes",
                        style: TextStyles.regular14.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 105.w,
                    height: 34.h,
                    child: CustomButton(
                      text: S.of(context).size,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => SizePickerBottomSheet(
                                  productId:
                                      productDetails.payload!.product!.id,
                                  productVariationId: productDetails
                                      .payload!.product!.mainVariation!.id,
                                ));
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
              SizedBox(height: 10.h),
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
                text: S.of(context).specification,
                onPressed: () {
                  // Handle button pressed
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              SpaceBetweenTextRow(
                leftText: S.of(context).youCanAlsoLikeThis,
                rightText: S.of(context).seeAll,
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
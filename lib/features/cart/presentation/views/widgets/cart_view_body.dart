import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomHomeAppBar(
                        scaffoldKey: widget.scaffoldKey,
                        centerText:isArabic() ? "Shopping Cart" : "سلة المشتريات"),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
             SliverToBoxAdapter(child: CartViewConsumer()),
            ],
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomButton(
              onPressed: () {},
              text: "Checkout",
              color: AppColors.primaryColor,
              bottomLeft: 0,
              bottomRight: 0,
            ))
      ],
    );
  }
}

class CartViewConsumer extends StatelessWidget {
  const CartViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CartFailure) {
          return Center(child: Text(state.message));
        }
        if (state is CartSuccess) {
            final items = state.cart.payload?.items ?? [];
            
        return Container(
          child: items.isEmpty
              ? Center(child: SizedBox(
                width: 200.w,
                height: 200.h,
                child: Image.asset(Assets.imagesEmptycart)) )
              : CartItemList(
                  productName: items[0].product!.enName,
                  productImage: items[0].product!.mediaLinks![0].link,
                  productPrice: 255,
                ),
        );
        }
        return Container();
      },
    );
  }
}

import 'package:costly/core/helper_functions/build_error_bar.dart';
import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewConsumer extends StatelessWidget {
  const CartViewConsumer({super.key, this.onCartUpdated});
  final Function(bool, int)? onCartUpdated;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (previous, current) =>
          current is CartSuccess || current is CartFailure,
      listener: (context, state) {
        if (state is CartSuccess && onCartUpdated != null) {
          final cart = state.cart.payload;
          if ( cart.items != null && cart.totalPrice != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              onCartUpdated!(cart.items!.isNotEmpty, cart.totalPrice!);
            });
          }
        }
    //  Handle Failure
        if (state is CartFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
            buildErrorBar(context, state.message); // ✅ Now runs *after* the frame is built
          });
        }
      },
      builder: (context, state) {
       //  Show Loading Indicator
        if (state is CartLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
              // Handle Success
        if (state is CartSuccess) {
          final cart = state.cart.payload;
          final items = cart.items ?? [];
          if (items.isEmpty) {
            return SliverToBoxAdapter(
              child: Column(children: [
                Center(
                  child: SizedBox(
                    width: 200.w,
                    height: 200.h,
                    child: Image.asset(Assets.imagesEmptycart),
                  ),
                ),
                SizedBox(height: 100.h),
                Center(
                    child: SizedBox(
                  width: 300.w,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, HomeView.routeName);
                    },
                    text: S.of(context).start_shopping,
                    color: AppColors.secondaryColor,
                  ),
                )),
              ]),
            );
          } else {
            return CartItemList(cart: cart);
          }
        }
        // Default Case (should not happen)
        return  SliverToBoxAdapter(
          child: Center(child: Text(S.of(context).unexpectedState)),
        );
      },
    );
  }
}

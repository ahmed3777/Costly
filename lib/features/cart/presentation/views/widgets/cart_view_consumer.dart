import 'package:costly/core/utils/app_colors.dart';
import 'package:costly/core/utils/assets.dart';
import 'package:costly/core/widgets/custom_button.dart';
import 'package:costly/features/cart/data/model/my_cart/cart.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_item_list.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_total_and_voucher.dart';
import 'package:costly/features/cart/presentation/views/widgets/voucher_form_field.dart';
import 'package:costly/features/home/presentation/views/home_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_cart_button.dart';

class CartViewConsumer extends StatelessWidget {
  const CartViewConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () => context.read<CartCubit>().getCart(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CartLoading) {
          return const _LoadingState();
        }
        if (state is CartSuccess) {
          final cart = state.cart.payload;
          return cart.items.isEmpty 
              ? const _EmptyCartState() 
              : _CartContent(cart: cart);
        }
        return _ErrorState(
          message: S.of(context).unexpectedState,
          onRetry: () => context.read<CartCubit>().getCart(),
        );
      },
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _EmptyCartState extends StatelessWidget {
  const _EmptyCartState();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200.w,
              height: 200.h,
              child: Image.asset(
                Assets.imagesEmptycart,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 100.h),
          Center(
            child: SizedBox(
              width: 300.w,
              child: CustomButton(
                onPressed: () => Navigator.pushNamed(context, HomeView.routeName),
                text: S.of(context).start_shopping,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartContent extends StatelessWidget {
  final Cart cart;
  const _CartContent({required this.cart});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight - 100.h,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: CartItemList(cart: cart),
              ),
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CartTotalAndVoucher(totalPrice: cart.totalPrice!),
                  const VoucherFormField(),
                  CustomCartButton(cart: cart),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
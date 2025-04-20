import 'package:costly/generated/l10n.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/cart/presentation/views/widgets/cart_view_consumer.dart';
import 'package:flutter/material.dart';
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
    return CustomScrollView(
      slivers: [
        SliverHomeAppBar(widget: widget),
        const CartViewConsumer(),
      ],
    );
  }
}

class SliverHomeAppBar extends StatelessWidget {
  const SliverHomeAppBar({
    super.key,
    required this.widget,
  });

  final CartViewBody widget;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomHomeAppBar(
            scaffoldKey: widget.scaffoldKey,
            centerText: S.of(context).shoppingCart,
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}

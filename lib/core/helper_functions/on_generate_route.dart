import 'package:costly/features/auth/presentation/views/forget_password_view.dart';
import 'package:costly/features/auth/presentation/views/signin_view.dart';
import 'package:costly/features/auth/presentation/views/signup_view.dart';
import 'package:costly/features/auth/presentation/views/widgets/sign_up_form_feild.dart';
import 'package:costly/features/cart/data/model/my_cart/cart.dart';
import 'package:costly/features/cart/presentation/views/cart_view.dart';
import 'package:costly/features/category/presentation/views/category_view.dart';
import 'package:costly/features/notifications/presentation/views/notifications_view.dart';
import 'package:costly/features/orders/presentation/views/order_details_view.dart';
import 'package:costly/features/orders/presentation/views/order_view.dart';
import 'package:costly/features/products/presentation/views/products_by_category_view.dart';
import 'package:costly/features/checkout/presentation/views/checkout_view.dart';
import 'package:costly/features/search/presentation/views/search_products_view.dart';
import 'package:costly/features/services/presentation/views/services_view.dart';
import 'package:costly/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:costly/features/services/presentation/views/single_service_view.dart';
import 'package:costly/features/splash/presentation/views/splash_view.dart';
import 'package:costly/features/user_profile/presentation/views/user_account_view.dart';
import 'package:costly/features/user_profile/presentation/views/user_setting.dart';
import 'package:costly/features/filter/presentation/views/filter_view.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/products/presentation/views/product_details_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());

    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView());

    case ProductsByCategoryView.routeName:
      final args = settings.arguments as Map<String, String?>;
      final categoryId = args['categoryId'];
      return MaterialPageRoute(
          builder: (context) => ProductsByCategoryView(
                categoryId: categoryId ?? '',
              ));

    case SingleServiceView.routeName:
      final args = settings.arguments as Map<String, String>;
      final serviceId = args['serviceId'];
      return MaterialPageRoute(
          builder: (context) => SingleServiceView(
                servicId: serviceId,
              ));

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());

    case ServicesView.routeName:
      return MaterialPageRoute(builder: (context) => const ServicesView());

    case CategoryView.routeName:
      return MaterialPageRoute(builder: (context) => const CategoryView());

    case UserAccountView.routeName:
      return MaterialPageRoute(builder: (context) => const UserAccountView());

    case UserSetting.routeName:
      // final args = settings.arguments as Map<String, dynamic>;
      // final userName = args['userName'];
      // final userEmail = args['userEmail'];
      // final userImageUrl = args['userImageUrl'];
      // final userPhoneNumber =args['userPhoneNumber']; // Using dynamic type for scaffoldKey
      return MaterialPageRoute(
          builder: (context) => UserSetting(
              // userName: userName,
              // userEmail: userEmail,
              // userImageUrl: userImageUrl,
              // userPhoneNumber: userPhoneNumber,
              ));

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case ProductDetailsView.routeName:
      final args = settings.arguments
          as Map<String, String?>; // Passing arguments as a Map<String, String>
      final productId = args['productId']; // Extract productId
      final productVariationId = args['productVariationId'];
      return MaterialPageRoute(
          builder: (context) => ProductDetailsView(
                productId: productId ?? '',
                productVariationId: productVariationId ?? '',
              ));

    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());

    case SignUpFormField.routeName:
      final userType = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => SignUpFormField(
                userType: userType,
              ));

    case CheckoutView.routeName:
      return MaterialPageRoute(
          builder: (context) => CheckoutView(
                cart: settings.arguments as Cart,
              ));
    case NotificationsView.routeName:
      return MaterialPageRoute(builder: (context) => const NotificationsView());

    case SearchProductsView.routeName:
      final query = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => SearchProductsView(
                query: query,
              ));

    case FilterView.routeName:
      return MaterialPageRoute(builder: (context) => const FilterView());

    case OrderView.routeName:
      return MaterialPageRoute(builder: (context) => const OrderView());

      case OrderDetailsView.routeName:
      final orderId = settings.arguments as String;
      return MaterialPageRoute(builder: (context) =>  OrderDetailsView(orderId: orderId,));

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}

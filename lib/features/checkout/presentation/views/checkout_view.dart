import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:costly/features/home/presentation/cubits/cities/cities_cubit.dart';
import 'package:costly/features/home/presentation/cubits/countries/countries_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = 'checkout';
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CountriesCubit>()..getCountries(),
        ),
          BlocProvider(create: (context) => getIt<CitiesCubit>()),
        //  ),
      ],
      child: SafeArea(
          child: Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
        body: CheckoutViewBody(scaffoldKey: scaffoldKey),
      )),
    );
  }
}

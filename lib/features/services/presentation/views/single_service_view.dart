import 'package:costly/core/services/get_it_services.dart';
import 'package:costly/core/widgets/custom_drawer.dart';
import 'package:costly/features/services/presentation/cubit/service_detail/service_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/single_service_view_builder.dart';

class SingleServiceView extends StatefulWidget {
  const SingleServiceView({super.key, required this.servicId});
  static const routeName = 'singleService';
  final String? servicId;

  @override
  State<SingleServiceView> createState() => _SingleServiceViewState();
}

class _SingleServiceViewState extends State<SingleServiceView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ServiceDetailsCubit>()..getSingleService(widget.servicId ?? ''),
      child: SafeArea(
        child:
            Scaffold(drawer: CustomDrawer(), body: SingleServiceViewbuilder()),
      ),
    );
  }
}

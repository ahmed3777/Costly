import 'package:costly/core/helper_functions/build_error_bar.dart';
import 'package:costly/features/services/data/service_type/service_type/all_services.dart';
import 'package:costly/features/services/presentation/cubit/servicescubit/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ServicesViewBody extends StatefulWidget {
  final Function(String?) onServiceSelected;

  const ServicesViewBody({
    super.key,
    required this.onServiceSelected,
  });

  @override
  _ServicesViewBodyState createState() => _ServicesViewBodyState();
}

class _ServicesViewBodyState extends State<ServicesViewBody> {
  String? selectedItem;

  List<AllServices> services = [];

  @override
  void initState() {
    super.initState();
    fetchServices(); // Fetch items when screen initializes
  }

  void fetchServices() async {
    await context.read<ServicesCubit>().getServices();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesCubit, ServicesState>(
        listener: (context, state) {
      if (state is ServicesSuccess) {
        if (state.services.isNotEmpty) {
          services = state.services;
        }
      }
      if (state is ServicesFailure) {
        buildErrorBar(context, state.message);
      }
    }, builder: (context, state) {
      return DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          value: selectedItem,
          hint: Text(
            'Select a service',
            style: TextStyles.regular14.copyWith(color: Colors.white),
          ),
          items: services.map((service) {
            return DropdownMenuItem<String>(
              value: service.id,
              child: Text(service.enName),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value; // Update selected service
              widget.onServiceSelected(value);
            });
          });
    });
  }
}

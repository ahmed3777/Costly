import 'package:costly/features/services/data/service_type/service_type/all_services.dart';
import 'package:costly/features/services/presentation/cubit/servicescubit/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ServicesDropdownButton extends StatefulWidget {
  final Function(String?) onServiceSelected;

  const ServicesDropdownButton({
    super.key,
    required this.onServiceSelected,
  });

  @override
  State<ServicesDropdownButton> createState() => _ServicesDropdownButtonState();
}

class _ServicesDropdownButtonState extends State<ServicesDropdownButton> {
  String? selectedItem;
  List<AllServices> services = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(builder: (context, state) {
      if (state is ServicesLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ServicesFailure) {
        return Center(child: Text(state.message));
      }
      if (state is ServicesSuccess) {
        services = state.services;

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
      }
      return Container();
    });
  }
}

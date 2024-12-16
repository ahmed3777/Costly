import 'package:costly/features/services/presentation/cubit/service_detail/service_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'single_services_view_body.dart';

class SingleServiceViewbuilder extends StatelessWidget {
  const SingleServiceViewbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceDetailsCubit, ServiceDetailsState>(
      builder: (context, state) {
        if (state is ServiceDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ServiceDetailsFailure) {
          return Center(child: Text(state.message));
        }
        if (state is ServiceDetailsSuccess) {
          return SingleServiceViewBody(
            service: state.service,
          );
        }
        return Container();
      },
    );
  }
}

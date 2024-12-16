import 'package:costly/core/widgets/custom_gradien_card.dart';
import 'package:costly/features/services/data/service_type/service_type/all_services.dart';
import 'package:costly/features/services/presentation/cubit/servicescubit/services_cubit.dart';
import 'package:costly/features/services/presentation/views/single_service_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesGradienCard extends StatelessWidget {
  const ServicesGradienCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        if (state is ServicesLoading) {
          return SliverToBoxAdapter(
              child: const Center(child: CircularProgressIndicator()));
        }
        if (state is ServicesFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        if (state is ServicesSuccess) {
          List<AllServices> services = state.services;
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 150.h, // Set a fixed height for horizontal scroll
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, SingleServiceView.routeName,
                        arguments: {'serviceId': services[index].id}),
                    child: GradientCard(
                      imageUrl: services[index].mainMediaUrl,
                      text: services[index].enName,
                    ),
                  );
                },
              ),
            ),
          );
        }

        // Default case
        return SliverToBoxAdapter(
          child: GradientCard(
            text: "No Data",
            imageUrl:
                "https://costly.mix-code.com/storage/5/beach-2_a122bd1ba7611a9dd03c8f59077830a4.jpg",
          ),
        );
      },
    );
  }
}

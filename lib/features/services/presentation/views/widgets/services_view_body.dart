import 'package:costly/core/helper_functions/is_arbic.dart';
import 'package:costly/core/utils/app_text_styles.dart';
import 'package:costly/core/widgets/custom_home_app_bar.dart';
import 'package:costly/features/services/presentation/cubit/servicescubit/services_cubit.dart';
import 'package:costly/features/services/presentation/views/single_service_view.dart';
import 'package:costly/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesViewBody extends StatelessWidget {
  const ServicesViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState>
      scaffoldKey; // Accept scaffoldKey as a parameter

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      CustomHomeAppBar(
        scaffoldKey: scaffoldKey,
        centerText: S.of(context).services,
      ),
      SizedBox(height: 1.h),
      ServicesItemsView(),
    ]);
  }
}

class ServicesItemsView extends StatelessWidget {
  const ServicesItemsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        if (state is ServicesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ServicesFailure) {
          return Center(child: Text(state.message));
        }
        if (state is ServicesSuccess) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: state.services.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, SingleServiceView.routeName,
                    arguments: {'serviceId': state.services[index].id}),
                child: ListTile(
                  leading: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        state.services[index].mainMediaUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    isArabic()
                        ? state.services[index].arName
                        : state.services[index].enName,
                    style: TextStyles.regular14,
                  ),
                  subtitle: Text(
                    isArabic()
                        ? state.services[index].arSlug
                        : state.services[index].enSlug,
                    style: TextStyles.light12,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

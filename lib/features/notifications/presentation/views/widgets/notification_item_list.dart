import 'package:costly/features/notifications/presentation/cubit/cubit/notifications_cubit.dart';
import 'package:costly/features/notifications/presentation/views/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationItemList extends StatelessWidget {
  const NotificationItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NotificationsFailure) {
          return Center(child: Text(state.message));
        }
        if (state is NotificationsSuccess) {
          return ListView.builder(
              itemCount: state.notifications.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NotificationItem();
              });
        }
        return Container();
      },
    );
  }
}

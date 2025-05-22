import 'package:costly/features/orders/data/model/orders/orders.dart';
import 'package:costly/features/orders/domain/repo/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.orderRepo) : super(OrdersInitial());
    final OrderRepo orderRepo ;

  Future<void> getOrders()async{
    emit(OrdersLoading());
    final result = await orderRepo.getOrders();
    result.fold((l) => emit(OrdersFailure(l.errMessage)),
     (r) { emit(OrdersSuccess(r));
     });
  }

  Future<void> getSingleOrder(String orderId)async{
    emit(OrdersLoading());
    final result = await orderRepo.getSingleOrder(orderId);
    result.fold((l) => emit(OrdersFailure(l.errMessage)),
     (r) { emit(OrdersSuccess(r));
                
     });
  }

}

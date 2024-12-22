import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:costly/features/category/data/models/categories_model.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepo) : super(CategoryInitial());

  final HomeRepo homeRepo;

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final result = await homeRepo.getCategories();
    result.fold(
      (failure) {
        emit(CategoryFailure(failure.errMessage));
      },
      (categories) {
        emit(CategorySuccess(categories.payload));
      },
    );
  }

}
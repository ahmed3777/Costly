import 'package:costly/features/category/domain/repos/category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:costly/features/category/data/models/categories_model.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());
  final CategoryRepo categoryRepo;

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final result = await categoryRepo.getCategories();
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

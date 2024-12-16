import 'package:bloc/bloc.dart';
import 'package:costly/features/home/data/models/banners.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'banners_state.dart';

class BannerCubit extends Cubit<BannersState> {
  BannerCubit(this.homeRepo) : super(BannersInitial());
  final HomeRepo homeRepo;
  Future<void> getBanners() async {
    emit(BannersLoading());
    final result = await homeRepo.getBanners();
    result.fold(
      (failure) {
        emit(HomeFailure(failure.errMessage));
      },
      (banners) {
        emit(BannersSuccess(banners.payload));
        print("from cubit banners ${banners}");
      },
    );
  }
}

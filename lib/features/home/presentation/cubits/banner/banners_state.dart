part of 'banners_cubit.dart';

@immutable
sealed class BannersState {}

final class BannersInitial extends BannersState {}

final class BannersLoading extends BannersState {}

final class BannersSuccess extends BannersState {
  final List<Banners> banners;
  //final MainResponseModel<Banners> banners;
  BannersSuccess(
    this.banners,
  );
}

final class HomeFailure extends BannersState {
  final String message;
  HomeFailure(this.message);
}

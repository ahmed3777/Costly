// service_locator.dart
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/firebase_services.dart';
import 'package:costly/features/auth/data/repos/auth_repo_imp.dart';
import 'package:costly/features/auth/domin/repos/auth_repo.dart';
import 'package:costly/features/services/presentation/cubit/service_detail/service_details_cubit.dart';
import 'package:costly/features/services/presentation/cubit/servicescubit/services_cubit.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signincubit/cubit/signin_cubit.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signupcubit/sign_up_cubit.dart';
import 'package:costly/features/home/data/repos/home_repo_imp.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:costly/features/home/presentation/cubits/banner/banners_cubit.dart';
import 'package:costly/features/home/presentation/cubits/category/cubit/category_cubit.dart';
import 'package:costly/features/home/presentation/cubits/product/product_cubit.dart';
import 'package:costly/features/home/presentation/cubits/product/single_product/singleproduct_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  ///services
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(),
  );

  ///auth
  getIt.registerLazySingleton<AuthRepoImp>(
    () => AuthRepoImp(
        apiService: getIt<ApiService>(),
        firebaseAuthService: getIt<FirebaseAuthService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(() => getIt<AuthRepoImp>());
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt<AuthRepo>()));
  getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt<AuthRepo>()));
  getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt<AuthRepo>()));
  //home
  getIt.registerLazySingleton<HomeRepo>(() => getIt<HomeRepoImp>());
  getIt.registerLazySingleton<HomeRepoImp>(
      () => HomeRepoImp(apiService: getIt<ApiService>()));
  getIt.registerFactory<BannerCubit>(() => BannerCubit(getIt<HomeRepo>()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt<HomeRepo>()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt<HomeRepo>()));
  getIt.registerFactory<SingleproductCubit>(
      () => SingleproductCubit(getIt<HomeRepo>()));

  ///services
  getIt.registerFactory<ServiceDetailsCubit>(
      () => ServiceDetailsCubit(getIt<AuthRepo>()));
}
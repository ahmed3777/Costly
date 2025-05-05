// service_locator.dart
import 'package:costly/core/services/api_services.dart';
import 'package:costly/core/services/firebase_services.dart';
import 'package:costly/core/services/notification_service.dart';
import 'package:costly/features/auth/data/repos/auth_repo_imp.dart';
import 'package:costly/features/auth/domin/repos/auth_repo.dart';
import 'package:costly/features/cart/data/repos/cart_repo_imp.dart';
import 'package:costly/features/cart/domain/repos/cart_repo.dart';
import 'package:costly/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:costly/features/category/data/repos_imp/category_repo_imp.dart';
import 'package:costly/features/category/domain/repos/category_repo.dart';
import 'package:costly/features/home/presentation/cubits/cities/cities_cubit.dart';
import 'package:costly/features/home/presentation/cubits/countries/countries_cubit.dart';
import 'package:costly/features/notifications/data/repos/notification_repo_imp.dart';
import 'package:costly/features/notifications/domain/repos/notification_repo.dart';
import 'package:costly/features/notifications/presentation/cubit/cubit/notifications_cubit.dart';
import 'package:costly/features/products/data/repos/products_repo_imp.dart';
import 'package:costly/features/products/domain/products_repo.dart';
import 'package:costly/features/products/presentation/cubit/product/product_cubit.dart';
import 'package:costly/features/products/presentation/cubit/product/single_product/singleproduct_cubit.dart';
import 'package:costly/features/search/data/repos/search_repo_imp.dart';
import 'package:costly/features/search/domin/repo/search_repo.dart';
import 'package:costly/features/search/presentation/cubit/cubit/search_cubit.dart';
import 'package:costly/features/services/presentation/cubit/service_detail/service_details_cubit.dart';
import 'package:costly/features/services/presentation/cubit/servicescubit/services_cubit.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signincubit/cubit/signin_cubit.dart';
import 'package:costly/features/auth/presentation/cubits/cubit/signupcubit/sign_up_cubit.dart';
import 'package:costly/features/home/data/repos/home_repo_imp.dart';
import 'package:costly/features/home/domin/repos/home_repo.dart';
import 'package:costly/features/home/presentation/cubits/banner/banners_cubit.dart';
import 'package:costly/features/category/presentation/cubit/category/category_cubit.dart';
import 'package:costly/features/user_profile/data/repos/user_profile_repo_imp.dart';
import 'package:costly/features/user_profile/domain/repo/user_profile_repo.dart';
import 'package:costly/features/user_profile/presentation/cubit/cubit/user_profile_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  ///services
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(),
  );
  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(getIt<ApiService>()),
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
  getIt
      .registerFactory<CountriesCubit>(() => CountriesCubit(getIt<HomeRepo>()));
  getIt.registerFactory<CitiesCubit>(() => CitiesCubit(getIt<HomeRepo>()));

  ///products
  getIt.registerLazySingleton<ProductsRepo>(() => getIt<ProductsRepoImp>());
  getIt.registerLazySingleton<ProductsRepoImp>(
    () => ProductsRepoImp(
      apiService: getIt<ApiService>(),
    ),
  );
  getIt
      .registerFactory<ProductCubit>(() => ProductCubit(getIt<ProductsRepo>()));
  getIt.registerFactory<SingleproductCubit>(
      () => SingleproductCubit(getIt<ProductsRepo>()));

  ///category
  getIt.registerLazySingleton<CategoryRepo>(() => getIt<CategoryRepoImp>());
  getIt.registerFactory<CategoryCubit>(
      () => CategoryCubit(getIt<CategoryRepo>()));

  getIt.registerLazySingleton<CategoryRepoImp>(
      () => CategoryRepoImp(apiService: getIt<ApiService>()));

  ///services
  getIt.registerFactory<ServiceDetailsCubit>(
      () => ServiceDetailsCubit(getIt<AuthRepo>()));

  ///profile
  getIt.registerLazySingleton<UserProfileRepo>(
      () => getIt<UserProfileRepoImp>());
  getIt.registerLazySingleton<UserProfileRepoImp>(
    () => UserProfileRepoImp(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<UserProfileCubit>(
      () => UserProfileCubit(getIt<UserProfileRepo>()));

  ///cart
  getIt.registerLazySingleton<CartRepo>(() => getIt<CartRepoImp>());

  getIt.registerLazySingleton<CartRepoImp>(
    () => CartRepoImp(
      apiService: getIt<ApiService>(),
    ),
  );
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));


  ///Notifications
  getIt.registerLazySingleton<NotificationRepo>(() => getIt<NotificationRepoImp>());
  getIt.registerLazySingleton<NotificationRepoImp>(() => NotificationRepoImp(
      getIt<ApiService>(),
    ),
  );
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt<NotificationRepo>()));
  ///search
   getIt.registerLazySingleton<SearchRepo>(() => getIt<SearchRepoImp>());
   getIt.registerLazySingleton<SearchRepoImp>(() => SearchRepoImp(apiService: getIt<ApiService>(),));
   getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt<SearchRepo>()));
}

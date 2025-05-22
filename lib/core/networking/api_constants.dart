class ApiEndPoints {
  static const String apiBaseUrl = 'https://costly.mix-code.com/api/';
  static const String login = 'login';
  static const String signup = 'register';
  static const String serviceType = 'service_types';
  static const String socialLogin = 'social/process';
  static const String banners = 'banners';
  static const String categories = 'categories';
  static const String brands = 'brands';
  static const String orders = 'profile/orders/history?scope=running';
  static const String singleOrders = 'profile/orders/history/';
  static const String products = 'products';
  static const String singleProduct = 'product-variation';
  static const String profile = 'profile';
  static const String cart = 'profile/show/my-cart';
  static const String addToCart = 'carts/add-to-cart';
  static const String removeFromCart = 'carts/delete';
  static const String incrementQuantity = 'carts/increment-quantity';
  static const String decrementQuantity = 'carts/decrement-quantity';
  static const String updateCart = 'carts/update';
  static const String checkout = 'carts/checkout';
  static const String countries = 'countries';
  static const String cities = 'cities';
  static const String notifications = 'notifications';
  static const String sendFcmToken = 'profile/update/fcm_token';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

class SharedPrefKeys {
  static const String userType = 'userType';
  static const String customerType = 'customer';
  static const String vendorType = 'vendor';
  static const String userToken = 'userToken';
  static const String userName = 'userName';
  static const String userPhoneNumber = 'phoneNumber';
  static const String userImageUrl = 'imageUrl';
  static const String userEmail = 'email';
  static const String billingAddressOne = 'billingAddressOne';
  static const String billingAddressTwo = 'billingAddressTwo';
  static const String billingPostalCode = 'billingPostalCode';
  static const String billingCountryId = 'billingCountryId';
  static const String billingCityId = 'billingCityId';
  static const String fcmToken = 'fcmToken';
}

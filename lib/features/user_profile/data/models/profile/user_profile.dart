class UserProfile {
  String? id;
  String name;
  String email;
  String? phone;
  dynamic phoneCode;
  String? status;
  String? type;
  String? accountSocialProvider;
  dynamic appleId;
  dynamic lang;
  dynamic theme;
  dynamic emailVerifiedAt;
  dynamic firebaseCloudMessagingToken;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? businessName;
  String? bio;
  int? haveAHomeVisitService;
  String? serviceTypeId;
  int? hasDefaultPaymentAddress;
  int? hasSavedAShippingAddress;
  String? billingAddressOne;
  String? billingAddressTwo;
  String? billingPostalCode;
  String? billingCountryId;
  String? billingCityId;
  String? shippingAddressOne;
  String? shippingAddressTwo;
  String? shippingPostalCode;
  String? shippingCountryId;
  String? shippingCityId;
  String logoUrl;

  UserProfile({
    this.id,
    required this.name,
    required this.email,
    this.phone,
    this.phoneCode,
    this.status,
    this.type,
    this.accountSocialProvider,
    this.appleId,
    this.lang,
    this.theme,
    this.emailVerifiedAt,
    this.firebaseCloudMessagingToken,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.businessName,
    this.bio,
    this.haveAHomeVisitService,
    this.serviceTypeId,
    this.hasDefaultPaymentAddress,
    this.hasSavedAShippingAddress,
    this.billingAddressOne,
    this.billingAddressTwo,
    this.billingPostalCode,
    this.billingCountryId,
    this.billingCityId,
    this.shippingAddressOne,
    this.shippingAddressTwo,
    this.shippingPostalCode,
    this.shippingCountryId,
    this.shippingCityId,
    required this.logoUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'] as String?,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String?,
        phoneCode: json['phone_code'] as dynamic,
        status: json['status'] as String?,
        type: json['type'] as String?,
        accountSocialProvider: json['account_social_provider'] as String?,
        appleId: json['apple_id'] as dynamic,
        lang: json['lang'] as dynamic,
        theme: json['theme'] as dynamic,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        firebaseCloudMessagingToken:
            json['firebase_cloud_messaging_token'] as dynamic,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        businessName: json['business_name'] as String?,
        bio: json['bio'] as String?,
        haveAHomeVisitService: json['have_a_home_visit_service'] as int?,
        serviceTypeId: json['service_type_id'] as String?,
        hasDefaultPaymentAddress: json['has_default_payment_address'] as int?,
        hasSavedAShippingAddress: json['has_saved_a_shipping_address'] as int?,
        billingAddressOne: json['billing_address_one'] as dynamic,
        billingAddressTwo: json['billing_address_two'] as dynamic,
        billingPostalCode: json['billing_postal_code'] as dynamic,
        billingCountryId: json['billing_country_id'] as dynamic,
        billingCityId: json['billing_city_id'] as dynamic,
        shippingAddressOne: json['shipping_address_one'] as dynamic,
        shippingAddressTwo: json['shipping_address_two'] as dynamic,
        shippingPostalCode: json['shipping_postal_code'] as dynamic,
        shippingCountryId: json['shipping_country_id'] as dynamic,
        shippingCityId: json['shipping_city_id'] as dynamic,
        logoUrl: json['logo_url'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'phone_code': phoneCode,
        'status': status,
        'type': type,
        'account_social_provider': accountSocialProvider,
        'apple_id': appleId,
        'lang': lang,
        'theme': theme,
        'email_verified_at': emailVerifiedAt,
        'firebase_cloud_messaging_token': firebaseCloudMessagingToken,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'business_name': businessName,
        'bio': bio,
        'have_a_home_visit_service': haveAHomeVisitService,
        'service_type_id': serviceTypeId,
        'has_default_payment_address': hasDefaultPaymentAddress,
        'has_saved_a_shipping_address': hasSavedAShippingAddress,
        'billing_address_one': billingAddressOne,
        'billing_address_two': billingAddressTwo,
        'billing_postal_code': billingPostalCode,
        'billing_country_id': billingCountryId,
        'billing_city_id': billingCityId,
        'shipping_address_one': shippingAddressOne,
        'shipping_address_two': shippingAddressTwo,
        'shipping_postal_code': shippingPostalCode,
        'shipping_country_id': shippingCountryId,
        'shipping_city_id': shippingCityId,
        'logo_url': logoUrl,
      };
}

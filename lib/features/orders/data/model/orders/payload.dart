import 'package:costly/features/cart/data/model/my_cart/item.dart';


class Orders {
  String? id;
  String? invoiceId;
  dynamic promoCodeName;
  dynamic promoCodeDiscount;
  String? promoCodeAmount;
  int? totalPrice;
  int? totalPriceAfterDiscount;
  bool? isPaid;
  bool? isCompleted;
  bool? isCancelled;
  dynamic platform;
  String? paymentMethod;
  dynamic paymentMethodType;
  dynamic paymentId;
  dynamic refundId;
  String? shippingUserName;
  String? shippingUserEmail;
  String? shippingUserPhone;
  String? shippingAddressOne;
  String? shippingAddressTwo;
  String? shippingPostalCode;
  dynamic cashOnDeliveryFees;
  String? shippingCountryId;
  String? shippingCityId;
  String? customerId;
  String? createdAt;
  String? updatedAt;
  List<Item>? items;

  Orders({
    this.id,
    this.invoiceId,
    this.promoCodeName,
    this.promoCodeDiscount,
    this.promoCodeAmount,
    this.totalPrice,
    this.totalPriceAfterDiscount,
    this.isPaid,
    this.isCompleted,
    this.isCancelled,
    this.platform,
    this.paymentMethod,
    this.paymentMethodType,
    this.paymentId,
    this.refundId,
    this.shippingUserName,
    this.shippingUserEmail,
    this.shippingUserPhone,
    this.shippingAddressOne,
    this.shippingAddressTwo,
    this.shippingPostalCode,
    this.cashOnDeliveryFees,
    this.shippingCountryId,
    this.shippingCityId,
    this.customerId,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json['id'] as String?,
        invoiceId: json['invoice_id'] as String?,
        promoCodeName: json['promo_code_name'] as dynamic,
        promoCodeDiscount: json['promo_code_discount'] as dynamic,
        promoCodeAmount: json['promo_code_amount'] as String?,
        totalPrice: json['total_price'] as int?,
        totalPriceAfterDiscount: json['total_price_after_discount'] as int?,
        isPaid: json['is_paid'] as bool?,
        isCompleted: json['is_completed'] as bool?,
        isCancelled: json['is_cancelled'] as bool?,
        platform: json['platform'] as dynamic,
        paymentMethod: json['payment_method'] as String?,
        paymentMethodType: json['payment_method_type'] as dynamic,
        paymentId: json['payment_id'] as dynamic,
        refundId: json['refund_id'] as dynamic,
        shippingUserName: json['shipping_user_name'] as String?,
        shippingUserEmail: json['shipping_user_email'] as String?,
        shippingUserPhone: json['shipping_user_phone'] as String?,
        shippingAddressOne: json['shipping_address_one'] as String?,
        shippingAddressTwo: json['shipping_address_two'] as String?,
        shippingPostalCode: json['shipping_postal_code'] as String?,
        cashOnDeliveryFees: json['cash_on_delivery_fees'] as dynamic,
        shippingCountryId: json['shipping_country_id'] as String?,
        shippingCityId: json['shipping_city_id'] as String?,
        customerId: json['customer_id'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'invoice_id': invoiceId,
        'promo_code_name': promoCodeName,
        'promo_code_discount': promoCodeDiscount,
        'promo_code_amount': promoCodeAmount,
        'total_price': totalPrice,
        'total_price_after_discount': totalPriceAfterDiscount,
        'is_paid': isPaid,
        'is_completed': isCompleted,
        'is_cancelled': isCancelled,
        'platform': platform,
        'payment_method': paymentMethod,
        'payment_method_type': paymentMethodType,
        'payment_id': paymentId,
        'refund_id': refundId,
        'shipping_user_name': shippingUserName,
        'shipping_user_email': shippingUserEmail,
        'shipping_user_phone': shippingUserPhone,
        'shipping_address_one': shippingAddressOne,
        'shipping_address_two': shippingAddressTwo,
        'shipping_postal_code': shippingPostalCode,
        'cash_on_delivery_fees': cashOnDeliveryFees,
        'shipping_country_id': shippingCountryId,
        'shipping_city_id': shippingCityId,
        'customer_id': customerId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}

import 'package:costly/features/cart/data/model/my_cart/cart.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(Cart entity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(entity),
      description: 'Payment description',
      itemList: ItemList.fromEntity(entity: entity.items),
    );
  }

  toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };
}

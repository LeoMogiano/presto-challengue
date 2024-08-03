
import 'package:equatable/equatable.dart';

class FavoriteMerchant extends Equatable {
  final String id;
  final String merchant;
  final int paymentAmount;
  final String merchantId;

  const FavoriteMerchant({
    required this.id,
    required this.merchant,
    required this.paymentAmount,
    required this.merchantId,
  });

  factory FavoriteMerchant.fromJson(Map<String, dynamic> json) {
    return FavoriteMerchant(
      id: json['_id'],
      merchant: json['merchant'],
      paymentAmount: json['payment_amount'],
      merchantId: json['merchant_id'],
    );
  }

  static List<FavoriteMerchant> fromJsonList(List<dynamic>jsonList) {
    return jsonList.map((e) => FavoriteMerchant.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'merchant': merchant,
      'payment_amount': paymentAmount,
      'merchant_id': merchantId,
    };
  }

  @override
  List<Object?> get props => [id, merchant, paymentAmount, merchantId];
}
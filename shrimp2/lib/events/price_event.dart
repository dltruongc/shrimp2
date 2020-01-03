
import '../bases/base_event.dart';

enum priceType{
  getAllData
}

class PriceEvent extends BaseEvent {
  final priceType _price;
  final int _quantity;
  final String _typeshrimp;
  PriceEvent(pricetype, quantity, typeshrimp) : _price = pricetype, _quantity = quantity, _typeshrimp = typeshrimp;
  priceType get pricetype => _price;
  int get quantity => _quantity;
  String get typeshrimp => _typeshrimp;
}
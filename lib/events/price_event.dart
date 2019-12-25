
import '../bases/base_event.dart';

enum PriceType{
  getAllData
}
class PriceEvent extends BaseEvent {
  final PriceType _priceType;
  PriceEvent(priceType) : _priceType = priceType;
  PriceType get priceType => _priceType;

}

import '../bases/base_event.dart';

enum ShrimSizeEnum{
  getAllData
}
class ShrimSizeEvent extends BaseEvent {
  final ShrimSizeEnum _shrimSizeEnum;
  ShrimSizeEvent(shrimpSizeEnum) : _shrimSizeEnum = shrimpSizeEnum;
  ShrimSizeEnum get shrimpSizeEnum => _shrimSizeEnum;

}
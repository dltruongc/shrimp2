
import '../bases/base_event.dart';

enum ShrimpSizeEnum{
  getAllData
}
class ShrimSizeEvent extends BaseEvent {
  final ShrimpSizeEnum _ShrimpSizeEnum;
  ShrimSizeEvent(shrimpSizeEnum) : _ShrimpSizeEnum = shrimpSizeEnum;
  ShrimpSizeEnum get shrimpSizeEnum => _ShrimpSizeEnum;

}
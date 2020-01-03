
import '../bases/base_event.dart';

enum ShrimTypeEnum{
  getAllData
}
class ShrimTypeEvent extends BaseEvent {
  final ShrimTypeEnum _shrimType;
  ShrimTypeEvent(shrimpType) : _shrimType = shrimpType;
  ShrimTypeEnum get shrimpType => _shrimType;

}
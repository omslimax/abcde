import 'package:hive/hive.dart';
part 'notification_db.g.dart';

@HiveType(typeId: 1)
class NotificationDB {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? sentTime;

  NotificationDB({this.title, this.sentTime});
}

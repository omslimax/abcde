// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationDBAdapter extends TypeAdapter<NotificationDB> {
  @override
  final int typeId = 1;

  @override
  NotificationDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationDB(
      title: fields[0] as String?,
      sentTime: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.sentTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

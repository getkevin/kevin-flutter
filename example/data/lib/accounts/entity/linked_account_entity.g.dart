// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linked_account_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LinkedAccountEntityAdapter extends TypeAdapter<LinkedAccountEntity> {
  @override
  final int typeId = 0;

  @override
  LinkedAccountEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LinkedAccountEntity(
      bankName: fields[0] as String,
      logoUrl: fields[1] as String,
      linkToken: fields[2] as String,
      bankId: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LinkedAccountEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.bankName)
      ..writeByte(1)
      ..write(obj.logoUrl)
      ..writeByte(2)
      ..write(obj.linkToken)
      ..writeByte(3)
      ..write(obj.bankId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkedAccountEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

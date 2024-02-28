// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoustmerDetilsAdapter extends TypeAdapter<CoustmerDetils> {
  @override
  final int typeId = 1;

  @override
  CoustmerDetils read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoustmerDetils(
      name: fields[1] as String,
      number: fields[2] as String,
      address: fields[3] as String,
      pincode: fields[4] as String,
      state: fields[5] as String,
      city: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CoustmerDetils obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.pincode)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoustmerDetilsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoeAdapter extends TypeAdapter<Shoe> {
  @override
  final int typeId = 2;

  @override
  Shoe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Shoe(
      text: fields[0] as String,
      price: fields[1] as String,
      image: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Shoe obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

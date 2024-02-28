// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoewomen.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoeWomenAdapter extends TypeAdapter<ShoeWomen> {
  @override
  final int typeId = 3;

  @override
  ShoeWomen read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoeWomen(
      image: fields[1] as String,
      price: fields[3] as String,
      text: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShoeWomen obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeWomenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

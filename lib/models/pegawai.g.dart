// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pegawai.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PegawaiAdapter extends TypeAdapter<Pegawai> {
  @override
  final int typeId = 1;

  @override
  Pegawai read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pegawai(
      name: fields[0] as String,
      age: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Pegawai obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PegawaiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

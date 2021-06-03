import 'package:flutter/cupertino.dart';

class Machine {
  final String debut;
  final String total;
  final String cause;

  const Machine({
    this.debut,
    this.total,
    this.cause,
  });

  Machine copy({
    String debut,
    String total,
    String cause,
  }) =>
      Machine(
        debut: debut ?? this.debut,
        total: total ?? this.total,
        cause: cause ?? this.cause,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Machine &&
          runtimeType == other.runtimeType &&
          debut == other.debut &&
          total == other.total &&
          cause == other.cause;

  @override
  int get hashCode => debut.hashCode ^ total.hashCode ^ cause.hashCode;
}


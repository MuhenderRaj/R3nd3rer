library quaternion;

import 'vector.dart';

class Quaternion {
  const Quaternion(this.real, this.vec);

  final num real;
  final Vector3 vec;

  static const Quaternion identity = Quaternion(1, Vector3.zero);

  // Properties

  Quaternion get inverse {
    final magnitudeSquared = real * real + vec.squareMagnitude;
    if (magnitudeSquared == 0) {
      throw StateError("Quaternion.inverse: attempted on zero quaternion");
    }

    return Quaternion(real, -vec / magnitudeSquared);
  }

  // Operations

  Quaternion operator +(Quaternion other) {
    return Quaternion(real + other.real, vec + other.vec);
  }

  Quaternion operator -() {
    return this * (-1);
  }

  Quaternion operator -(Quaternion other) {
    return this + -other;
  }

  Quaternion operator *(num scalar) {
    return Quaternion(real * scalar, vec * scalar);
  }

  Quaternion operator /(num scalar) {
    if (scalar == 0) {
      throw ArgumentError("Quaternion.operator/: divide by zero attempted");
    }

    return this * (1 / scalar);
  }

  Quaternion product(Quaternion other) {
    return Quaternion(real * other.real - vec.dotProduct(other.vec),
        other.vec * real + vec * other.real + vec.crossProduct(other.vec));
  }

  Quaternion quotient(Quaternion other) {
    return product(other.inverse);
  }

  // Vector operations

  Vector3 rotateVector(Vector3 vector) {
    return product(Quaternion(0, vector)).product(inverse).vec;
  }

  // Representations

  @override
  String toString() {
    return "Quaternion($real, $vec)";
  }
}

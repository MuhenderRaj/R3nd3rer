library vector;

import 'dart:math';

class Vector3 {
  const Vector3(this.x, this.y, this.z);

  final num x;
  final num y;
  final num z;

  // Special Vectors

  static const Vector3 left = Vector3(1, 0, 0);
  static const Vector3 up = Vector3(0, 1, 0);
  static const Vector3 forward = Vector3(0, 0, 1);
  static const Vector3 zero = Vector3(0, 0, 0);

  // Properties

  num get squareMagnitude {
    return dotProduct(this);
  }

  num get magnitude {
    return sqrt(squareMagnitude);
  }

  Vector3 get direction {
    if (magnitude == 0) return zero;

    return this / magnitude;
  }

  // Operations

  Vector3 operator *(num scalar) {
    return Vector3(x * scalar, y * scalar, z * scalar);
  }

  Vector3 operator /(num scalar) {
    if (scalar == 0) {
      throw ArgumentError("Vector.operator/: divide by zero attempted");
    }
    return this * (1 / scalar);
  }

  Vector3 operator +(Vector3 other) {
    return Vector3(x + other.x, y + other.y, z + other.z);
  }

  Vector3 operator -() {
    return this * (-1);
  }

  Vector3 operator -(Vector3 other) {
    return this + -other;
  }

  // Vector Products

  num dotProduct(Vector3 other) {
    return x * other.x + y * other.y + z * other.z;
  }

  Vector3 elementwiseProduct(Vector3 other) {
    return Vector3(x * other.x, y * other.y, z * other.z);
  }

  Vector3 crossProduct(Vector3 other) {
    return Vector3(y * other.z - z * other.y, z * other.x - x * other.z,
        x * other.y - y * other.x);
  }

  // Representations

  @override
  String toString() {
    return "Vector3($x, $y, $z)";
  }

  List<num> toList() {
    return [x, y, z];
  }
}

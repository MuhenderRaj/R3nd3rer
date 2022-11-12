library vector;

import 'dart:math';

class Vector3 {
  const Vector3({required this.x, required this.y, required this.z});

  final num x;
  final num y;
  final num z;

  // Special Vectors

  static const Vector3 left = Vector3(x: 1, y: 0, z: 0);
  static const Vector3 up = Vector3(x: 0, y: 1, z: 0);
  static const Vector3 forward = Vector3(x: 0, y: 0, z: 1);
  static const Vector3 zero = Vector3(x: 0, y: 0, z: 0);

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
    return Vector3(x: x * scalar, y: y * scalar, z: z * scalar);
  }

  Vector3 operator /(num scalar) {
    if (scalar == 0) {
      throw ArgumentError("Vector.operator/: divide by zero attempted");
    }
    return this * (1 / scalar);
  }

  Vector3 operator +(Vector3 other) {
    return Vector3(x: x + other.x, y: y + other.y, z: z + other.z);
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
    return Vector3(x: x * other.x, y: y * other.y, z: z * other.z);
  }

  Vector3 crossProduct(Vector3 other) {
    return Vector3(
        x: y * other.z - z * other.y,
        y: z * other.x - x * other.z,
        z: x * other.y - y * other.x);
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

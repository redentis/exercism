import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String candidate) {
    final n = candidate.length;
    final test = candidate.split('').fold<BigInt>(BigInt.from(0), (s, d) => s + BigInt.from(int.parse(d)).pow(n));
    return test == BigInt.parse(candidate);
  }
}

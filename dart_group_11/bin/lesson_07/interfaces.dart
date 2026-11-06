// В Dart любой класс может быть интерфейсом.
// При implements — нужно реализовать ВСЕ методы, даже если они были уже реализованы в классе.
// Нет готовой логики — только «что должно быть».

abstract class Flyable {
  void fly();
  void flyHigh();
}

abstract class Drawable {
  void draw();
  String draw3D(String material);
}

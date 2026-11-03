abstract class Switchable {
  void turnOn();
  void turnOff();
}
abstract class Adjustable {
  void increase();
  void decrease();
}
// Mixin for battery-powered devices
mixin BatteryPowered {
  int batteryLevel = 100;
  void showBattery() {
    print('Battery level: $batteryLevel%');
  }
}
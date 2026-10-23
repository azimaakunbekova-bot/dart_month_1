import 'dart:io';

void main() {
  stdout.write('Введите ваш возраст: ');
  int age = int.parse(stdin.readLineSync()!);

  stdout.write('Введите температуру воздуха: ');
  int temp = int.parse(stdin.readLineSync()!);

  if ((age >= 20 && age <= 45 && temp >= -20 && temp <= 30) ||
      (age < 20 && temp >= 0 && temp <= 28) ||
      (age > 45 && temp >= -10 && temp <= 25)) {
    print('You can go for a walk.\n');
  } else {
    print('Stay home.\n');
  }

  stdout.write('Введите день недели (например, Monday): ');
  String day = stdin.readLineSync()!.toLowerCase();

  switch (day) {
    case 'monday':
      print("It's the start of the week!\n");
      break;
    case 'tuesday':
    case 'wednesday':
    case 'thursday':
      print("Keep going, almost weekend!\n");
      break;
    case 'friday':
      print("Weekend is coming!\n");
      break;
    case 'saturday':
    case 'sunday':
      print("Enjoy your weekend!\n");
      break;
    default:
      print("Invalid day.\n");
  }

  stdout.write('Введите пароль: ');
  String password = stdin.readLineSync()!;

  if (password.isEmpty) {
    print("Password cannot be empty.");
  } else {
    if (password.length < 6) {
      print("Password too short.");
    } else {
      if (password == "dart123") {
        print("Access granted.");
      } else {
        print("Wrong password.");
      }
    }
  }
}

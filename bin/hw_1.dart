void main() {
  String name = "Аzima";
  int age = 20;
  String city = "Bishkek";
  String profession = " third-year university student";
  String hobby = "reading";

  print("Hello! My name is $name.\nI am $age years old and I live in $city.\nMy profession is $profession.\nIn my free time, I enjoy $hobby.\n");
  


  double salary = 40000; // зарплата в месяц
  double yearlyIncome = salary * 12;
  double yearlyIncomeWithBonus = yearlyIncome * 1.10; // с премией 10%

  print("My yearly income: ${yearlyIncome.toInt()} USD.");
  print("My yearly income with 10% bonus: ${yearlyIncomeWithBonus.toInt()} USD.\n");


  String text = " Knowledge is power, but practice makes perfect. ";
  
  print("Trimmed: '${text.trim()}'");
  print("Upper case: '${text.trim().toUpperCase()}'");
  print("Replaced: '${text.trim().replaceAll('practice', 'experience')}'");
  print("Contains 'power': ${text.contains('power')}\n");

  int apples = 12;
  int people = 5;
  
  int applesPerPerson = apples ~/ people;
  int applesLeft = apples % people;

  print("Each person gets $applesPerPerson apples.");
  print("Apples left: $applesLeft.\n");


  int currentYear = 2026;
  int myAge = age;
  int birthYear = currentYear - myAge;

  print("I was born in $birthYear.\n");

  var c1ty = "Bishkek";
  final String country = "Kyrgyzstan";

  c1ty = "Osh";

  print("City: $c1ty");
  print("Country: $country");
}




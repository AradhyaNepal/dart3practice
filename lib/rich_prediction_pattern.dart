void main() {
  print(
      "Welcome to my software. This software is made to calculate whether you will be rich or not.");
  print("This software uses advance AI model which have 100% accuracy.");
  print("--------------------------------------------------------------");
  for (var person in _personsList) {
    print(_getResult(person));
    print("--------------------------------------------------------------");
  }
}

String _getResult(_Person person) {
  print("Calculating Result of ${person.name}:");
  if (_isALegendaryGuy(person))
    return "OMG Legendary Aaradhya Gopal Nepal is using our software. No doubt that you will be rich in future";
  final value= switch (person) {
    _LowerClass(dailyIncome: var plus, dailyExpense: var minus) =>
      _lowerClassCalculate(plus - minus),
    _ => "You will be 100% poor",
  };
  return value;
}

String _lowerClassCalculate(int dailySurplus) {
  return switch (dailySurplus*365) {
    >= _oneBillion => "OMG! You did it. You are another outlier. You will be extremely rich one day.",
    > _oneMillion && <_oneBillion => "Congratulation!!, you despite being on lower class, you will be rich one day. Keep working hard.",
    _oneMillion => "You are on the middle on whether you will be rich or poor, just little push everyday can rich you big heights",
    >_oneLakh && <_oneMillion => "Sorry, you will not be as rich as you expect, but still its okay. You still could be a great guy. Money is not everything once you got enough to fulfill your basic needs",
    _ => "Not fast enough bruh!!, work hard, in this rate you never be rich.",
  };
}

bool _isALegendaryGuy(_Person person) {
  final _Person(name: sweetName) = person;
  return sweetName.toLowerCase().contains("aradhya") ||
      sweetName.toLowerCase().contains("gopal") ||
      sweetName.toLowerCase().contains("nepal");
}

final _personsList = <_Person>[
  _LowerClass("Aaradhya", dailyIncome: 10, dailyExpense: 100),
  _LowerClass("Hari", dailyIncome: 500, dailyExpense: 500),
  _LowerClass("Shyam", dailyIncome: 2000, dailyExpense: 500),
  _LowerClass("Kiran", dailyIncome: 4000, dailyExpense: 500),
];
const int _oneLakh = 100000;
const int _oneMillion = 1000000;
const int _oneBillion = 1000000000;

enum Degree {
  doctor,
  engineer,
  dadBusiness,
  others,
}

abstract class _Person {
  String name;

  _Person(this.name);
}

class _MiddleClass extends _Person {
  ///If the person have one degree, pass one value of [Degree] else pass List of it.
  ///
  /// Eg: var value=Degree.doctor or var value=[Degree.doctor,Degree.engineer]
  dynamic degree;
  int loanOfDegree;

  _MiddleClass(
    super.name, {
    required this.degree,
    required this.loanOfDegree,
  }) : assert(degree is Degree || degree is List<Degree>);
}

class _LowerClass extends _Person {
  int dailyIncome;
  int dailyExpense;

  _LowerClass(
    super.name, {
    required this.dailyIncome,
    required this.dailyExpense,
  });
}

class _UpperClass extends _Person {
  int assets;
  int liabilities;

  _UpperClass(
    super.name, {
    required this.assets,
    required this.liabilities,
  });
}

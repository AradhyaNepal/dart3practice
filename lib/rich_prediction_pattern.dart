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
  print("Calculating Result of ${person.name} ${person.runtimeType}:");
  if (_isALegendaryGuy(person))
    return "OMG Legendary ${person.name} is using our software. No doubt that you will be rich in future";
  final value = switch (person) {
    _LowerClass(dailyIncome: var plus, dailyExpense: var minus) =>
      _lowerClassCalculate(plus - minus),
    _MiddleClass(degree: Degree degree, :var loanOfDegree) =>
      _oneDegreeMiddleCalculate(degree, loanOfDegree),
    _MiddleClass(degree: [Degree degree1, Degree degree2], :var loanOfDegree) =>
      _twoDegreeMiddleCalculate(degree1, degree2, loanOfDegree),
    _MiddleClass(degree: [_, _, ...], :var loanOfDegree) =>
      "Sorry you are jack of all trait, but master of none, so you will never be rich, "
          "because you have already wasted lots of time on University which you could have "
          "spend on actual earning. Plus your $loanOfDegree loan which you need to pay.",
    _UpperClass(:var liabilities,:var assets) when liabilities>0=>
      calculateForUpper([liabilities, assets]),
    _UpperClass(liabilities: var minus, assets: var plus) when (minus<=0 && plus>=_oneMillion)=>"Congratulations! You are already rich due to your assets and no liabilities. "
        "Go and waste it, so that you will use our software next time too ;-).",
    _UpperClass(liabilities: var minus, assets: var plus) when (minus<=0 && plus<_oneMillion)=>"You will be financially stable, but you still need to work hard to be Rich!"
        "Go and waste it, so that you will use our software next time too ;-).",
    _ => "You will be 100% poor",
  };
  return value;
}

String calculateForUpper(List<int> input) {
  if(input case [var minus,var plus]){
    if(plus==0){
      return "You have no assets, except your family money you got nothing to be rich";
    }
    else if(minus>plus){
      return "You have lots of liabilities, at first you need to clear it to be Rich";
    }else{
      return "You are from upper class background, plus less liabilities, so by default you are Rich. No need to waste time using this useless software";
    }
  }else{
    return "Error! There is some problem in the software";
  }
}

String _oneDegreeMiddleCalculate(Degree degree, int loan) {
  if (_haveChosenPerfectCareer(degree)) {
    return "You have chosen best career option on your life. You will be rich with 100% Guarantee.";
  }
  return switch (loan) {
    0 =>
      "You are already rich, do not waste time of using this software. You are smart enough who knows that this software is a scam.",
    <= _oneLakh =>
      "Congratulation! You will  be rich one day. Good job bruh! I am proud of you.",
    > _oneLakh && < _oneMillion =>
      "Sorry you will never be rich, due to your massive student loan",
    _ => "Not only you, your entire 2 generation will be poor",
  };
}

String _twoDegreeMiddleCalculate(Degree degree1, Degree degree2, int loan) {
  if (_haveChosenPerfectCareer(degree1) || _haveChosenPerfectCareer(degree2)) {
    return "You have chosen best career option on your life. You will be rich with 100% Guarantee.";
  }
  return "Sorry we cannot save you. You will be poor, plus you have to pay $loan.";
}

bool _haveChosenPerfectCareer(Degree degree) =>
    degree == Degree.programmer || degree == Degree.doctor;

String _lowerClassCalculate(int dailySurplus) {
  return switch (dailySurplus * 365) {
    >= _oneBillion =>
      "OMG! You did it. You are another outlier. You will be extremely rich one day.",
    > _oneMillion && < _oneBillion =>
      "Congratulation!!, you despite being on lower class, you will be rich one day. Keep working hard.",
    _oneMillion =>
      "You are on the middle on whether you will be rich or poor, just little push everyday can rich you big heights",
    > _oneLakh && < _oneMillion =>
      "Sorry, you will not be as rich as you expect, but still its okay. You still could be a great guy. Money is not everything once you got enough to fulfill your basic needs",
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
  _MiddleClass("Gopal", degree: Degree.programmer, loanOfDegree: 0),
  _MiddleClass("Hari", degree: Degree.programmer, loanOfDegree: 10000000000000),
  _MiddleClass("Shyam", degree: Degree.x, loanOfDegree: 1000000000000),
  _MiddleClass("Kiran",
      degree: [Degree.programmer, Degree.y], loanOfDegree: 1000000000000),
  _MiddleClass("Kira", degree: [Degree.y, Degree.x], loanOfDegree: 0),
  _MiddleClass("Hira", degree: Degree.x, loanOfDegree: 0),
  _MiddleClass("Jira",
      degree: [Degree.y, Degree.x, Degree.others], loanOfDegree: 0),
  _UpperClass("Nepal", assets: 0, liabilities: 1000000000),
  _UpperClass("Hari", assets: 10000, liabilities: 0),
  _UpperClass("Shyam", assets: 0, liabilities: 10000),
  _UpperClass("Kiran", assets: 1000000000, liabilities: 10000),
  _UpperClass("Kira", assets: 100000, liabilities: 1000),
  _UpperClass("Hira", assets: 100000000, liabilities: 10000000000),
];
const int _oneLakh = 100000;
const int _oneMillion = 1000000;
const int _oneBillion = 1000000000;

enum Degree {
  doctor,
  programmer,
  x,
  y,
  z,
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
  }) : assert(degree is Degree || degree is List<Degree>),assert(degree is List && degree.length<2);
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

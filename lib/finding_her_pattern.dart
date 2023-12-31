void main() {
  var [me, she] = _twoPersons;
  _displayTheJourney(me, she);
  [me,she]=[she,me];
  _displayTheJourney(me, she);
}

void _displayTheJourney(_Person me,_Person she) {
  print("Hello!");
  print("Its me ${_getOutput(me)}.");
  print("I am in a journey of finding a person.");
  print("The person is ${_getOutput(she)}.");
  print("I have full faith on myself that I will find that person as fast as possible.");
  print("Wish me a Good Luck :-)");
  print("Bye bye, I am busy finding ${she.nameOfPersonWhichIsReallyBig}, cannot waste further time by talking ;-)");
  print("---------------------------------------------");
}

String _getOutput(_Person person) {
  var _Person(
    nameOfPersonWhichIsReallyBig: name,
    addressOfPersonWhichIsReallyBig: address,
    :age
  ) = person;
  return "$name who lives in $address and is $age years old";
}

final List<_Person> _twoPersons = [
  _Person(
    nameOfPersonWhichIsReallyBig: "Aaradhya Nepal",
    addressOfPersonWhichIsReallyBig: "Biratnagar",
    age: 21,
  ),
  _Person(
    nameOfPersonWhichIsReallyBig: "An Unknown Girl",
    addressOfPersonWhichIsReallyBig: "An Unknown Place",
    age: 18,
  ),
];

class _Person {
  String nameOfPersonWhichIsReallyBig;
  String addressOfPersonWhichIsReallyBig;
  int age;

  _Person({
    required this.age,
    required this.addressOfPersonWhichIsReallyBig,
    required this.nameOfPersonWhichIsReallyBig,
  });
}

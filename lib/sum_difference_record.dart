void main(){
  _positionedRecord();
  _namedRecord();
  _positionedAndNamedRecord();
  _nestedRecord();
}

void _positionedRecord() {
  (int sum,int difference) getSumDifference(int a, int b){
    return (a+b,a-b);
  }
  print("Positioned Record Sum and Difference");
  int a=1;
  int b=2;
  final value=getSumDifference(1, 2);
  var valuePlusOne=value.$1;
  valuePlusOne=valuePlusOne+1;
  print("Sum of $a and $b is ${value.$1}");
  print("Sum of $a and $b plus 1 is $valuePlusOne");
  print("Difference of $a and $b is ${value.$2}");
  print("------------------------");
}

void _namedRecord() {
  ({int sum,int difference}) getSumDifference(int a, int b){
    return (sum:a+b,difference:a-b);
  }
  print("Named Record Sum and Difference");
  int a=1;
  int b=2;
  final value=getSumDifference(1, 2);
  print("Sum of $a and $b is ${value.sum}");
  print("Difference of $a and $b is ${value.difference}");
  print("------------------------");
}


void _positionedAndNamedRecord() {
  (int difference,{int sum}) getSumDifference(int a, int b){
    return (a-b,sum:a+b,);
  }
  print("Positioned and Named Record Sum and Difference");
  int a=1;
  int b=2;
  final value=getSumDifference(1, 2);
  print("Sum of $a and $b is ${value.sum}");
  print("Difference of $a and $b is ${value.$1}");
  print("------------------------");
}

void _nestedRecord() {
  (({int differenceOne,int differenceTwo}),{int sum,}) getSumDifference(int a, int b){
    return ((differenceOne: a-b,differenceTwo: b-a),sum:a+b,);
  }
  print("Positioned and Named Record Sum and Difference");
  int a=1;
  int b=2;
  final value=getSumDifference(1, 2);
  print("Sum of $a and $b is ${value.sum}");
  print("Difference of $a and $b is ${value.$1.differenceOne}");
  print("Difference of $b and $a is ${value.$1.differenceTwo}");
  print("------------------------");
}
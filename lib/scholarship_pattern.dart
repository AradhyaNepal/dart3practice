void main() {
  print("Toppers Student Names");
  print("----------------------");
  print("Science Result:");
  print(_getOutput(forScience: true));
  print("----------------------------------------------------------------");
  print("Commerce Result:");
  print(_getOutput(forScience: false));
  print("----------------------------------------------------------------");
  print("All Result:");
  print(_getOutput(forScience: null));
  print("----------------------------------------------------------------");
}

///Warning: In this method, finding both science and commerce names at the same time is not yet implemented.
///Please do not pass null on [forScience] till this functionality is not implemented.
String _getOutput({required bool? forScience}) {
  return switch (_fetchScholarshipNames(forScience)) {
    [String first, String second] =>
      "Among 2 Scholarship opportunity, First lucky student is $first and Second lucky student is $second",
    [String name] =>
      "Among one Scholarship opportunity, the lucky student is $name",
    _ =>
      "It looks like requested functionality is not yet added in getOutput method",
  };
}

///In [forScience],
///* True means science
///* False means commerce
///* null means all.
///
/// Two seats are allocated for science student and one seat for commerce
List<String> _fetchScholarshipNames(bool? forScience) {
  final scienceList = <String>["Aaradhya", "Gopal"];
  final commerceList = <String>["Nepal"];
  if (forScience == true) {
    return scienceList;
  } else if (forScience == false) {
    return commerceList;
  } else {
    return [...scienceList, ...commerceList];
  }
}

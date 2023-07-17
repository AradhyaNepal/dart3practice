void main() {
  displayScholarshipStudent();
}

void displayScholarshipStudent() {
  print("Toppers Student Names");
  print("----------------------");

  ///True means science, False means commerce and null means all.
  ///
  /// Two seats are allocated for science student and one seat for commerce
  List<String> fetchScholarshipNames(bool? forScience) {
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

  String getOutput({required bool? forScience}) {
    return switch (fetchScholarshipNames(forScience)) {
      [String first, String second] =>
        "Among 2 Scholarship opportunity, First lucky student is $first and Second lucky student is $second",
      [String name] =>
        "Among one Scholarship opportunity, the lucky student is $name",
      _ =>
        "It looks like requested functionality is not yet added in getOutput method",
    };
  }

  print("Science Result:");
  print(getOutput(forScience: true));
  print("Commerce Result:");
  print(getOutput(forScience: false));
  print("All Result:");
  print(getOutput(forScience: null));
  print("----------------------------------------------------------------"
      "------------------------------------------------------------------");
}

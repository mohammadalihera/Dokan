String? validateText(String value, String title) {
  if (value.trim().isEmpty) {
    return title;
  }
  return null;
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);

  if (value != null && value.isNotEmpty) {
    bool hasMatch = regExp.hasMatch(value.trim());
    return hasMatch ? null : 'Invalid email address';
  }

  return "Please give a email";
}

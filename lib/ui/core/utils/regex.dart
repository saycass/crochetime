abstract class Regex {
  static final email = RegExp(
    r"^[\w.!#$%&'*+-/=?^_`{|}~]+@\w+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})*$",
  );

  static final password = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$#!%*?&_]).{8,}$',
  );
}

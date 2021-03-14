class UserAccount {
  static final UserAccount _singleton = UserAccount._internal();
  int user_id;

  factory UserAccount() {
    return _singleton;
  }

  UserAccount._internal();
}

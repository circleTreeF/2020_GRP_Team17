

///This class describe the information of the user who has logged in to this app.
class UserAccount {

  static final UserAccount _singleton = UserAccount._internal();
  ///user_id of this user
  int user_id;
  ///username of this user
  String username;

  factory UserAccount() {
    return _singleton;
  }

  UserAccount._internal();
}

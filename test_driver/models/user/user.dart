class User {
  late String username;
  late String documentNumber;
  late String documentType;
  late String password;
  late String celphone;
  late String email;

  User.documentAndPass(this.documentNumber, this.documentType, this.password);

  User.usernameAndPass(this.username, this.password);

  User.document(this.documentNumber, this.documentType);

  User.celphoneAndEmail(this.celphone, this.email);


  static late User user;

  static User getUser() {
    return user;
  }

  static void setEmailAndPass(User datosUser) {
    user = datosUser;
  }


}

class ExpresionRegular {

  expresionRegularEmail(String text) {
    RegExp emailRegExp =
    new RegExp(r'^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
    bool validacion =emailRegExp.hasMatch(text);
    return validacion;
  }

  expresionRegularPassword(String text){
    RegExp contRegExp = new RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');
    bool validacion = contRegExp.hasMatch(text);
    return validacion;
  }
}

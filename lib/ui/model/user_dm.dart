class TheUserDM {
  String? theName;
  String? theEmail;
  String? theId;
  // we make all the things nullable to avoid crashing
  TheUserDM(
      {required this.theEmail, required this.theName,  this.theId});

  TheUserDM.fromJason(Map<String, dynamic> jason)
      : this(
          theName: jason['theName'],
          theEmail: jason['theEmail'],
          theId: jason['theId'],
        );

  Map<String, dynamic> toJason() {
    return {
      'theName': theName,
      'theEmail': theEmail,
      'theId': theId,
    };
  }
}

class User {
  String debut;
  String fin;
  String justification;

  User({this.debut, this.fin, this.justification});

  static List<User> getUsers() {
    return <User>[
      User(debut: "12:56", fin: "13:05", justification: "le rouleau est terminé"),
      User(debut: "14:00", fin: "14:15", justification: "Autre"),
      User(debut: "10:11", fin: "11:00", justification: "probleme mecanique"),
    ];
  }
}
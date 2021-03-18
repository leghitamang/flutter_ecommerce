class User {
  String uid;
  String name;
  String email;
  String password;
  String address;
  String contact;
  String pp;

  User({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.address,
    this.contact,
    this.pp,
  });

  factory User.fromJson(parsedJson) {
    return User(
      uid: parsedJson['uid'],
      name: parsedJson['name'],
      email: parsedJson['email'],
      password: parsedJson['password'],
      address: parsedJson['address'],
      contact: parsedJson['contact'],
      pp: parsedJson['pp'],
    );
  }

  User getUser() {
    return User(
        uid: 'AOR1',
        name: 'Megan Fox',
        email: 'megan@gmail.com',
        address: 'Los Angels',
        contact: '+107374646',
        pp: 'https://i.pinimg.com/564x/07/5a/e6/075ae61a854542148c9b0098e69a3ac7.jpg');
  }

  updateProfile() {}
}

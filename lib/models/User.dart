class User {
  String id;
  String name;
  String email;
  String avatar;

  User(
    this.id,
    this.name,
    this.email,
    this.avatar,
  );

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, avatar: $avatar}';
  }
}

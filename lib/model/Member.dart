class Member {
  final String login;
  final String avatarUrl;

  Member(this.login, this.avatarUrl) {
    if (login == null) {
      throw ArgumentError("login of Member cannot be null. "
          "Received: '$login'");
    }
    if (avatarUrl == null) {
      throw ArgumentError("AvatarUrl of Member cannot be null. "
          "Received: '$avatarUrl'");
    }
  }

  Member.fromJson(Map json)
      : login = json['login'],
        avatarUrl = json['avatar_url'];

  Map toJson() {
    return {'login': login, 'avatarUrl' : avatarUrl};
  }

}
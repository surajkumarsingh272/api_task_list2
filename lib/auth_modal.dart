class AuthModalClass {
  String? id;
  String? slug;
  String? synopsis;

  AuthModalClass(this.id, this.slug, this.synopsis);

  static AuthModalClass jsonModal(Map<String, dynamic> data) {
    var attr = data["attributes"];
    return AuthModalClass(data["id"], attr["slug"],attr["synopsis"],);
  }
}

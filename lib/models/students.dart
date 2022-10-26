class Students {
  String? name;
  String? id;
  String? batch;

  Students();

  Map<String, dynamic> toJson() => {"name": name, "id": id, "batch": batch};
}

void main() {
  Resep resep = Resep(
      name: "name",
      description: "description",
      info: Info(x: "x", y: "y", z: "z"));
  print(resep.info!.x); //dari pada gini
  print(resep.x); //langsung aja gini dari getter
}

class Bumbu {
  String? name;
  String? description;
  Bumbu({
    required this.name,
    required this.description,
  });
}

class Info {
  String? x;
  String? y;
  String? z;
  Info({
    required this.x,
    required this.y,
    required this.z,
  });
}

class Resep {
  String? name;
  String? description;
  Info? info;

  Resep({
    required this.name,
    required this.description,
    required this.info,
  });
  String get x => info!.x!;
  String get y => info!.y!;
  String get z => info!.z!;
}

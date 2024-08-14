class CityModel {
  int id;
  String name;
  String imageUrl;
  bool isFavorit;

  CityModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      this.isFavorit = false});
}

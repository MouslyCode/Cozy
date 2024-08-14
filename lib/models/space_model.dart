// ignore_for_file: public_member_api_docs, sort_constructors_first
class SpaceModel {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  String? city;
  String? country;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List<String>? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupBoards;

  SpaceModel({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.city,
    this.country,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchens,
    this.numberOfBedrooms,
    this.numberOfCupBoards,
  });

  SpaceModel.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = List<String>.from(json['photos'] ?? []);
    // photos = json['photos'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupBoards = json['number_of_cupboards'];
    numberOfKitchens = json['number_of_kitchens'];
  }
}

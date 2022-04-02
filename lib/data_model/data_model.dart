class DataModel {
  double? distance;
  String? name;
  String? address1;
  String? address2;
  String? pincode;
  String? mobile;
  String? countryCode;
  String? stdCode;
  String? telephone1;
  String? telephone2;
  String? commEmail;
  String? altEmail;
  String? website;
  String? place;
  double? latitude;
  double? longitude;
  String? image;
  DataModel(
      {this.distance,
      this.name,
      this.address1,
      this.address2,
      this.pincode,
      this.mobile,
      this.countryCode,
      this.stdCode,
      this.telephone1,
      this.telephone2,
      this.commEmail,
      this.altEmail,
      this.website,
      this.place,
      this.latitude,
      this.longitude,
      this.image});

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    pincode = json['pincode'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    stdCode = json['std_code'];
    telephone1 = json['telephone_1'];
    telephone2 = json['telephone_2'];
    commEmail = json['comm_email'];
    altEmail = json['alt_email'];
    website = json['website'];
    place = json['place'];
    latitude = double.tryParse(json['latitude']);
    longitude = double.tryParse(json['longitude']);
    image = json['image'];
  }
}

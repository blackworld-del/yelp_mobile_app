class Business {
  String? id;
  String? businessId;
  String? name;
  String? address;
  String? city;
  String? state;
  String? postalCode;
  double? latitude;
  double? longitude;
  double? stars;
  int? reviewCount;
  int? isOpen;
  Map<String, dynamic>? attributes;
  List<String>? categories;
  Map<String, dynamic>? hours;

  Business({
    this.id,
    this.businessId,
    this.name,
    this.address,
    this.city,
    this.state,
    this.postalCode,
    this.latitude,
    this.longitude,
    this.stars,
    this.reviewCount,
    this.isOpen,
    this.attributes,
    this.categories,
    this.hours,
  });

  static Business fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['_id']?['\$oid'],
      businessId: json['business_id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      stars: json['stars']?.toDouble(),
      reviewCount: json['review_count'],
      isOpen: json['is_open'],
      attributes: json['attributes'],
      categories: json['categories']?.cast<String>(),
      hours: json['hours'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': {'\$oid': id},
      'business_id': businessId,
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'latitude': latitude,
      'longitude': longitude,
      'stars': stars,
      'review_count': reviewCount,
      'is_open': isOpen,
      'attributes': attributes,
      'categories': categories,
      'hours': hours,
    };
  }
}

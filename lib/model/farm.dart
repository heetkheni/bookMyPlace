class Farm {
  Location? location;
  String? sId;
  String? ownerId;
  String? name;
  String? size;
  int? capacity;
  List<String>? amenities;
  int? price;
  String? description;
  String? contact;
  List<Photos>? photos;
  List<Availability>? availability;
  List<Null>? reviews;
  int? iV;

  Farm(
      {this.location,
      this.sId,
      this.ownerId,
      this.name,
      this.size,
      this.capacity,
      this.amenities,
      this.price,
      this.description,
      this.contact,
      this.photos,
      this.availability,
      this.reviews,
      this.iV});

  Farm.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
    ownerId = json['ownerId'];
    name = json['name'];
    size = json['size'];
    capacity = json['capacity'];
    amenities = json['amenities'].cast<String>();
    price = json['price'];
    description = json['description'];
    contact = json['contact'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(new Photos.fromJson(v));
      });
    }
    if (json['availability'] != null) {
      availability = <Availability>[];
      json['availability'].forEach((v) {
        availability!.add(new Availability.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Null>[];
      json['reviews'].forEach((v) {
        //reviews!.add( Null.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
    data['ownerId'] = this.ownerId;
    data['name'] = this.name;
    data['size'] = this.size;
    data['capacity'] = this.capacity;
    data['amenities'] = this.amenities;
    data['price'] = this.price;
    data['description'] = this.description;
    data['contact'] = this.contact;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    if (this.availability != null) {
      data['availability'] = this.availability!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      //data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Location {
  String? address;
  int? pincode;
  String? area;

  Location({this.address, this.pincode, this.area});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    pincode = json['pincode'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['area'] = this.area;
    return data;
  }
}

class Photos {
  String? url;
  String? sId;

  Photos({this.url, this.sId});

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['_id'] = this.sId;
    return data;
  }
}

class Availability {
  String? date;
  bool? isAvailable;
  String? sId;

  Availability({this.date, this.isAvailable, this.sId});

  Availability.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    isAvailable = json['isAvailable'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['isAvailable'] = this.isAvailable;
    data['_id'] = this.sId;
    return data;
  }
}

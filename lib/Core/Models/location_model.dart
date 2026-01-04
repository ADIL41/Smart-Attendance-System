import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class OfficeLocation {
  final String id;
  final String name;
  final String address;
  final GeoPoint coordinates;
  final double geofenceRadius;
  final bool isActive;
  final String? createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  OfficeLocation({
    required this.id,
    required this.name,
    required this.address,
    required this.coordinates,
    this.geofenceRadius = 100.0,
    this.isActive = true,
    this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OfficeLocation.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return OfficeLocation(
      id: doc.id,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      coordinates: data['coordinates'],
      geofenceRadius: (data['geofenceRadius'] ?? 100.0).toDouble(),
      isActive: data['isActive'] ?? true,
      createdBy: data['createdBy'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'coordinates': coordinates,
      'geofenceRadius': geofenceRadius,
      'isActive': isActive,
      'createdBy': createdBy,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  double get latitude => coordinates.latitude;
  double get longitude => coordinates.longitude;

  bool isWithinGeofence(GeoPoint userLocation) {
    return calculateDistance(userLocation) <= geofenceRadius;
  }

  double calculateDistance(GeoPoint userLocation) {
    const earthRadius = 6371000.0; 

    final lat1 = _toRadians(latitude);
    final lon1 = _toRadians(longitude);
    final lat2 = _toRadians(userLocation.latitude);
    final lon2 = _toRadians(userLocation.longitude);

    final dLat = lat2 - lat1;
    final dLon = lon2 - lon1;

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * pi / 180;
  }

  @override
  String toString() {
    return 'OfficeLocation(id: $id, name: $name, address: $address)';
  }
}

class UserLocation {
  final double latitude;
  final double longitude;
  final double? accuracy;
  final DateTime timestamp;
  final String? address;
  final bool isMockLocation;

  UserLocation({
    required this.latitude,
    required this.longitude,
    this.accuracy,
    required this.timestamp,
    this.address,
    this.isMockLocation = false,
  });

  GeoPoint toGeoPoint() => GeoPoint(latitude, longitude);

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'accuracy': accuracy,
      'timestamp': timestamp.toIso8601String(),
      'address': address,
      'isMockLocation': isMockLocation,
    };
  }

  bool get isValid {
    final now = DateTime.now();
    final age = now.difference(timestamp).inSeconds;

    return age <= 30 &&
        !isMockLocation &&
        (accuracy == null || accuracy! <= 100);
  }

  @override
  String toString() {
    return 'UserLocation(lat: $latitude, lng: $longitude, accuracy: $accuracy)';
  }
}

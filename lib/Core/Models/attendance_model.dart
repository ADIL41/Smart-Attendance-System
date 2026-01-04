import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum AttendanceStatus { absent, present, leave, late }

class AttendanceRecord {
  final String id;
  final String userId;
  final String userName;
  final String userEmail;
  final String? employeeId;
  final String? department;
  final DateTime date;
  final DateTime checkInTime;
  final DateTime? checkOutTime;
  final GeoPoint checkInLocation;
  final GeoPoint? checkOutLocation;
  final AttendanceStatus status;
  final String? notes;
  final bool biometricVerified;
  final bool isMockLocationDetected;
  final DateTime createdAt;
  final DateTime updatedAt;

  AttendanceRecord({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userEmail,
    this.employeeId,
    this.department,
    required this.date,
    required this.checkInTime,
    this.checkOutTime,
    required this.checkInLocation,
    this.checkOutLocation,
    required this.status,
    this.notes,
    required this.biometricVerified,
    this.isMockLocationDetected = false,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AttendanceRecord.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return AttendanceRecord(
      id: doc.id,
      userId: data['userId'],
      userName: data['userName'],
      userEmail: data['userEmail'],
      employeeId: data['employeeId'],
      department: data['department'],
      date: data['date'].toDate(),
      checkInTime: data['checkInTime'].toDate(),
      checkOutTime: data['checkOutTime']?.toDate(),
      checkInLocation: data['checkInLocation'],
      checkOutLocation: data['checkOutLocation'],
      status: data['status'],
      notes: data['notes'],
      biometricVerified: data['biometricVerified'],
      isMockLocationDetected: data['isMockLocationDetected'],
      createdAt: data['createdAt'].toDate(),
      updatedAt: data['updatedAt'].toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'userName': userName,
    'userEmail': userEmail,
    'employeeId': employeeId,
    'department': department,
    'date': date,
    'checkInTime': checkInTime,
    'checkOutTime': checkOutTime,
    'checkInLocation': checkInLocation,
    'checkOutLocation': checkOutLocation,
    'status': status,
    'notes': notes,
    'biometricVerified': biometricVerified,
    'isMockLocationDetected': isMockLocationDetected,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };

  factory AttendanceRecord.checkIn({
    required String id,
    required String userId,
    required String userName,
    required String userEmail,
    required String? employeeId,
    required String? department,
    required GeoPoint location,
    required bool biometricVerified,
  }) {
    final now = DateTime.now();

    AttendanceStatus status = AttendanceStatus.present;
    final checkInTime = TimeOfDay.fromDateTime(now);
    final officeStart = const TimeOfDay(hour: 9, minute: 0);

    if (checkInTime.hour > officeStart.hour ||
        (checkInTime.hour == officeStart.hour && checkInTime.minute > 30)) {
      status = AttendanceStatus.late;
    }

    return AttendanceRecord(
      id: id,
      userId: userId,
      userName: userName,
      userEmail: userEmail,
      employeeId: employeeId,
      department: department,
      date: DateTime(now.year, now.month, now.day),
      checkInTime: now,
      checkOutTime: null,
      checkInLocation: location,
      checkOutLocation: null,
      status: status,
      notes: null,
      biometricVerified: biometricVerified,
      isMockLocationDetected: false,
      createdAt: now,
      updatedAt: now,
    );
  }

  AttendanceRecord checkOut(GeoPoint location) {
    final now = DateTime.now();
    return copyWith(
      checkOutTime: now,
      checkOutLocation: location,
      updatedAt: now,
    );
  }

  AttendanceRecord copyWith({
    DateTime? checkOutTime,
    GeoPoint? checkOutLocation,
    String? notes,
    AttendanceStatus? status,
    bool? isMockLocationDetected,
    DateTime? updatedAt,
  }) {
    return AttendanceRecord(
      id: id,
      userId: userId,
      userName: userName,
      userEmail: userEmail,
      employeeId: employeeId,
      department: department,
      date: date,
      checkInTime: checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      checkInLocation: checkInLocation,
      checkOutLocation: checkOutLocation ?? this.checkOutLocation,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      biometricVerified: biometricVerified,
      isMockLocationDetected:
          isMockLocationDetected ?? this.isMockLocationDetected,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  bool get isActive => checkOutTime == null;

  bool get isLate {
    final officeStartTime = DateTime(
      checkInTime.year,
      checkInTime.month,
      checkInTime.day,
      9,
      0,
      0,
    );
    final lateThreshold = officeStartTime.add(const Duration(minutes: 30));
    return checkInTime.isAfter(lateThreshold);
  }

  @override
  String toString() {
    return 'AttendanceRecord(id: $id, user: $userName, date: $date, status: $status)';
  }
}

import 'package:flutter/material.dart';

class AttendanceConstants {
  static const TimeOfDay officeStartTime = TimeOfDay(hour: 9, minute: 0);
  static const TimeOfDay officeEndTime = TimeOfDay(hour: 18, minute: 0);
  static const int lateThresholdMinutes = 30;
  static const double halfDayThresholdHours = 4.0;

  static const double defaultGeofenceRadius = 50.0;
  static const double maxCheckInDistance = 100.0;

  static const String attendanceCollection = 'attendance';
  static const String locationsCollection = 'office_locations';

  static const Map<int, String> statusMessages = {
    0: 'Present',
    1: 'Late',
    2: 'Absent',
    3: 'Half Day',
    4: 'On Leave',
  };
}

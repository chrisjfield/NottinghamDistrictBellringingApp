import 'package:flutter/material.dart';

class TowerDetail {
  final String place;
  final String imageLocation;
  final String phoneNumber;
  final String email;
  final String postcode;
  final String doveID;
  final String numberOfBells;
  final String weight;
  final String practiseTime;
  final String serviceTime;
  final String contactName;
  final String dedication;

  TowerDetail(
      {@required this.place,
      @required this.imageLocation,
      @required this.phoneNumber,
      @required this.email,
      @required this.postcode,
      @required this.doveID,
      @required this.numberOfBells,
      @required this.weight,
      @required this.practiseTime,
      @required this.serviceTime,
      this.contactName,
      this.dedication});
}

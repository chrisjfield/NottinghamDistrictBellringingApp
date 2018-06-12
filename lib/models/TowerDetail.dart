import 'package:flutter/material.dart';

class TowerDetail {
  final String place;
  final String dedication;
  final String numberOfBells;
  final String weight;
  final String postcode;
  final String doveID;
  final String imageLocation;
  final String practiseTime;
  final String serviceTime;
  final String contactName;
  final String email;
  final String phoneNumber;

  TowerDetail({
    @required this.place,
    @required this.dedication,
    @required this.numberOfBells,
    @required this.weight,
    @required this.postcode,
    @required this.doveID,
    @required this.imageLocation,
    this.practiseTime,
    this.serviceTime,
    this.contactName,
    this.email,
    this.phoneNumber,
  });
}

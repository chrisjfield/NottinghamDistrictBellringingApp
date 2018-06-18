import 'package:flutter/material.dart';

class EventDetail {
  final String title;
  final DateTime startTime;
  final String location;
  final String description;
  final DateTime endTime;
  final String dedication;
  final String postcode;
  final String doveId;

  EventDetail({
    @required this.title,
    @required this.startTime,
    @required this.location,
    @required this.description,
    this.endTime,
    this.dedication,
    this.postcode,
    this.doveId,
  });
}

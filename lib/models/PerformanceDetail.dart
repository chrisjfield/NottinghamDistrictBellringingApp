import 'package:flutter/material.dart';

class PerformanceDetail {
  final String bellboardId;
  final String association;
  final String date;
  final String duration;
  final String changes;
  final String method;
  final String footnote;
  final String place;
  final List<String> ringers;

  PerformanceDetail({
    @required this.bellboardId,
    this.association,
    this.date,
    this.duration,
    this.changes,
    this.method,
    this.footnote,
    this.place,
    this.ringers,
  });
}

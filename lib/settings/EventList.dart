import '../models/EventDetail.dart';

class EventList {
  static final List<EventDetail> eventList = [
    EventDetail(
      eventID: 1,
      title: 'Bob Doubles Workshop',
      startTime: DateTime(2018, 7, 7, 10),
      location: 'Arnold',
      description:
          '''If you can already reliably ring the treble to Plain Bob Doubles or Minor,'''
          ''' or have started to ring Bob Doubles and want some practice then this is for you.''',
      endTime: DateTime(2018, 7, 7, 12),
      dedication: 'S Mary',
      postcode: 'NG5 8HG',
      doveId: 'ARNOLD',
    ),
    EventDetail(
      eventID: 2,
      title: 'Bob Triples Workshop',
      startTime: DateTime(2018, 7, 7, 10),
      location: 'Attenborough',
      description:
          '''This event is for those who want to move on from Plain Bob Minor'''
          '''or Trebling on 7 or 8 and those wanting to practice Plain Bob Triples or Major.''',
      endTime: DateTime(2018, 7, 7, 12),
      dedication: 'S Mary V',
      postcode: 'NG9 6AS',
      doveId: 'ATTENBOROU',
    ),
    EventDetail(
      eventID: 3,
      title: 'Tower Practise',
      startTime: DateTime(2018, 8, 6, 19, 30),
      location: 'Aspley',
      description: '''Monday night district practise at Aspley.

All abilities welcome, methods will include:
Plain bob, Grandsire, Stedman and Yorkshire Major
''',
      endTime: DateTime(2018, 8, 6, 21),
      dedication: 'S Margaret',
      postcode: 'NG8 5JB',
      doveId: 'NOTTINGMAS',
    ),
    EventDetail(
        eventID: 4,
        title: 'Mini Outing',
        startTime: DateTime(2018, 9, 8, 10),
        location: 'Unknown',
        description: '''Afternoon district outing.

      Normally 3 towers and optional pub dinner.

      Location tbd
'''),
    EventDetail(
      eventID: 5,
      title: 'District Meeting and Barn Dance',
      startTime: DateTime(2018, 10, 6, 16, 30),
      location: 'Nuthall',
      description: '''District Meeting at Nuthall.

Tickets for the Barn dance will be sold, please check future communications.

All abilities welcome, methods will include:
Plain bob, Grandsire, Stedman and Yorkshire Major
''',
      endTime: DateTime(2018, 10, 6, 22),
      dedication: 'S Patrick',
      postcode: 'NG16 1DT',
      doveId: 'NUTHALL',
    ),
    EventDetail(
      eventID: 6,
      title: 'District Meeting',
      startTime: DateTime(2018, 11, 3, 15, 30),
      location: 'Nottingham',
      description: '''District Meeting at All Saints.

Tickets for the Barn dance will be sold, please check future communications.

All abilities welcome, methods will include:
Plain bob, Grandsire, Stedman, plain hunt and little bob royal.
''',
      endTime: DateTime(2018, 11, 3, 17, 00),
      dedication: 'All Saints',
      postcode: 'NG7 4DL',
      doveId: 'NOTTINGM+A',
    ),
    EventDetail(
      eventID: 7,
      title: 'District Meeting and Mince Pies',
      startTime: DateTime(2018, 12, 1, 16),
      location: 'Beeston',
      description: '''District Meeting at Beeston.

Mince pies throught for a Christmas meeting, festive hats welcome!

All abilities welcome, methods will include:
Plain bob, Grandsire, Stedman and Superlative Major.
''',
      endTime: DateTime(2018, 12, 1, 18),
      dedication: 'S John Bapt',
      postcode: 'NG9 2JJ',
      doveId: 'BEESTON',
    ),
    EventDetail(
      eventID: 8,
      title: 'District Meeting and AGM',
      startTime: DateTime(2019, 1, 12, 15),
      location: 'Daybrook',
      description: '''District Meeting at Daybrook.

Service and AGM will follow ringing. Names will be required for a ringers tea nearer the time.

All abilities welcome, methods will include:
Plain bob, Grandsire, Stedman and St Clements.
''',
      endTime: DateTime(2019, 1, 12, 18),
      dedication: 'S Paul',
      postcode: 'NG5 6HW',
      doveId: 'DAYBROOK',
    ),
    EventDetail(
      eventID: 9,
      title: 'District Meeting',
      startTime: DateTime(2019, 2, 2, 15),
      location: 'Nottingham',
      description: '''District Meeting at St Marys.

All abilities welcome, methods will include:
Plain hunt, Plain bob, Grandsire, Stedman and possibly some surpise max.
''',
      endTime: DateTime(2019, 2, 2, 17),
      dedication: 'S Mary V',
      postcode: 'NG1 1PZ',
      doveId: 'NOTTINGM+M',
    ),
    EventDetail(
      eventID: 10,
      title: 'Crawford Cup Heat',
      startTime: DateTime(2019, 3, 9, 14, 30),
      location: 'Attenborough',
      description: '''Nottingham district crawford cup heat.

Names for ringers tea will be required nearer the time.
''',
      endTime: DateTime(2019, 3, 9, 19),
      dedication: 'S Mary V',
      postcode: 'NG9 6AS',
      doveId: 'ATTENBOROU',
    ),
  ];
}

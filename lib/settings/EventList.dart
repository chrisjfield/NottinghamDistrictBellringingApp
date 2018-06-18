import '../models/EventDetail.dart';

class EventList {
  static final List<EventDetail> eventList = [
    EventDetail(
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
      title: 'Tower Practise',
      startTime: DateTime(2018, 8, 6, 19, 30),
      location: 'Aspley',
      description: '''
      Ringers of all abilities are welcome

Want to try something new?

If you would like to try ringing something new or different, take a look at one (or more) of these:

Plain Bob Doubles
Stedman
Double Norwich Court Bob
''',
      endTime: DateTime(2018, 8, 6, 21),
      dedication: 'S Margaret',
      postcode: 'NG8 5JB',
      doveId: 'NOTTINGMAS',
    ),
    EventDetail(
      title: 'Mini Outing',
      startTime: DateTime(2018, 9, 8, 10),
      location: 'Unknown',
      description: '',
    ),
    EventDetail(
      title: 'District Meeting and Barn Dance',
      startTime: DateTime(2018, 10, 6, 16, 30),
      location: 'Nuthall',
      description: '',
      endTime: DateTime(2018, 10, 6, 22),
      dedication: 'S Patrick',
      postcode: 'NG16 1DT',
      doveId: 'NUTHALL',
    ),
    EventDetail(
      title: 'District Meeting',
      startTime: DateTime(2018, 11, 3, 15, 30),
      location: 'Nottingham',
      description: '',
      endTime: DateTime(2018, 11, 3, 17, 00),
      dedication: 'All Saints',
      postcode: 'NG7 4DL',
      doveId: 'NOTTINGM+A',
    ),
    EventDetail(
      title: 'District Meeting and Mince Pies',
      startTime: DateTime(2018, 12, 1, 16),
      location: 'Beeston',
      description: '',
      endTime: DateTime(2018, 12, 1, 18),
      dedication: 'S John Bapt',
      postcode: 'NG9 2JJ',
      doveId: 'BEESTON',
    ),
    EventDetail(
      title: 'District Meeting and AGM',
      startTime: DateTime(2019, 1, 12, 15),
      location: 'Daybrook',
      description: '',
      endTime: DateTime(2019, 1, 12, 18),
      dedication: 'S Paul',
      postcode: 'NG5 6HW',
      doveId: 'DAYBROOK',
    ),
    EventDetail(
      title: 'District Meeting',
      startTime: DateTime(2019, 2, 2, 15),
      location: 'Nottingham',
      description: '',
      endTime: DateTime(2019, 2, 2, 17),
      dedication: 'S Mary V',
      postcode: 'NG1 1PZ',
      doveId: 'NOTTINGM+M',
    ),
    EventDetail(
      title: 'Crawford Cup Heat',
      startTime: DateTime(2019, 3, 9, 14, 30),
      location: 'Attenborough',
      description: '',
      endTime: DateTime(2019, 3, 9, 19),
      dedication: 'S Mary V',
      postcode: 'NG9 6AS',
      doveId: 'ATTENBOROU',
    ),
  ];
}

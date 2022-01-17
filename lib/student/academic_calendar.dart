import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'student_zone.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2022, 1, 1): ['New Year\'s Day'],

  DateTime(2022, 4, 30): ['Eid-ul-Fitr'],

  DateTime(2022, 5, 1): ['Eid-ul-Fitr'],
  DateTime(2022, 5, 1): ['Labor Day'],
  DateTime(2022, 5, 2): ['Eid-ul-Fitr'],
  DateTime(2022, 5, 3): ['Eid-ul-Fitr'],
  DateTime(2022, 5, 4): ['Eid-ul-Fitr'],
  DateTime(2022, 5, 22): ['National Day'],

  
  DateTime(2022, 7, 8): ['Eid-ul-Azha'],
  DateTime(2022, 7, 9): ['Eid-ul-Azha'],
  DateTime(2022, 7, 10): ['Eid-ul-Azha'],
  DateTime(2022, 7, 11): ['Eid-ul-Azha'],
  DateTime(2022, 7, 12): ['Eid-ul-Azha'],
  DateTime(2022, 7, 30): ['Islamic New Year'],

  
  DateTime(2022, 9, 26): ['September 26 Revolution Day'],

  DateTime(2022, 10, 8): ['Prophets Birth Anniversary'],
  DateTime(2022, 10, 14): ['Actoper 14 Revolution Day'],
  
  DateTime(2022, 11, 30): ['Independence Day'],
 
};

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List> _events;
  late List _selectedEvents;
 late CalendarController _calendarController;
  

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      DateTime(2022, 1, 1): ['New Year\'s Day'],

  DateTime(2022, 4, 30): ['Eid-ul-Fitr'],

  DateTime(2022, 5, 1): ['Eid-ul-Fitr'],
  DateTime(2022, 5, 1): ['Labor Day'],
  DateTime(2022, 5, 2): ['Eid-ul-Fitr'],
  DateTime(2022, 5, 3): ['Eid-ul-Fitr'],
  DateTime(2022, 5, 4): ['Eid-ul-Fitr'],
  DateTime(2022, 5, 22): ['National Day'],

  
  DateTime(2022, 7, 8): ['Eid-ul-Azha'],
  DateTime(2022, 7, 9): ['Eid-ul-Azha'],
  DateTime(2022, 7, 10): ['Eid-ul-Azha'],
  DateTime(2022, 7, 11): ['Eid-ul-Azha'],
  DateTime(2022, 7, 12): ['Eid-ul-Azha'],
  DateTime(2022, 7, 30): ['Islamic New Year'],

  
  DateTime(2022, 9, 26): ['September 26 Revolution Day'],

  DateTime(2022, 10, 8): ['Prophets Birth Anniversary'],
  DateTime(2022, 10, 14): ['Actoper 14 Revolution Day'],
  
  DateTime(2022, 11, 30): ['Independence Day'],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
     _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return StudentZone();
              }));
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          backgroundColor: Color(0xfff5435d),
          centerTitle: true,
          title: Text(
            'ACADEMIC CALENDAR',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            _buildTableCalendar(),
            const SizedBox(height: 10.0),
            Expanded(child: _buildEventList()),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        todayColor: Theme.of(context).primaryColor,
        holidayStyle: TextStyle().copyWith(color: Colors.red[900]),
        markersColor: Theme.of(context).primaryColor,
        todayStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.red[900]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, events) => Container(
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xff002c51),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            date.day.toString(),
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        todayDayBuilder: (context, date, events) => Container(
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xff53c0c7),
              borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            date.day.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      onDaySelected: (date, events, _) {
        setState(() {
          _selectedEvents = events;
        });
      }, 
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Center(child: Text(event.toString())),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationManagerState();
  }
}

class _NotificationManagerState extends State<NotificationManager> {

  _sendNotif(int time) async {

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    """var scheduledNotificationDateTime =
        new DateTime.now().add(new Duration(seconds: time));
    var androidPlatformChannelSpecifics =
        new AndroidNotificationDetails('ToDo', 'ToDo', 'ToDo List');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'To Do List',
        'Check your to-do list',
        scheduledNotificationDateTime,
        platformChannelSpecifics);

    var androidPlatformChannelSpecifics =
    AndroidNotificationDetails('repeating channel id',
        'repeating channel name', 'repeating description');
    var iOSPlatformChannelSpecifics =
    IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.EveryMinute, platformChannelSpecifics);
""";
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              _sendNotif(30);
            },
            child: Text('30 Seconds'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              _sendNotif(60);
            },
            child: Text('1 Minute'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              _sendNotif(900);
            },
            child: Text('15 Minutes'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              _sendNotif(1800);
            },
            child: Text('30 Minutes'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              _sendNotif(3600);
            },
            child: Text('1 Hour'),
          ),
        ),
      ],
    );
  }
}

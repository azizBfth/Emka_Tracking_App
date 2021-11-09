import 'package:emka_gps/api/notifcationService.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotifTestScreen extends StatefulWidget {
  const NotifTestScreen({Key? key}) : super(key: key);

  @override
  _NotifTestScreenState createState() => _NotifTestScreenState();
}

class _NotifTestScreenState extends State<NotifTestScreen> {
  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                NotificationService().cancelAllNotifications();
              },
              child: Container(
                height: 40,
                width: 200,
                color: Colors.red,
                child: Center(
                  child: Text(
                    "Cancel All Notifications",
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                NotificationService().showNotification(1, "Renault 9999 TU 999", "SURVITESSE", 10);
              },
              child: Container(
                height: 40,
                width: 200,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "Show Notification"
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
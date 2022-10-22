import 'package:ditumbas/notification_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationList();
}

class _NotificationList extends State<NotificationList> {
  List<RemoteMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        setState(() {
          _messages = [..._messages, message];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_messages.isEmpty) {
      return Center(
        child: Column(
          children: const [
            SizedBox(
              height: 200,
            ),
            Icon(
              Icons.notifications_off_rounded,
              size: 125,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Belum ada notifikasi',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        RemoteMessage message = _messages[index];
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          title: Text(
            message.notification?.title ?? 'N/D',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            DateFormat('dd-MM-yyyy')
                .add_Hm()
                .format(message.sentTime ?? DateTime.now()),
            style: const TextStyle(
              height: 2,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          trailing: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.notifications,
              size: 25,
              color: Colors.black,
            ),
          ),
          onTap: () => Navigator.pushNamed(
            context,
            '/message',
            arguments: NotificationArguments(message, false),
          ),
        );
      },
    );
  }
}

import 'package:ditumbas/color_extension.dart';
import 'package:ditumbas/notification_list.dart';
import 'package:flutter/material.dart';

class NotificationChecker extends StatefulWidget {
  const NotificationChecker({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationChecker();
}

class _NotificationChecker extends State<NotificationChecker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifikasi DITUMBAS',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: '#212121'.toColor(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NotificationList(),
          ],
        ),
      ),
    );
  }
}

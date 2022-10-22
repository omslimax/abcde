import 'package:ditumbas/color_extension.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationArguments {
  final RemoteMessage message;
  final bool openedApplication;
  NotificationArguments(this.message, this.openedApplication);
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationArguments args =
        ModalRoute.of(context)!.settings.arguments! as NotificationArguments;
    RemoteMessage message = args.message;
    RemoteNotification? notification = message.notification;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Notifikasi',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: '#212121'.toColor(),
      body: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
              )
            ],
          ),
          child: Column(
            children: [
              if (notification != null) ...[
                Column(
                  children: [
                    img(
                      notification.android!.imageUrl,
                    ),
                    viewDataDate(
                      DateFormat('dd-MM-yyyy')
                          .add_Hm()
                          .format(message.sentTime ?? DateTime.now()),
                    ),
                    viewDataTitle(
                      notification.title,
                    ),
                    viewData(
                      notification.body,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget img(String? value) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 4.0,
        child: Center(
          child: Image.network(
            value ??
                'https://lh3.googleusercontent.com/FTSrJGio3d4X3-DfNN9Lis9RGhVDTGIK2SZ6gkEW9shbe-ORnWhh78h8EX7C55y5Ig3aPczrOg3dCoRQayhKcePVzL_JvFbtJaO7xFkDH2oVWa5r8nomzpUwsNa72CqfFEJi8oz0xjdpVR7A0vzHFwD70taWUxUHCmMxF4K3gf4G-fYuNu-cavMK3i6Xm_yeCJNlEP-pdxTvnDmXCiEb-cFC3c_f8YC--1sUiTpKjbcUw0B4xdpij_ZOqUhRdffGKDs1fOCBeC0WBJHqrGFGlmlXd1GwrlH0UFeo86rIP5RVMJ0A2_iEZDGdVNaaf8Jnt5nsbRZXBRy3Wx2K8NQnDdbgnSNNDey0480Sl3sl79vnlYUxEPC1OdPI3ZsXm4Jw0u4in8m9qhLuOpo0b3IJtOljrhrhgy8B_HXO0oT2zUBwNezluhYe8xvjZKktIRjas5lvDfLwaoSqupjeHBovnIAF7QqETuukxr_hJlIfl8aahIJ5WzAH7TESO_Rkmfxl_sbcLr5Ay8KbWjRAEljs-NZcwIeBWJdK3RxZkgoq9Gzrd2NEl6yZMaJe_Qe39iXuqLyG1bbPCule4z_pTDrwmFuPkC5Rq1S7s-aScrdds4S9urNYrzCzAQDtYqs3_BCEkFohoCeFEEul4-uF1iaaJc3VP1bKcZZCcYjkSvxCTSk8u341hVcBLzIlkPjoxfhdO76jmVUoAl4kmeN9qdENAUrWPwqd3y8J0-QcmgHPyRtgHpUKHJ_d90Cf7_qmucNgVMcjNRZhoGUYb7cI1v_7Lt2hN-KL6qfMRyi0E2WRrpGd8ylgeNRIQlOInem42frGIHXFwzvzUEknyiuY5ZqI8lEJd1bz3rhIhjoTqrXWHNuiofJMu1cuhXT8kx9sFH3S3l7rbjJ9_6pWf4V2kUzq14ChL8sAEcYVmDZPhlE=w800-h400',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget viewDataDate(String? value) {
    return Padding(
      padding: const EdgeInsets.only(right: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            value ?? 'N/A',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget viewDataTitle(String? value) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, top: 10),
      child: Row(
        children: [
          Text(
            value ?? 'N/A',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget viewData(String? value) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, top: 10, bottom: 10),
      child: Column(
        children: [
          Text(
            value ?? 'N/A',
            style: const TextStyle(
              height: 1.5,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

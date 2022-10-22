import 'package:ditumbas/color_extension.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#212121'.toColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.network_check_rounded,
              size: 125,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Periksa koneksi internet Anda',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

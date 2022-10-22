import 'package:flutter/material.dart';

class NetworkDisconnect extends StatelessWidget {
  const NetworkDisconnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      child: const Center(
        child: Text(
          'Koneksi Terputus',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

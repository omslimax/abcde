import 'package:ditumbas/network_disconnect.dart';
import 'package:ditumbas/no_internet.dart';
import 'package:ditumbas/start_page.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class NetworkChecker extends StatefulWidget {
  const NetworkChecker({Key? key}) : super(key: key);

  @override
  State<NetworkChecker> createState() => _NetworkCheckerState();
}

class _NetworkCheckerState extends State<NetworkChecker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Visibility(
            visible: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected,
            child: const NetworkDisconnect(),
          ),
          Provider.of<InternetConnectionStatus>(context) ==
                  InternetConnectionStatus.disconnected
              ? const Expanded(
                  child: NoInternet(),
                )
              : const Expanded(
                  child: StartPage(),
                )
        ],
      ),
    );
  }
}

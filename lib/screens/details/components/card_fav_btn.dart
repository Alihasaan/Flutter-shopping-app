import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_svg/svg.dart';
import 'card_counter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import '../detail_screen.dart';

class CardCounterwithFavBtn extends StatefulWidget {
  final Product product;
  CardCounterwithFavBtn(this.product);

  @override
  _CardCounterwithFavBtnState createState() => _CardCounterwithFavBtnState();
}

class _CardCounterwithFavBtnState extends State<CardCounterwithFavBtn> {
  bool condition = false;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  @override
  void initState() {
    super.initState();
    initializing();
  }

  void initializing() async {
    androidInitializationSettings = AndroidInitializationSettings('app_icon');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        androidInitializationSettings, iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void showNotifications() async {
    await notification();
    condition = true;
  }

  Future<void> notification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            'Channel ID', 'Channel title', 'channel body',
            priority: Priority.High,
            importance: Importance.Max,
            ongoing: true,
            autoCancel: true,
            ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0,
        "New Favorite Item",
        "${widget.product.title} was added to your Favorites.",
        notificationDetails);
  }

  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      print(payLoad);
    }
    print(condition);
    condition == true
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(widget.product)))
        : null;

    // we can set navigator to navigate another screen
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("Notification Click");
            },
            child: Text("Okay")),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CardCounter(),
        RaisedButton(
          onPressed: () => showNotifications(),
          elevation: 0,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: Color(0xFFFF6464),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset("assets/icons/heart.svg"),
          ),
        )
      ],
    );
  }
}

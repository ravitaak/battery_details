import 'dart:async';
import 'package:battery_details/model/android_battery_info.dart';
import 'package:flutter/services.dart';

class BatteryDetails {
  static const MethodChannel methodChannel = MethodChannel('com.codedrink.battery_details/channel');
  static const EventChannel streamChannel = EventChannel("com.codedrink.battery_details/stream");

  /// Returns the battery info as a single API call
  Future<AndroidBatteryInfo?> get androidBatteryInfo async {
    try {
      final batteryInfo = await methodChannel.invokeMethod('getBatteryInfo');
      final converted = AndroidBatteryInfo.fromJson(Map.from(batteryInfo));
      return converted;
    } on PlatformException catch (e) {
      print(e.message);
      return null;
    }
  }

  /// Returns a stream of [BatteryInfo] data that is pushed out to the
  /// subscribers on updates
  Stream<AndroidBatteryInfo?> get androidBatteryInfoStream {
    return streamChannel.receiveBroadcastStream().map((data) {
      try {
        final converted = AndroidBatteryInfo.fromJson(Map.from(data));
        return converted;
      } on PlatformException catch (e) {
        print(e.message);
        return null;
      }
    });
  }
}

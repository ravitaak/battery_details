import 'package:battery_details/enums/charging_status.dart';

/// Android Battery Info data model
class AndroidBatteryInfo {
  int? currentNow = -1;
  int? currentAverage = -1;
  int? chargeTimeRemaining = -1;
  String? health = "unknown";
  String? pluggedStatus = "unknown";
  String? technology = "unknown";
  int? batteryLevel;
  int? batteryCapacity;
  int? remainingEnergy = -1;
  int? scale;
  double? temperature = -1;
  int? voltage = -1;
  bool? present = true;
  ChargingStatus? chargingStatus;

  AndroidBatteryInfo({
    this.batteryCapacity,
    this.batteryLevel,
    this.chargeTimeRemaining,
    this.chargingStatus,
    this.currentAverage,
    this.currentNow,
    this.health,
    this.pluggedStatus,
    this.present,
    this.remainingEnergy,
    this.scale,
    this.technology,
    this.temperature,
    this.voltage,
  });

  /// Serialise data back to json from the model
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["batteryCapacity"] = batteryCapacity;
    data["batteryLevel"] = batteryLevel;
    data["chargingStatus"] = chargingStatus;
    data["chargeTimeRemaining"] = chargeTimeRemaining;
    data["currentAverage"] = currentAverage;
    data["currentNow"] = currentNow;
    data["health"] = health;
    data["pluggedStatus"] = pluggedStatus;
    data["present"] = present;
    data["scale"] = scale;
    data["remainingEnergy"] = remainingEnergy;
    data["temperature"] = temperature;
    data["technology"] = technology;
    data["voltage"] = voltage;
    return data;
  }

  /// Retrieves the chargin status from the native value
  ChargingStatus getChargingStatus(String? status) {
    switch (status) {
      case "charging":
        return ChargingStatus.Charging;
      case "discharging":
        return ChargingStatus.Discharging;
      case "full":
        return ChargingStatus.Full;
      default:
        return ChargingStatus.Unknown;
    }
  }

  /// Deserialize data from json
  AndroidBatteryInfo.fromJson(Map<String, dynamic> json) {
    batteryCapacity = json["batteryCapacity"];
    batteryLevel = json["batteryLevel"];
    chargingStatus = getChargingStatus(json["chargingStatus"]);
    chargeTimeRemaining = json["chargeTimeRemaining"];
    currentAverage = json["currentAverage"];
    currentNow = json["currentNow"];
    health = json["health"];
    pluggedStatus = json["pluggedStatus"];
    present = json["present"];
    scale = json["scale"];
    remainingEnergy = json["remainingEnergy"];
    technology = json["technology"];
    temperature = json["temperature"];
    voltage = json["voltage"];
  }
}

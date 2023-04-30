import 'package:check_in_champ/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService{
  Location location =Location();
  late LocationData _locData;

  Future<Map<String, double?>?> initializeAndGetLocation(BuildContext context)async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    //first checking location is enabled or not in the device
    serviceEnabled = await location.serviceEnabled();
    if(!serviceEnabled)
      {
        serviceEnabled = await location.requestService();
        if(!serviceEnabled){
          Utils.showSnackBar('please Enable Location Service', context);
          return null;
        }
      }

    //check if service is enabled then ask permission for location from user
    permissionGranted = await location.hasPermission();
    if(permissionGranted == PermissionStatus.denied){
      permissionGranted = await location.requestPermission();
      if(permissionGranted!= PermissionStatus.granted){
        Utils.showSnackBar('Please allow Location Access', context);
        return null;
      }
    }

    //After permission is granted then return the coordinates
    _locData = await location.getLocation();
    return {
      'latitude': _locData.latitude,
      'longitude': _locData.longitude,
    };
  }
}
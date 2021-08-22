import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/animated_button.dart';
import 'package:matchangoo/core/components/utils/adaptive_dialoger.dart';
import 'package:matchangoo/core/constants/app_constants.dart';
import 'package:matchangoo/core/init/geolocation/location_manager.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/core/structure/navigation/navigation_manager.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                AppConstants.APP_NAME,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedButton(
                  title: 'login with your gmail',
                  onPressed: () {
                    NavigationManager.instance.navigateToPage(path: '/phoneverification', arguments: 'nothing');
                    print('gmail');
                  },
                ),
                AnimatedButton(
                    title: 'sign in with your phone',
                    onPressed: () {
                      NavigationManager.instance.navigateToPage(path: '/identification', arguments: 'nothing');
                      /*
                       LocationManager _locationManager = sl.get<LocationManager>();
                      _locationManager.location.requestPermission();
                      _locationManager.location.hasPermission().then((value) => print(value));
                      _locationManager.location.getLocation().then((value) => print('location is ' + value.toString()));*/
                      print('phone.');
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/init/app_cubit/app_cubit.dart';

import '../../../../core/init/get_them_all/get_it_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the homepage.', style: Theme.of(context).textTheme.headline4),
            TextButton(
                onPressed: () {
                  sl.get<AppCubit>().changeTheme();
                },
                child: Text(
                  'change the current theme',
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.cyan),
                ))
          ],
        ),
      ),
    );
  }
}

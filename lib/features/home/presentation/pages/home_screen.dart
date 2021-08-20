import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/init/theme_manager/theme_manager_cubit.dart';
import 'package:matchangoo/core/structure/utils/enums/theme_types.dart';

class HomeScreen extends StatelessWidget {
  final String arguements;
  const HomeScreen({Key? key, required this.arguements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the homepage.', style: Theme.of(context).textTheme.headline4),
            Text(arguements),
            TextButton(
                onPressed: () {
                  context.read<ThemeManagerCubit>().changeTheme();
                },
                child: Text('sasaa'))
          ],
        ),
      ),
    );
  }
}

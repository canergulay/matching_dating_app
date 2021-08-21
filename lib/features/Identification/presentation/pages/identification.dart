import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/Identification/presentation/bloc/identification_bloc.dart';

class Identification extends StatefulWidget {
  Identification({Key? key}) : super(key: key);

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IdentificationBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
              body: Center(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                print('changed');
                print(page);
              },
              itemBuilder: (contexta, index) {
                return context.read<IdentificationBloc>().identificationPages(context)[index];
              },
              itemCount: context.read<IdentificationBloc>().identificationPages(context).length,
            ),
          ));
        },
      ),
    );
  }
}

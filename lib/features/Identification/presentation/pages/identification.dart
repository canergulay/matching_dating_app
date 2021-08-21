import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/adaptive_dialoger.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
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
              body: Column(
            children: [
              Expanded(
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
              ),
              GestureDetector(
                  onTap: () {
                    sl.get<AdaptiveDialoger>().showBasicAdaptiveAlert(context, 'About You',
                        'We will ask you to give us some info about you, which we can use in order to match you with other people.');
                  },
                  child: Text('sa'))
            ],
          ));
        },
      ),
    );
  }
}

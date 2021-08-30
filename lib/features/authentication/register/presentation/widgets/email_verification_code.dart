import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/ui/theme/palette.dart';
import 'white_containerwpinkshadow.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../../../../core/components/utils/on_off_cubit.dart';
import '../../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../../core/structure/utils/extensions/sizedBox_extension.dart';
import '../bloc/register_bloc.dart';
import 'activatable_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:flutter/material.dart';

Container emailCodeVerificationCodeEnter(BuildContext contextOld) => Container(
      child: BlocProvider(
        create: (context) => OnOffCubit(),
        child: Builder(
            builder: (context) => WhiteContainerWPinkShadow(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox().heightSpacer(context, 2),
                      titleOne(context: context, text: 'Verify your email'),
                      titleOne(context: context, text: 'account!'),
                      SizedBox().heightSpacer(context, 1),
                      Text(
                        'Enter the code we sent your adress',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black54),
                      ),
                      SizedBox().heightSpacer(context, 1),
                      Text(
                        contextOld.read<RegisterBloc>().emailAdress,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox().heightSpacer(context, 2),
                      Padding(
                        padding: EdgeInsets.only(left: context.widthUnit * 10, right: context.widthUnit * 10),
                        child: PinInputTextField(
                          decoration: BoxLooseDecoration(
                            strokeColorBuilder: PinListenColorBuilder(Palette.MPINK.withOpacity(0.3), Colors.black26.withOpacity(0.3)),
                          ),
                          cursor: Cursor(color: Colors.black, width: 2, height: 10),
                          pinLength: 5,
                          autoFocus: true,
                          onChanged: (code) {
                            if (code.length == 5) {
                              BlocProvider.of<OnOffCubit>(context).on();
                              BlocProvider.of<RegisterBloc>(contextOld).setCode = code;
                              BlocProvider.of<RegisterBloc>(contextOld).verifyCodeAndMail(context);
                            }
                          },
                          onSubmit: (code) {
                            BlocProvider.of<OnOffCubit>(context).on();
                            BlocProvider.of<RegisterBloc>(contextOld).setCode = code;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox().heightSpacer(context, 2),
                      BlocBuilder<OnOffCubit, bool>(
                        builder: (contexta, state) {
                          return getAnimatedButton(state, context, () {
                            BlocProvider.of<RegisterBloc>(contextOld).verifyCodeAndMail(context);
                          });
                        },
                      ),
                    ],
                  ),
                )),
      ),
    );

AutoSizeText titleOne({required BuildContext context, required String text}) {
  return AutoSizeText(
    text,
    style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: context.widthUnit * 6, color: Palette.BIZIMBLACK, fontWeight: FontWeight.bold),
  );
}

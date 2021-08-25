import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/on_off_cubit.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/structure/utils/extensions/sizedBox_extension.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/register_bloc.dart';
import 'package:matchangoo/features/authentication/register/presentation/widgets/activatable_button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:flutter/material.dart';

Container emailCodeVerificationCodeEnter(BuildContext contextOld) => Container(
      child: BlocProvider(
        create: (context) => OnOffCubit(),
        child: Builder(
            builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('please enter your verification code !'),
                    SizedBox().heightSpacer(context, 2),
                    Padding(
                      padding: EdgeInsets.only(left: context.widthUnit * 10, right: context.widthUnit * 10),
                      child: PinInputTextField(
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
                    BlocBuilder<OnOffCubit, bool>(
                      builder: (contexta, state) {
                        return getAnimatedButton(state, context, () {
                          BlocProvider.of<RegisterBloc>(contextOld).verifyCodeAndMail(context);
                        });
                      },
                    ),
                  ],
                )),
      ),
    );

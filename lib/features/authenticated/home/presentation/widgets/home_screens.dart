import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/authenticated/chat/presentation/pages/chat.dart';
import 'package:matchangoo/features/authenticated/home/presentation/bloc/bottom_navbar_cubit.dart';
import 'package:matchangoo/features/authenticated/home/presentation/pages/home_screen.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/pages/matching_stack_screen.dart';
import 'package:matchangoo/features/authenticated/profile/presentation/pages/profile.dart';
import 'package:matchangoo/features/authenticated/settings/presentation/pages/settings.dart';

List<Widget> screens = [const MatchingScreen(), const Settings(), const Chat(), const Profile()];

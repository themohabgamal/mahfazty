import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/networking/firebase_helper.dart';
import 'package:mahfazty/core/routing/routes.dart';
import 'package:mahfazty/features/home/home_screen.dart';
import 'package:mahfazty/features/login/logic/cubit/login_cubit.dart';

import '../../features/login/ui/screens/login_screen.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(FirebaseHelper()),
                  child: const LoginScreen(),
                ));
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(FirebaseHelper()),
                  child: const HomeScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (context) => const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("No Route Found"),
      ),
    );
  }
}

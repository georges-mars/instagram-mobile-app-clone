import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:instagram_clone/presentation/routes.dart';

import 'core/services/auth_service.dart';
import 'core/theme/theme.dart';
import 'data/repositories/auth_repository.dart';
import 'presentation/bloc/auth_bloc/auth_bloc.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const InstagramAppClone());
  
  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();

}

class InstagramAppClone extends StatelessWidget {
  const InstagramAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository(AuthService()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: InstagramAppCloneAppTheme.darkTheme,
          theme: InstagramAppCloneAppTheme.lightTheme,
          initialRoute: '/login',
          routes: routes,
        ),
      ),
    );
  }
}

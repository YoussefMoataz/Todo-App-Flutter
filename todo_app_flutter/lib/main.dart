import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/core/input_fields/input_fields_cubit.dart';
import 'package:todo_app_flutter/core/theme/theme_cubit.dart';
import 'package:todo_app_flutter/core/todo_list/todo_list_cubit.dart';
import 'package:todo_app_flutter/routing.dart';

void main() {
  runApp(
    BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<InputFieldsCubit>(
          create: (context) => InputFieldsCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: Routing.router,
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  brightness: Brightness.light, seedColor: Colors.deepPurple),
              useMaterial3: true,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: ZoomPageTransitionsBuilder(
                    allowEnterRouteSnapshotting: false,
                  ),
                },
              ),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  brightness: Brightness.dark, seedColor: Colors.deepOrange),
              useMaterial3: true,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: ZoomPageTransitionsBuilder(
                    allowEnterRouteSnapshotting: false,
                  ),
                },
              ),
            ),
            themeMode: state.isSystem
                ? ThemeMode.system
                : state.isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
          );
        },
      ),
    );
  }
}

import 'package:bloc_example/index.dart';

void main() async {
  await ApplicationInitialize().make();
  runApp(
    StateInitialize(
      child: ProductLocalization(
        child: _MyApp(),
      ),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  _MyApp();

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      /// This is the title of the app
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,

      /// Theme
      theme: CustomTheme().themeData,

      /// Router
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),

      /// Localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

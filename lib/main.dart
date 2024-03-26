import 'package:bloc_example/feature/index.dart';

void main() async {
  ///3192cf66-376d-40dc-a6be-79291ead3cc7
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

  // This widget is the root of your application.
  final _appRouter = Locator.appRouter;
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


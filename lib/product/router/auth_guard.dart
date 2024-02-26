import 'package:auto_route/auto_route.dart';
import 'package:bloc_example/product/router/app_router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable

/// AuthGuard
final class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final auth = FirebaseAuth.instance;
    // Firebase Authentication ile kullanıcı durumunu kontrol et
    final currentUser = auth.currentUser;

    if (currentUser != null) {
      // Kullanıcı giriş yapmışsa ana sayfaya yönlendir
      router.push(const HomeRoute());
    } else {
      // Kullanıcı giriş yapmamışsa giriş sayfasına yönlendir
      router.push(LoginRoute());
    }
  }
}

import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/box_shadow_builder/bindings/box_shadow_builder_binding.dart';
import '../modules/box_shadow_builder/views/box_shadow_builder_view.dart';
import '../modules/container_builder/bindings/container_builder_binding.dart';
import '../modules/container_builder/views/container_builder_view.dart';
import '../modules/gradient_builder/bindings/gradient_builder_binding.dart';
import '../modules/gradient_builder/views/gradient_builder_view.dart';
import '../modules/gradient_builder/views/gradient_public_template_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/widget_builder/bindings/widget_builder_binding.dart';
import '../modules/widget_builder/views/widget_builder_view.dart';
import '../services/auth_middlerware.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.CONTAINER_BUILDER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      bindings: [AuthBinding()],
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
      //   middlewares: [AuthMiddleware()],
      children: [
        GetPage(
          name: _Paths.AUTH,
          page: () => const AuthView(),
          binding: AuthBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.GRADIENT_BUILDER,
      page: () => const GradientBuilderView(),
      binding: GradientBuilderBinding(),
      middlewares: [AuthMiddleware()],
      bindings: [ContainerBuilderBinding()],
    ),
    GetPage(
      name: _Paths.GRADIENT_PUBLIC,
      page: () => const GradientPublicView(),
      binding: GradientBuilderBinding(),
      bindings: [ContainerBuilderBinding(), AuthBinding()],
    ),
    GetPage(
      name: _Paths.CONTAINER_BUILDER,
      page: () => const ContainerBuilderView(),
      binding: ContainerBuilderBinding(),
    ),
    GetPage(
      name: _Paths.BOX_SHADOW_BUILDER,
      page: () => const BoxShadowBuilderView(),
      binding: BoxShadowBuilderBinding(),
      bindings: [AuthBinding(), ContainerBuilderBinding()],
    ),
    GetPage(
      name: _Paths.WIDGET_BUILDER,
      page: () => const WidgetBuilderView(),
      binding: WidgetBuilderBinding(),
    ),
  ];

  AppPages._();
}

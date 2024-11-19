import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/add_or_edit_contact_screen/views/screens/add_or_edit_contact_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/views/screens/view_contacts_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/views/screens/view_favorite_contacts_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/views/screens/main_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/views/screens/view_contact_profile_screen.dart';
import 'package:houzeo_app/presentation/routes/houzeo_route_names.dart';
import 'package:houzeo_app/utils/transitions/screen_transitions.dart';

class HouzeoRouteConfig {
  static final router = GoRouter(initialLocation: '/mainScreen', routes: [
    GoRoute(
        name: HouzeoRouteNames.mianScreen,
        path: '/mainScreen',
        pageBuilder: (context, state) {
          return const MaterialPage(child: MainScreen());
        },
        routes: [
          GoRoute(
            name: HouzeoRouteNames.favoriteContactsScreen,
            path: 'favorites',
            pageBuilder: (context, state) {
              return const MaterialPage(child: ViewFavoriteContactsScreen());
            },
          ),
          GoRoute(
              name: HouzeoRouteNames.contactsScreen,
              path: 'contacts',
              pageBuilder: (context, state) {
                return const MaterialPage(child: ViewContactsScreen());
              },
              routes: [
                GoRoute(
                    name: HouzeoRouteNames.addOreditContactScreen,
                    path: 'addOreditContact/:id',
                    pageBuilder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return CustomTransitionPage(
                          child: AddOrEditContactScreen(
                              id: id != 'null' ? int.parse(id) : null),
                          transitionDuration: const Duration(milliseconds: 330),
                          transitionsBuilder:
                              ScreenTransitions().slideTransitionRightToLeft);
                    }),
                GoRoute(
                    name: HouzeoRouteNames.contactProfileScreen,
                    path: 'contactProfile/:id',
                    pageBuilder: (context, state) {
                      final id = state.pathParameters['id'];
                      return CustomTransitionPage(
                          child: ViewContactProfileScreen(id: int.parse(id!)),
                          transitionDuration: const Duration(milliseconds: 330),
                          transitionsBuilder:
                              ScreenTransitions().slideTransitionRightToLeft);
                    })
              ])
        ])
  ]);
}

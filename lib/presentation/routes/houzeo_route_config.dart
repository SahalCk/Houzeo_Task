import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/view_contact_profile_screen/edit_contact_screen/views/screens/edit_contact_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_contacts_screen/views/screens/view_contacts_screen.dart';
import 'package:houzeo_app/presentation/features/main_screen/view_favorite_contacts_screen/view_favorite_contacts_screen.dart';
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
                    name: HouzeoRouteNames.contactProfileScreen,
                    path: 'contactProfile',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                          child: const ViewContactProfileScreen(),
                          transitionDuration: const Duration(milliseconds: 330),
                          transitionsBuilder:
                              ScreenTransitions().slideTransitionRightToLeft);
                    },
                    routes: [
                      GoRoute(
                          name: HouzeoRouteNames.editContactScreen,
                          path: 'editContact',
                          pageBuilder: (context, state) {
                            return CustomTransitionPage(
                                child: const EditContactScreen(),
                                transitionDuration:
                                    const Duration(milliseconds: 330),
                                transitionsBuilder: ScreenTransitions()
                                    .slideTransitionRightToLeft);
                          })
                    ])
              ])
        ])
  ]);
}

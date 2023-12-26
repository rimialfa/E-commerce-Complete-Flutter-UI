// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService().user;
    final drawerHeader = UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(28, 110, 104, 1),
      ),
      accountName: Text(
        user?.displayName ?? 'Guest',
      ),
      accountEmail: Text(''),
      currentAccountPicture: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(
            user?.photoURL ?? 'https://en.gravatar.com/avatar/placeholder'),
      ),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: const Text(
            'Charity',
          ),
          leading: const Icon(FontAwesomeIcons.circleDollarToSlot),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Divider(),
        ListTile(
          title: const Text(
            'Sponsorship',
          ),
          leading: const Icon(FontAwesomeIcons.child),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    return Drawer(
      child: drawerItems,
    );
  }
}

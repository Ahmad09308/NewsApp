// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:aa/core/bloc/app_manager_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/t.png'),
            ),
            title: Text('Rohan Yadav'),
            subtitle: Text('rohan.yadav@example.com'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
          ),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text('FAQ'),
          ),
           const ListTile(
            leading: Icon(Icons.info),
            title: Text('About App'),
            
          ),
           InkWell(
            onTap: () {
               context.read<AppManagerBloc>().add(LogOut());
            },
             child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
                       ),
           ),
        ],
      ),
    );
  }
}

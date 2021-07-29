import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '/providers/providers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ipod Spotify',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 128),
            ElevatedButton(
                onPressed: () async {
                  try {
                    bool loggedIn;
                    if (kIsWeb || Platform.isIOS) {
                      loggedIn = await context
                          .read(spotifyConnectServiceProvider)
                          .conntectToSpotify();
                    } else {
                      loggedIn = await context
                          .read(spotifyConnectServiceProvider)
                          .conntectToSpotify();
                    }
                    if (loggedIn) {
                      Navigator.of(context).pushNamed('/home');
                    }
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login failed'),
                      ),
                    );
                  }
                },
                child: Text('Login with Spotify'))
          ],
        ),
      ),
    );
  }
}

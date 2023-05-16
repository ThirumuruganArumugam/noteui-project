import 'package:flutter/material.dart';
import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationConfig.dart';
import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationHelpers.dart';
import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';
import 'package:social_media/Pages/ResponseScreen/ResponseScreenVM.dart';

class ResponseScreen extends StatefulWidget {
  const ResponseScreen({super.key, required Data, required data});

  @override
  State<ResponseScreen> createState() => _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  ResponseScreenVM _responseScreenVM = ResponseScreenVM();

  @override
  void initState() {
    super.initState();

    _responseScreenVM.navigationStream.stream.listen((event) {
      if (event is NavigatorPopAndRemoveUntil) {
        context.pushAndRemoveUntil(
            pageConfig: Pages.ResponseScreenconfig,
            removeUntilpageConfig: Pages.LandingScreenConfig);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _responseScreenVM.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Successfully Created"),
            ElevatedButton(
                onPressed: () {
                  _responseScreenVM.backToLandingScreen();
                },
                child: const Text("Back to Home")),
          ],
        ),
      ),
    );
  }
}

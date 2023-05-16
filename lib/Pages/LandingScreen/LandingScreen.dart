import 'package:flutter/material.dart';
import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationHelpers.dart';

import '../../Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';
import '../../Helpers/Resources/Styles.dart';
import 'LandingScreenVM.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final LandingScreenVM _landingScreenVM = LandingScreenVM();
  @override
  void initState() {
    super.initState();
    // using the instance access the navigation stream and listen to the event
    _landingScreenVM.navigationStream.stream.listen((event) {
      // Check whether the condition event is equal to navigatorpush
      if (event is NavigatorPush) {
        // push the pageconfig,data of the event to the context
        context.push(pageConfig: event.pageConfig, data: event.data);
      }
    });
  }

  @override
  void dispose() {
    _landingScreenVM.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton(onPressed: () {
                _landingScreenVM.navigatetoCreatePostScreen();
              }, child: const Text("Post")),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Sort")),
                ],
              ),
              _landingScreenVM.userdetails.title != "" &&
                      _landingScreenVM.userdetails.description != null
                  ? RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  "Title: ${_landingScreenVM.userdetails.title}\n",
                              style: Styles.data),
                          TextSpan(
                              text:
                                  "Description:  ${_landingScreenVM.userdetails.description}",
                              style: Styles.data)
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

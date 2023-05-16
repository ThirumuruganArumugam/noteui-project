import 'package:flutter/material.dart';
import 'package:social_media/BOs/PostBO/PostBO.dart';
import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationHelpers.dart';

import '../../Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';
import 'CreatePostScreenVM.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key, required Data, required String data});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final CreatePostScreenVM _createPostScreenVM = CreatePostScreenVM();

    @override
  void initState() {
    super.initState();
    // using the instance access the navigation stream and listen to the event
    _createPostScreenVM.navigationStream.stream.listen((event) {
      // Check whether the condition event is equal to Navigatorpop
      if (event is NavigatorPop) {
        // pop the context
        context.pop();
      }

      if (event is NavigatorPush) {
        // push the pageconfig,data of the event to the context
        context.push(pageConfig: event.pageConfig, data: event.data);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Create Post"),
          TextFormField(
            onChanged: (value) {
              _createPostScreenVM.updatetitle(value);
            },
            controller: _titleController,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration:
                const InputDecoration(hintText: "title", label: Text("title")),
          ),
          TextFormField(
            onChanged: (value) {
              _createPostScreenVM.updateDescription(value);
            },
            controller: _descriptionController,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: const InputDecoration(
                hintText: "description", label: Text("description")),
          ),
          ElevatedButton(
              onPressed: () {
                _createPostScreenVM.saveUserData(PostBO(
                    id: null,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    date: DateTime.now()));
                _createPostScreenVM.navigatetoResponseScreen();
              },
              child: const Text("Create")),
          ElevatedButton(
              onPressed: () {
                _createPostScreenVM.back();
              },
              child: const Text("go Back")),
        ],
      ),
    );
  }
}

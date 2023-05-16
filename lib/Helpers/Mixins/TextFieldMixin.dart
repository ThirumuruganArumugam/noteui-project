import 'dart:async';

/* Create an ITextFormField abstract class */
abstract class ITextFormField {}

// Create AddUserDetails class to add the text in input Text field
class AddText extends ITextFormField {
  String data;
  AddText({required this.data});
}

mixin TextFieldMixin {
  // Initailize a streamController to listen the emitted events
  StreamController<ITextFormField?> TitleFieldController =
      StreamController<ITextFormField?>();

   /* Create setTextFieldValue method and add the event into the StreamController variable "textFieldController" */
  void setTitleValue({required ITextFormField event}) {
    // Add event inside the stream
    TitleFieldController.add(event);
  }

  StreamController<ITextFormField?> DescriptionFieldController =
      StreamController<ITextFormField?>();

  void setDescriptionValue({required ITextFormField event}) {
    // Add event inside the stream
    DescriptionFieldController.add(event);
  }

  /* Create closeTextMixin method to close the StreamController*/
  void closeTextMixin() async {

    //  Stop the name field stream's listeneing using close function
    await TitleFieldController.close();

    //  Stop the age field stream's listeneing using close function
    await DescriptionFieldController.close();
  }

}

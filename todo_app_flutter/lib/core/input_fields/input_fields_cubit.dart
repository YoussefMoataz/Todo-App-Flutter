import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'input_fields_state.dart';

class InputFieldsCubit extends Cubit<InputFieldsState> {
  TextEditingController titleInputController = TextEditingController();
  TextEditingController descriptionInputController = TextEditingController();

  InputFieldsCubit()
      : super(InputFieldsState(
            titleInputController: null, descriptionInputController: null)) {
    titleInputController = TextEditingController();
    descriptionInputController = TextEditingController();
    emit(InputFieldsState(
        titleInputController: titleInputController,
        descriptionInputController: descriptionInputController));
  }

  void onTitleInputChanged(String newValue) {
    titleInputController.text = newValue;
    print(titleInputController.text);
  }

  void onDescriptionInputChanged(String newValue) {
    descriptionInputController.text = newValue;
  }
}

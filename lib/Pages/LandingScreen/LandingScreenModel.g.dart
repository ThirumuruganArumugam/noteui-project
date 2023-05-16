// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LandingScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LandingScreenModel on LandingScreenModelBase, Store {
  late final _$userdetailsAtom =
      Atom(name: 'LandingScreenModelBase.userdetails', context: context);

  @override
  PostBO get userdetails {
    _$userdetailsAtom.reportRead();
    return super.userdetails;
  }

  @override
  set userdetails(PostBO value) {
    _$userdetailsAtom.reportWrite(value, super.userdetails, () {
      super.userdetails = value;
    });
  }

  late final _$titleAtom =
      Atom(name: 'LandingScreenModelBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'LandingScreenModelBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$LandingScreenModelBaseActionController =
      ActionController(name: 'LandingScreenModelBase', context: context);

  @override
  dynamic setUserDetails({required PostBO userdetails}) {
    final _$actionInfo = _$LandingScreenModelBaseActionController.startAction(
        name: 'LandingScreenModelBase.setUserDetails');
    try {
      return super.setUserDetails(userdetails: userdetails);
    } finally {
      _$LandingScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserName({required String title}) {
    final _$actionInfo = _$LandingScreenModelBaseActionController.startAction(
        name: 'LandingScreenModelBase.setUserName');
    try {
      return super.setUserName(title: title);
    } finally {
      _$LandingScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userdetails: ${userdetails},
title: ${title},
description: ${description}
    ''';
  }
}

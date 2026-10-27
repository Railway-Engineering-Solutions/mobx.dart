// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'generator_sample.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TestStore on _TestStore, Store {
  late final _$usernameAtom = Atom(
    name: '_TestStore.username',
    context: context,
  );

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  bool _usernameIsInitialized = false;

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(
      value,
      _usernameIsInitialized ? super.username : null,
      () {
        super.username = value;
        _usernameIsInitialized = true;
      },
      equals: _usernameIsInitialized ? null : observableAlwaysNotEqual,
      useDeepEquality: true,
    );
  }
}

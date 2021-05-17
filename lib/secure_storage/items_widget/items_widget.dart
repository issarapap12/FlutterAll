// import 'dart:async';
// import 'dart:io';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// Future<Null> _readAll() async {
//     final all = await _storage.readAll(
//       iOptions: _getIOSOptions(),
//     );
//     setState(() {
//       _items = all.entries
//           .map((entry) => _SecItem(entry.key, entry.value))
//           .toList(growable: false);
//     });
//   }

//   void _deleteAll() async {
//     await _storage.deleteAll(
//       iOptions: _getIOSOptions(),
//     );
//     _readAll();
//   }

//   void _addNewItem() async {
//     final String key = _randomValue();
//     final String value = _randomValue();

//     await _storage.write(
//       key: key,
//       value: value,
//       iOptions: _getIOSOptions(),
//     );
//     _readAll();
//   }

//   IOSOptions _getIOSOptions() => IOSOptions(
//         accountName: _getAccountName(),
//       );

//   String _getAccountName() =>
//       _accountNameController.text.isEmpty ? null : _accountNameController.text;

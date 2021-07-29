import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Instance of Dio
final dioProvider = Provider<Dio>(
  (ref) {
    return Dio();
  },
);

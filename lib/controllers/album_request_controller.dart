import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/models.dart';
import '../services/services.dart';

class CurrentOffsetController extends StateNotifier<int> {
  CurrentOffsetController() : super(0);

  updateOffset(int newOffset) {
    try {
      state = newOffset;
    } catch (e) {
      state = 0;
    }
  }
}

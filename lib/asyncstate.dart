library asyncstate;

import 'package:asyncstate/src/src.dart';

export 'package:asyncstate/src/src.dart';

extension AsyncLoader<T> on Future<T> {
  //Extension on future to use in async methods
  Future<T> asyncLoader({
    AsyncOverlay? asyncOverlay,
  }) async {
    try {
      AsyncState.show(asyncOverlay: asyncOverlay);
      final result = await this;
      AsyncState.hide(id: asyncOverlay?.id);
      return result;
    } catch (e) {
      AsyncState.hide(id: asyncOverlay?.id);
      rethrow;
    }
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'result.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, A> = Future<Result<T>> Function(A);

abstract class CommandBase<T> extends ChangeNotifier {
  CommandBase();

  bool _running = false;

  bool get running => _running;

  Result<T>? _result;

  bool get error => _result is Failure;

  bool get completed => _result is Success;

  Result? get result => _result;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T> extends CommandBase<T> {
  Command0(this._action);

  final CommandAction0<T> _action;

  Future<void> execute() async {
    await _execute(() => _action());
  }
}

class Command1<T, A> extends CommandBase<T> {
  Command1(this._action);

  final CommandAction1<T, A> _action;

  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}
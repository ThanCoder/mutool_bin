import 'dart:io';

import 'package:mutool_bin/core/bin/tool_bin.dart';

import 'core/keys.dart';
import 'core/result_t.dart';
import 'core/utils.dart';

class MutoolBin {
  static final MutoolBin instance = MutoolBin._();
  MutoolBin._();
  factory MutoolBin() => instance;

  late String _mutoolLibPath;

  ///supported platforms
  bool get isSupported => Platform.isLinux;

  bool _showDebug = true;

  late final ToolBin tool = .new(_mutoolLibPath);

  ///
  /// make sure -> `[WidgetsFlutterBinding.ensureInitialized()]`
  ///
  Future<void> initialize({bool showDebugLog = true}) async {
    _showDebug = showDebugLog;
    if (Platform.isLinux || Platform.isWindows) {
      _mutoolLibPath = getDesktopLibFullPath(mutoolLibName);

      await makeExecutableAndRun(_mutoolLibPath);
      return;
    }
    throw UnsupportedError('Unsupported ${Platform.operatingSystem}!');
  }

  /// kill process
  Result<bool, String> killPid(
    int pid, [
    ProcessSignal signal = ProcessSignal.sigterm,
  ]) {
    try {
      final p = Process.killPid(pid, signal);
      return Ok(p);
    } catch (e) {
      return Err(e.toString());
    }
  }

  /// show debug log
  void showDebugLog(String msg) {
    if (!_showDebug) return;
    // ignore: avoid_print
    print(msg);
  }
}

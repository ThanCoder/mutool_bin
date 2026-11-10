import 'package:mutool_bin/core/options/mu_info_option.dart';
import 'package:mutool_bin/core/result_t.dart';

import 'i_binary.dart';

class ToolBin extends IBinary {
  new(super.libPath);

  /// doc info
  ///
  /// info	-- show information about PDF resources
  Future<Result<String, String>> info(
    String path, {
    MuInfoOption? option,
  }) async {
    final res = await run(['info', if (option != null) option.val, path]);
    return res.fold(
      onErr: (err) => Err(err),
      onOk: (val) {
        final err = val.stderr.toString();
        if (err.isNotEmpty) return Err(err);
        return Ok(val.stdout.toString());
      },
    );
  }
}

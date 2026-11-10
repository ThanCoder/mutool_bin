import 'package:mutool_bin/core/options/mu_info_option.dart';
import 'package:mutool_bin/core/options/mu_merge_option.dart';
import 'package:mutool_bin/core/result_t.dart';

import 'i_binary.dart';

class ToolBin extends IBinary {
  new(super.libPath);

  /// show information about PDF resources
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

  /// merge pages from multiple PDF sources into a new PDF
  Future<Result<String, String>> merge(
    List<MuMergeInput> inputs, {
    MuMergeOption? option,
    required String output,
  }) async {
    final args = [
      'merge',
      '-o',
      output,
      if (option != null) '-O ${option.result}',
      ...inputs.toCommandArgs,
    ];

    final res = await run(args);
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

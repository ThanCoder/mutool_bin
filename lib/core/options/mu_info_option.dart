// ignore_for_file: constant_identifier_names

/// usage: mutool info [options] file.pdf [pages]
enum MuInfoOption {
  /// 	-p -	password for decryption
  password_for_decryption('-p'),

  /// 	-F	list fonts
  fonts('-F'),

  /// 	-I	list images
  images('-I'),

  /// 	-M	list dimensions
  dimensions('-M'),

  /// 	-P	list patterns
  patterns('-P'),

  /// 	-S	list shadings
  shadings('-S'),

  /// 	-X	list form and postscript xobjects
  form_and_postscript_xobjects('-X'),

  /// 	-Z	list ZUGFeRD info
  ZUGFeRD_info('-Z');

  final String val;
  const new(this.val);
}

# mutool_bin

A Dart package that provides a convenient interface for executing **MuPDF's `mutool` command-line utility**.

Powered by **MuPDF 1.28.6**.

## Supported Platforms

- Linux

## MuTool Version

```bash
mutool version 1.28.6
```

## Available Commands

`mutool_bin` supports the following commands provided by MuPDF:

| Command   | Description                               |
| --------- | ----------------------------------------- |
| `run`     | Run JavaScript                            |
| `draw`    | Convert documents                         |
| `convert` | Convert documents with simpler options    |
| `audit`   | Produce usage statistics from PDF files   |
| `bake`    | Bake PDF forms into static content        |
| `clean`   | Rewrite PDF files                         |
| `create`  | Create PDF documents                      |
| `extract` | Extract fonts and image resources         |
| `info`    | Display PDF resource information          |
| `merge`   | Merge pages from multiple PDF files       |
| `pages`   | Display PDF page information              |
| `poster`  | Split large PDF pages into multiple tiles |
| `recolor` | Change the colorspace of PDF documents    |
| `show`    | Display internal PDF objects              |
| `sign`    | Manipulate PDF digital signatures         |
| `trim`    | Trim PDF page contents                    |
| `grep`    | Search for text                           |
| `trace`   | Trace device calls                        |

## Usage

### Initialize

```dart
final pkg = MutoolBin.instance;
```

### Get MuTool Version

```dart
final res = await pkg.tool.getVersion();

res.onResult(
  onErr: (err) => setState(() {
    resText = err;
  }),
  onOk: (val) => setState(() {
    resText = val;
  }),
);
```

### Execute Raw Commands

Use `run()` to execute commands with custom arguments.

```dart
final res = await pkg.tool.run(args);
```

### Get PDF Information

Use `info()` to retrieve information about PDF resources.

```dart
final res = await pkg.tool.info(
  '$pdfP/Lord of the Mysteries-ch-1-310.pdf',
  option: .patterns,
);
```

### Merge PDF Files

Use `merge()` to combine pages from multiple PDF files into a single PDF document.

```dart
final res = await pkg.tool.merge(
  [
    .new(output: '$p/5.pdf'),
    .new(output: '$p/6.pdf'),
  ],
  output: '$p/5-6.pdf',
);
```

## Requirements

- Linux
- MuPDF `mutool` binary (version 1.28.6)

## License

See the project's license file for licensing information.

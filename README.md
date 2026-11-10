# mutool_bin

+ mutool version 1.28.6

## Supported

- Linux

### Example

```bash
mutool version 1.28.6
usage: mutool <command> [options]
	run	-- run javascript
	draw	-- convert document
	convert	-- convert document (with simpler options)
	audit	-- produce usage stats from PDF files
	bake	-- bake PDF form into static content
	clean	-- rewrite PDF file
	create	-- create PDF document
	extract	-- extract font and image resources
	info	-- show information about PDF resources
	merge	-- merge pages from multiple PDF sources into a new PDF
	pages	-- show information about PDF pages
	poster	-- split large PDF page into many tiles
	recolor	-- change colorspace of PDF document
	show	-- show internal PDF objects
	sign	-- manipulate PDF digital signatures
	trim	-- trim PDF page contents
	grep	-- search for text
	trace	-- trace device calls
```

```dart
final pkg = MutoolBin.instance;

final res = await pkg.tool.getVersion();

res.onResult(
    onErr: (err) => setState(() {
    resText = err;
    }),
    onOk: (val) => setState(() {
    resText = val;
    }),
);

final res = await pkg.tool.run(args);

final res = await pkg.tool.info(
    '$pdfP/Lord of the Mysteries-ch-1-310.pdf',
    option: .patterns,
);

final res = await pkg.tool.merge([
    .new(output: '$p/5.pdf'),
    .new(output: '$p/6.pdf'),
], output: '$p/5-6.pdf');

```

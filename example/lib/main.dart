import 'package:flutter/material.dart';
import 'package:mutool_bin/mutool_bin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MutoolBin.instance.initialize();

  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final pkg = MutoolBin.instance;
  String resText = '';

  void onTest() async {
    final res = await pkg.tool.getVersion();
    res.onResult(
      onErr: (err) => setState(() {
        resText = err;
      }),
      onOk: (val) => setState(() {
        resText = val;
      }),
    );
  }

  void run(List<String> args) async {
    final res = await pkg.tool.run(args);
    res.onResult(
      onErr: (err) => setState(() {
        resText = err;
      }),
      onOk: (val) {
        final err = val.stderr.toString();
        if (err.isNotEmpty) {
          resText = err;
        } else {
          resText = val.stdout.toString();
        }
        setState(() {});
      },
    );
  }

  String get pdfP => '/home/thancoder/Documents/PDF';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MuTool')),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              _buttons,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectableText(resText),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: onTest),
    );
  }

  Widget get _buttons {
    return Wrap(
      children: [
        FilledButton(
          onPressed: () async {
            final res = await pkg.tool.info(
              '$pdfP/Lord of the Mysteries-ch-1-310.pdf',
              option: .patterns,
            );
            res.onResult(
              onErr: (err) => setState(() {
                resText = err;
              }),
              onOk: (val) => setState(() {
                resText = val;
              }),
            );
          },
          child: Text('show info'),
        ),
      ],
    );
  }
}

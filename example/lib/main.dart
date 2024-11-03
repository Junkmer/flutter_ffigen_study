import 'package:flutter_ffigen_study/flutter_ffigen_study.dart';
import 'package:flutter/material.dart';

const String jsCode = '1+2';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Duktape duktape;
  String output = '';

  @override
  void initState() {
    super.initState();
    duktape = Duktape();
    setState(() {
      output = 'Initialized Duktape';
    });
  }

  @override
  void dispose() {
    duktape.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Duktape Test'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  output,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                ElevatedButton(
                  child: const Text('Run JavaScript'),
                  onPressed: () {
                    duktape.evalString(jsCode);
                    setState(() {
                      output = '$jsCode => ${duktape.getInt(-1)}';
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:flutter_ffigen_study/flutter_ffigen_study.dart' as flutter_ffigen_study;
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   late int sumResult;
//   late Future<int> sumAsyncResult;
//
//   @override
//   void initState() {
//     super.initState();
//     sumResult = flutter_ffigen_study.sum(1, 2);
//     sumAsyncResult = flutter_ffigen_study.sumAsync(3, 4);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const textStyle = TextStyle(fontSize: 25);
//     const spacerSmall = SizedBox(height: 10);
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Native Packages'),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 const Text(
//                   'This calls a native function through FFI that is shipped as source in the package. '
//                   'The native code is built as part of the Flutter Runner build.',
//                   style: textStyle,
//                   textAlign: TextAlign.center,
//                 ),
//                 spacerSmall,
//                 Text(
//                   'sum(1, 2) = $sumResult',
//                   style: textStyle,
//                   textAlign: TextAlign.center,
//                 ),
//                 spacerSmall,
//                 FutureBuilder<int>(
//                   future: sumAsyncResult,
//                   builder: (BuildContext context, AsyncSnapshot<int> value) {
//                     final displayValue =
//                         (value.hasData) ? value.data : 'loading';
//                     return Text(
//                       'await sumAsync(3, 4) = $displayValue',
//                       style: textStyle,
//                       textAlign: TextAlign.center,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

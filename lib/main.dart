import 'package:flutter/material.dart';
import 'package:flutter_automation_test/shping_semantics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(number: 1),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int number;

  const MyHomePage({Key? key, required this.number}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _inputText = "Test text";

  @override
  Widget build(BuildContext context) {
    return ShpingSemantics(
      automationId: "MyHomePageAutomationId${widget.number}",
      child: Scaffold(
        appBar: AppBar(
          title: ShpingSemantics(
            automationId: "TitleAutomationId",
            label: "Title",
            child: Text("My Home Page ${widget.number}"),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              ShpingSemantics(
                automationId: "GoToNextPageButtonAutomationId",
                label: "Go to the next page",
                child: TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => MyHomePage(number: widget.number + 1),
                    ),
                  ),
                  child: const Text("Go to the next page"),
                ),
              ),
              const ShpingSemantics(
                automationId: "DisabledButtonAutomationId",
                label: "Disabled Button",
                child: TextButton(
                  onPressed: null,
                  child: Text("Disabled button"),
                ),
              ),
              ShpingSemantics(
                automationId: "TextAutomationId",
                label: "Text Widget",
                child: Text(_inputText),
              ),
              ShpingSemantics(
                automationId: "TextFieldAutomationId",
                label: "Text Field",
                child: TextFormField(
                  initialValue: _inputText,
                  onChanged: (value) => setState(() {
                    _inputText = value;
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

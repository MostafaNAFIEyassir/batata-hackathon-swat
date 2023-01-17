import 'package:batata_hackathon/widgets/button_widget.dart';
import 'package:batata_hackathon/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Batata Hackathon 🥔'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  bool isContinueButtonEnabled = false;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();

    textEditingController.addListener(() {
      setState(() {
        appState.isContinueButtonEnabled = textEditingController.text.isNotEmpty;
      });
    });

    const textFieldInputDecoration = InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'How much kebda do you need?',
        hintText: 'Amount of kebda');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
            Text("SWAT 😈",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 150),
            SizedBox(
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: textFieldInputDecoration,
                controller: textEditingController,
              ),
            ),
            SizedBox(height: 50),
            ButtonWidget(
              text: "Continue",
              press: appState.isContinueButtonEnabled
                  ? () {
                      showAlertDialog(
                          context, widget.title, "Enjoy your ${textEditingController.text} kilos of kebda!");
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }
}

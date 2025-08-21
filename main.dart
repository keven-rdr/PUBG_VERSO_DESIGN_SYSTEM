import 'package:flutter/material.dart';
import 'package:mobileii/Components/Action_button/action_button.dart';
import 'package:mobileii/Components/Action_button/action_button_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fs that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements ActionButtonDelegate { // 1. Implemente o delegate
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // 2. Centralize a lógica de clique aqui.
  // O ViewModel pode ser usado para diferenciar qual botão foi clicado, se necessário.
  @override
  void onClick(ActionButton sender, ActionButtonViewModel viewModel) {
    print("Botão '${viewModel.text}' clicado!");
    _incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Você apertou o botão tantas vezes:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),

            ActionButton(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.large,
                style: ActionButtonStyle.primary,
                text: "Large",
              ),
              delegate: this,
            ),
            const SizedBox(height: 16),

            ActionButton(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.medium,
                style: ActionButtonStyle.primary,
                text: "Confirmar",
                icon: Icons.check_circle,
                iconPosition: IconPosition.left,
              ),
              delegate: this,
            ),
            const SizedBox(height: 16),

            ActionButton(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.medium,
                style: ActionButtonStyle.primary,
                text: "Confirmar",
                icon: Icons.check_circle,
                iconPosition: IconPosition.right,
              ),
              delegate: this,
            ),
          ],
        ),
      ),
    );
  }
}




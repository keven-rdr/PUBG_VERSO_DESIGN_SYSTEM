import 'package:flutter/material.dart';
import '../DesignSystem/Samples/actionButtonSampleScreen/action_button_sample_screen.dart';
import '../DesignSystem/Samples/bottomTabBarSampleScreen/bottom_tab_bar_sample_screen.dart';
import '../DesignSystem/Samples/inputFieldSampleScreen/input_field_sample_screen.dart';
import '../DesignSystem/Samples/linkedLabelSampleScreen/linked_label_sample_screen.dart';
import '../DesignSystem/Samples/tabComponentSampleScreen/tab_sample_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ButtonScreen(),
    );
  }
}

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Sample App'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(context, 'Action Button', ActionButtonPage()),
              _buildButton(context, 'Bottom Tab Bar', BottomTabBarPage()),
              _buildButton(context, 'Input Text Field', InputFieldPage()),
              _buildButton(context, 'Linked Label', LinkedLabelPage()),
              _buildButton(context, 'Tab Bar', TabPage()),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildButton(BuildContext context, String text, Widget scene) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => scene),
        );
      },
      child: Text(text),
    );
  }
}

// Scene Widgets
class Scene1 extends StatelessWidget {
  const Scene1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 1')),
      body: const Center(child: Text('Welcome to Scene 1')),
    );
  }
}

class Scene2 extends StatelessWidget {
  const Scene2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 2')),
      body: const Center(child: Text('Welcome to Scene 2')),
    );
  }
}

class Scene3 extends StatelessWidget {
  const Scene3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 3')),
      body: const Center(child: Text('Welcome to Scene 3')),
    );
  }
}

class Scene4 extends StatelessWidget {
  const Scene4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 4')),
      body: const Center(child: Text('Welcome to Scene 4')),
    );
  }
}

class Scene5 extends StatelessWidget {
  const Scene5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 5')),
      body: const Center(child: Text('Welcome to Scene 5')),
    );
  }
}
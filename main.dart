import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'DesignSystem/Samples/actionButtonSampleScreen/action_button_sample_screen.dart';
import 'DesignSystem/Samples/avatarSampleScreen/avatar_sample_screen.dart';
import 'DesignSystem/Samples/bottomTabBarSampleScreen/bottom_tab_bar_sample_screen.dart';
import 'DesignSystem/Samples/cardSampleScreen/card_sample_screen.dart';
import 'DesignSystem/Samples/comparisonPlatform/comparison_platform_screen.dart';
import 'DesignSystem/Samples/inputFieldSampleScreen/input_field_sample_screen.dart';
import 'DesignSystem/Samples/linkedLabelSampleScreen/linked_label_sample_screen.dart';
import 'DesignSystem/Samples/valueComparisonScreen/value_card_screen.dart';


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
        title: const Text('Design System Sample App - PUBG VERSO'),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 150,
                child: Lottie.asset('assets/animations/vs.json'),
              ),
              _buildButton(context, 'Action Button', ActionButtonPage()),
              _buildButton(context, 'Bottom Tab Bar', BottomTabBarPage()),
              _buildButton(context, 'Input Text Field', InputFieldPage()),
              _buildButton(context, 'Linked Label', LinkedLabelPage()),
              _buildButton(context, 'Card', CardPage()),
              _buildButton(context, 'Avatar', AvatarPage()),
              _buildButton(context, 'Platform', PlatformPage()),
              _buildButton(context, 'Value Card',  ValueCardPage()),
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

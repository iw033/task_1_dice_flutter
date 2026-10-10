import 'package:flutter/material.dart';
import 'dart:math';
import 'dice.dart'; // استدعاء ملف النرد المنفصل

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark, // مظهر داكن كما في متطلبات الواجب
        ),
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  // متغيرات أرقام النرد
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // مسار الصورة الافتراضي (صورة الحزن عند البداية لأن المجموع 2)
  String imagePath = 'assets/sad.png';

  // دالة رمي النرد وتحديث الصورة بناءً على المجموع
  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      int total = leftDiceNumber + rightDiceNumber;

      // إذا كان المجموع 10 أو أكثر تظهر صورة السعادة، وإلا صورة الحزن
      if (total >= 10) {
        imagePath = 'assets/happy.png';
      } else {
        imagePath = 'assets/sad.png';
      }
    });
  }

  // دالة إعادة التعيين (Reset)
  void resetDice() {
    setState(() {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
      imagePath = 'assets/sad.png'; // العودة للصورة الافتراضية
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = leftDiceNumber + rightDiceNumber;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Play Dice'),
        centerTitle: true,
        leading: const Icon(Icons.casino), // أيقونة نرد على اليسار
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // عرض المجموع الإجمالي
          Text(
            'Total is $total',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // الصورة المتغيرة (سعادة / حزن)
          Image.asset(
            imagePath,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),

          // صف عرض النردين
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Dice(number: leftDiceNumber),
              Dice(number: rightDiceNumber),
            ],
          ),

          // أزرار التحكم بالأسفل (خذت نصف الشاشة لكل زر مع مسافة)
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: rollDice,
                    child: const Text('roll'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: resetDice,
                    child: const Text('reset'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
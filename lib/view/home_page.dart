import 'package:custom_schema/core/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  late TextEditingController _controllerMail, _controllerPassword;

  late Color colorNotifier;

  @override
  void initState() {
    super.initState();
    _controllerMail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    colorNotifier = context.watch<ThemeNotifier>().myColor;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Custom Schema Color"),
        centerTitle: true,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.color_lens_sharp,
              size: 40,
            ),
            onPressed: () => colorPicker(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 100,
              color: colorNotifier,
            ),
            const SizedBox(
              height: 50,
            ),
            myTextField("E-mail", _controllerMail),
            myTextField("Password", _controllerPassword),
            loginButton()
          ],
        ),
      ),
    );
  }

  myTextField(String hintText, TextEditingController controller) => Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorNotifier),
            ),
          ),
        ),
      );

  ElevatedButton loginButton() =>
      ElevatedButton(onPressed: () {}, child: const Text("Login"));

  void changeColor(Color color) {
    setState(() => pickerColor = color);
    context.read<ThemeNotifier>().changeColor(color);
  }

  void colorPicker(BuildContext context) {
    // raise the [showDialog] widget
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: currentColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controllerMail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}

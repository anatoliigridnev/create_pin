import 'package:flutter/material.dart';
import 'package:pin_cod/keypad.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'confirm_pin.dart';



class CreatePin extends StatefulWidget {
  const CreatePin({Key? key}) : super(key: key);

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: Text(
          'Setup PIN',
          style: TextStyle(color: Colors.grey[900], fontSize: 15),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey[900],),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Use 6-digits PIN',
              style: TextStyle(color: Color(0xAA7088af), fontSize: 15),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Create PIN',
              style: TextStyle(color: Color(0xAA7088af), fontSize: 23),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 170,
              child: PinCodeTextField(
                onCompleted: (value) {
                  if (pinController.text.length == 4) {
                    Navigator.pushNamed(context, '/page2', arguments: pinController.text);
                  } else {
                    
                  }
                },
                animationDuration: Duration(microseconds: 1),
                obscuringWidget: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                controller: pinController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 11,
                  fieldWidth: 11,
                  borderWidth: 1,
                  inactiveColor: Color(0xffCFD5E1),
                  activeColor: Color(0xffCFD5E1),
                ),
                appContext: context,
                length: 4,
                onChanged: (String value) {},
              ),
            ),
            SizedBox(
              height: 120,
            ),
            KeyPad(
              pinController: pinController,
              isPinLogin: false,
              onChange: (String pin) {},
              onSubmit: (String pin) {},
            ),
          ],
        ),
      ),
    );
  }
}

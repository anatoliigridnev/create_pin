import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_cod/keypad.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmPin extends StatefulWidget {
  const ConfirmPin({Key? key}) : super(key: key);

  @override
  State<ConfirmPin> createState() => _ConfirmPinState();
}

class _ConfirmPinState extends State<ConfirmPin> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    var pinValue = settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: Text(
          'Setup PIN',
          style: TextStyle(
              color: Colors.grey[900],
              fontSize: 15,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[900],
          ),
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
              'Re-enter your PIN',
              style: TextStyle(color: Color(0xAA7088af), fontSize: 23),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 170,
              child: PinCodeTextField(
                onCompleted: (value) {
                  if (value == pinValue) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.only(
                            bottom: 0,
                            top: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Your PIN has been set up \n successfully!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Divider(
                                color: Colors.grey[600],
                              ),
                              CupertinoButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ))
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.only(
                            bottom: 0,
                            top: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Your PIN doesn\'t match!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Divider(
                                color: Colors.grey[600],
                              ),
                              CupertinoButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ))
                            ],
                          ),
                        );
                      },
                    );
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

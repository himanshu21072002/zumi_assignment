import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? clicked = false;
  bool? pressed = false;
  TextEditingController mobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: SizedBox(
                      height: height * 0.2,
                      width: width * 0.3,
                      child: Image.asset('assets/img.png'))),
              Text(
                'Enter Mobile Number',
                style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Linked to your bank account',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 0.12 * height,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: mobileNumber,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Mobile Number',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixText: '+91  ',
                      prefixStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: clicked,
                        onChanged: (val) {
                          setState(() {
                            clicked = val;
                          });
                        },
                        activeColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const Text(
                      'I agree to',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const Text(
                      'Terms of use',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                    const Text(
                      ' and',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const Text(
                      ' Privacy Policy',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Row(
                  children: const [
                    Text(
                      ' of ',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      'OneScore and',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      ' CIBIL',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              pressed == true
                  ? const Padding(
                      padding: EdgeInsets.only(left: 55, top: 20, right: 40),
                      child: Text(
                        "I agree to OneScore's Terms of Use and Privacy "
                        "Policy & authorise to communicate via SMS, Email "
                        "& WhatsApp. I hereby request for a copy of my "
                        "Credit information and/or aggregates on my "
                        "registered email id or through my OneScore "
                        "account, and authorise Experian and CIBIL to also "
                        "provide the same to FPL technologies Private "
                        "Limited, on my behalf.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        setState(() {
                          pressed = true;
                        });
                      },
                      child: const Text('Read more')),
              if (pressed == true)
                TextButton(
                  onPressed: () {
                    setState(() {
                      pressed = false;
                    });
                  },
                  child: const Text('Read less'),
                ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Score Powered by',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              RawMaterialButton(
                onPressed: () {},
                elevation: clicked == true&&mobileNumber.text.isNotEmpty ? 2 : 0,
                constraints: BoxConstraints.tightFor(
                  width: width * 0.7,
                  height: height * 0.06,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: clicked == true&&mobileNumber.text.isNotEmpty ? Colors.blue : Colors.grey[200],
                child: Text('Get OTP',
                    style: TextStyle(
                        fontSize: 25,
                        color: clicked == true&&mobileNumber.text.isNotEmpty ? Colors.black : Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

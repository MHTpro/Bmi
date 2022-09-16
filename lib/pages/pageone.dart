import 'package:flutter/material.dart';
import '../lineright.dart';
import '../lineleft.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final _fomrkey = GlobalKey<FormState>();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  double result = 0.0;
  String myResult = "";
  String resultText = "";
  bool check = false;
  bool checkPage = true;
  int group = 1;
  String myLable = "16";

  Widget helpBox() {
    return check
        ? IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      "توصیه برای کم کردن وزن",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    actionsAlignment: MainAxisAlignment.center,
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                    content: const Text(
                      "سبزیجات بیشتری مصرف کنید\nفرآورده‌های غذایی را کنار بگذارید\nمصرف شکر را ترک کنید\nبه اندازه کافی بخوابید\nپیاده‌روی کنید\nآب زیاد بنوشید",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.help),
          )
        : const SizedBox();
  }

  double myValue = 16;

  final List<Color> _colors = [
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 128, 0),
    const Color.fromARGB(255, 255, 255, 0),
    const Color.fromARGB(255, 128, 255, 0),
    const Color.fromARGB(255, 128, 255, 0),
    const Color.fromARGB(255, 255, 255, 0),
    const Color.fromARGB(255, 255, 128, 0),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 155, 0, 0),
    const Color.fromARGB(255, 155, 0, 0),
    const Color.fromARGB(255, 155, 0, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return checkPage
        ? Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Text(
                "Bmi Calculator",
                style: TextStyle(
                  color: Colors.purpleAccent[400],
                  fontWeight: FontWeight.w300,
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _fomrkey,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            width: 200,
                            child: RadioListTile(
                              title: const Text(
                                "Metric unit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              activeColor: Colors.purpleAccent[400],
                              value: 1,
                              groupValue: group,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    group = value!;
                                    if (checkPage == true) {
                                      checkPage = false;
                                    } else {
                                      checkPage = true;
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                            child: RadioListTile(
                              title: const Text(
                                "Us unit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              activeColor: Colors.purpleAccent[400],
                              value: 2,
                              groupValue: group,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    group = value!;
                                    if (checkPage == true) {
                                      checkPage = false;
                                    } else {
                                      checkPage = true;
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 120,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            controller: height,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                            decoration: InputDecoration(
                              helperStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              helperText: "Cm",
                              border: InputBorder.none,
                              hintText: "Height",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 35,
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                              if (value.contains(".")) {
                                return "Enter valid value";
                              }

                              if (num.parse(value) <= 100) {
                                return "More than 100";
                              }

                              if (num.parse(value) >= 300) {
                                return "Less than 300";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: TextFormField(
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            controller: weight,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                            decoration: InputDecoration(
                              helperStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              helperText: "Kg",
                              border: InputBorder.none,
                              hintText: "Weight",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 35,
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                              if (value.contains(".")) {
                                return "Enter valid value";
                              }

                              if (num.parse(value) <= 5) {
                                return "More than 5";
                              }

                              if (num.parse(value) >= 200) {
                                return "Less than 200";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            if (_fomrkey.currentState!.validate()) {
                              double myHeight = double.parse(height.text) / 100;
                              double myWeight = double.parse(weight.text);

                              //bmi
                              result = myWeight / (myHeight * myHeight);
                              myResult = result.toStringAsFixed(1);

                              if (result <= 18) {
                                resultText = "😊وزنت کمه";
                              } else if (result >= 18 && result <= 25) {
                                resultText = "😉وزنت خوبه";
                              } else if (result >= 25 && result <= 29) {
                                resultText = "😥وزنت زیاده";
                              } else if (result >= 29) {
                                resultText = "😰وزنت خیلی زیاده";
                              }

                              if (result >= 25) {
                                check = true;
                              } else {
                                check = false;
                              }
                              myValue = result;
                            }
                          },
                        );
                      },
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.purpleAccent[400],
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(25),
                      width: 270,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          width: 5,
                          color: Colors.purpleAccent.shade400,
                        ),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: Column(
                        children: [
                          Text(
                            myResult,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          Text(
                            resultText,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          helpBox(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 350,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.grey.shade800,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(colors: _colors),
                                ),
                                child: Slider(
                                  divisions: 24,
                                  activeColor: Colors.transparent,
                                  thumbColor: Colors.black,
                                  inactiveColor: Colors.transparent,
                                  min: 16,
                                  max: 40,
                                  label: myLable,
                                  value: myValue,
                                  onChanged: (double value) {
                                    setState(
                                      () {
                                        myLable = value.toString();
                                        myValue = result;
                                      },
                                    );
                                  },
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 30,
                                width: 350,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    createLineRight(w: 110),
                    createLineLeft(w: 110),
                  ],
                ),
              ),
            ),
          )
        :

        //pageTwo

        Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Text(
                "Bmi Calculator",
                style: TextStyle(
                  color: Colors.purpleAccent[400],
                  fontWeight: FontWeight.w300,
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: _fomrkey,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            width: 200,
                            child: RadioListTile(
                              title: const Text(
                                "Metric unit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              activeColor: Colors.purpleAccent[400],
                              value: 1,
                              groupValue: group,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    group = value!;
                                    if (checkPage == true) {
                                      checkPage = false;
                                    } else {
                                      checkPage = true;
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                            child: RadioListTile(
                              title: const Text(
                                "Us unit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              activeColor: Colors.purpleAccent[400],
                              value: 2,
                              groupValue: group,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    group = value!;
                                    if (checkPage == true) {
                                      checkPage = false;
                                    } else {
                                      checkPage = true;
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 120,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            controller: height,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                            decoration: InputDecoration(
                              helperStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              helperText: "Inch",
                              border: InputBorder.none,
                              hintText: "Height",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 35,
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                              if (value.contains(".")) {
                                return "Enter valid value";
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: TextFormField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            controller: weight,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                            decoration: InputDecoration(
                              helperStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              helperText: "Ibs",
                              border: InputBorder.none,
                              hintText: "Pound",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 35,
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Required";
                              }
                              if (value.contains(".")) {
                                return "Enter valid value";
                              }

                              if (num.parse(value) <= 5) {
                                return "More than 5";
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            if (_fomrkey.currentState!.validate()) {
                              double myHeight = (double.parse(height.text));
                              double myWeight = (double.parse(weight.text));

                              if (myHeight > 300) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text("Enter valid value"),
                                    backgroundColor:
                                        Colors.purpleAccent.shade400,
                                  ),
                                );
                              } else {
                                //bmi
                                result =
                                    (myWeight * 703) / (myHeight * myHeight);
                                myResult = result.toStringAsFixed(2);

                                if (result <= 18) {
                                  resultText = "😊وزنت کمه";
                                } else if (result >= 18 && result <= 25) {
                                  resultText = "😉وزنت خوبه";
                                } else if (result >= 25 && result <= 29) {
                                  resultText = "😥وزنت زیاده";
                                } else if (result >= 29) {
                                  resultText = "😰وزنت خیلی زیاده";
                                }

                                if (result >= 25) {
                                  check = true;
                                } else {
                                  check = false;
                                }
                                myValue = result;
                              }
                            }
                          },
                        );
                      },
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.purpleAccent[400],
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(25),
                      width: 270,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          width: 5,
                          color: Colors.purpleAccent.shade400,
                        ),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: Column(
                        children: [
                          Text(
                            myResult,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          Text(
                            resultText,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          helpBox(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 350,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.grey.shade800,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(colors: _colors),
                                ),
                                child: Slider(
                                  divisions: 24,
                                  activeColor: Colors.transparent,
                                  thumbColor: Colors.black,
                                  inactiveColor: Colors.transparent,
                                  min: 16,
                                  max: 40,
                                  label: myLable,
                                  value: myValue,
                                  onChanged: (double value) {
                                    setState(
                                      () {
                                        myLable = value.toString();
                                        myValue = result;
                                      },
                                    );
                                  },
                                ),
                              ),
                              Container(
                                color: Colors.transparent,
                                height: 30,
                                width: 350,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    createLineRight(w: 110),
                    createLineLeft(w: 110),
                  ],
                ),
              ),
            ),
          );
  }
}

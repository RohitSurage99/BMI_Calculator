import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi_calculator());
}

class Bmi_calculator extends StatelessWidget {
  const Bmi_calculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 var wtController = TextEditingController();
 var ftController = TextEditingController();
 var inController = TextEditingController();

var Result = "";

 @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text("Your_BMI"),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
               Color(0xff00dbde),Color(0xfffee140)

                ]
            )

          ),
          child: Center(
            child: Container(
            //  color: Colors.grey,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI",
                  style: TextStyle(fontSize: 32,
                    fontWeight: FontWeight.w700),),

                  SizedBox(height: 21,),

                   TextField(
                     controller:  wtController,
                     decoration: InputDecoration(
                       label: Text("Enter your weight (in Kgs)"),
                       prefixIcon: Icon(Icons.line_weight)
                     ),
                     keyboardType: TextInputType.number,
                   ),

                  SizedBox(height: 11,),

                  TextField(
                    controller:  ftController,
                    decoration: InputDecoration(
                        label: Text("Enter your Height (in Feet)"),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller:  inController,
                    decoration: InputDecoration(

                        label: Text("Enter your Height (in Inch)"),
                        prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 16,),

                  ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if (wt!= "" && ft!= "" && inch!= ""){
                    // BMI Calculation

                    var iwt =int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (ift*12) + iInch;

                    var tCm = tInch*2.54;
                    var tM = tCm/100;

                    var bmi = iwt/(tM*tM);

                    var msg = "";

                    if (bmi>25){
                      msg = "you are OverWeight!! ";
                      var bgColor = Colors.orange;

                    }else if (bmi<18){
                    msg = "You are UnderWeight!!";
                    var bgColor = Colors.red;
                    } else {
                      msg = "You are Healthy!!";
                      var bgColor = Colors.green;

                    }

                    setState(() {
                      Result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)} ";
                    });





                  }
                  else {

                     setState(() {
                       Result = "Please fill all the required blanks!!!";
                     });

                  }

                  },
                      child: Text('Calculate')),
                        SizedBox(height: 11,),
                   Text(Result, style: TextStyle(fontSize: 21),)

                  ],
              ),
            ),
          ),
        )
    );
  }
}

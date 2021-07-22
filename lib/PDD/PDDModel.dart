import 'dart:async';
import 'dart:io';
import 'package:efarm/PDD/Cure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PDDModel(),
    );
  }
}

class PDDModel extends StatefulWidget {
  @override
  _PDDModelState createState() => new _PDDModelState();
}

class _PDDModelState extends State<PDDModel> {
  File _image;
  List _recognitions;
  String diseaseName = "";
  bool _busy = false;

  Future _showDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make A Choice!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      predictImagePickerGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      predictImagePickerCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> predictImagePickerGallery(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
      _image = image;
    });
    Navigator.of(context).pop();
    recognizeImage(image);
  }

  Future<void> predictImagePickerCamera(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      _busy = true;
      _image = image;
    });
    Navigator.of(context).pop();
    recognizeImage(image);
  }

  @override
  void initState() {
    super.initState();

    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  Future loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/PDDModel.tflite",
        labels: "assets/PDDlabels.txt",
      );
    } on PlatformException {
      print('Failed to load model.');
    }
  }

  Future recognizeImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _busy = false;
      _recognitions = recognitions;
    });
  }

  handleCure() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Cure(diseaseName),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
      top: 0.0,
      left: 0.0,
      width: size.width,
      child: _image == null
          ? Padding(
              padding: EdgeInsets.only(top: 400),
              child: Center(child: Text('UPLOAD PHOTO OF PLANT.')),
            )
          : Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(_image,
                      width: 400, height: 400, fit: BoxFit.cover),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:  
                         Text("Your Result is:",
                            style: TextStyle(
                              color: Colors.green[800],
                            ))
                       
                ),
                Column(
        children: _recognitions != null
            ? _recognitions.map((res) {
                diseaseName = res['label'];
                return Column(
                  children: [
                    Text(
                      "${res["label"].substring(9).toUpperCase()}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        background: Paint()..color = Colors.white,
                      ),
                    ),
                  ],
                );
              }).toList()
            : [],
      ),
       Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ListTile(
            title: Center(
              child: _recognitions != null &&
                      diseaseName != "2 Tomato healthy" &&
                      diseaseName != "11 Potato healthy"
                  ? Text(
                      "About The Disease",
                      style: TextStyle(color: Colors.green[800]),
                    )
                  : Container(),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: _recognitions != null &&
                      diseaseName == "0 Tomato bacterial spot"
                  ? Text(
                      "appears on leaves as small (less than ⅛ inch), sometimes water-soaked (i.e., wet-looking) circular areas. Spots may initially be yellow-green, but darken to brownish-red as they age.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 11,
                        color: (Colors.black),
                      ),
                    )
                  : _recognitions != null &&
                          diseaseName == "1 Tomato early blight"
                      ? Text(
                          "Early blight is a common tomato disease caused by the fungus Alternaria solani. It can affect almost all parts of the tomato plants, including the leaves, stems, and fruits. The plants may not die, but they will be weakened and will set fewer tomatoes than normal.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 11,
                            color: (Colors.black),
                          ),
                        )
                      : _recognitions != null &&
                              diseaseName == "2 Tomato healthy"
                          ? Text(
                              "Growing tomatoes in the same garden space year after year is inviting disaster. Tomatoes are one of the most susceptible vegetable plants when it comes to soil-borne disease. By planting over and over again in the same location, soil easily becomes infected with tomato blight spores and more.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 11,
                                color: (Colors.black),
                              ),
                            )
                          : _recognitions != null &&
                                  diseaseName == "3 Tomato leaf blight"
                              ? Text(
                                  "Leaf blight is a common tomato disease caused by the fungus Alternaria solani. It can affect almost all parts of the tomato plants, including the leaves, stems, and fruits.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: (Colors.black),
                                  ),
                                )
                              : _recognitions != null &&
                                      diseaseName == "4 Tomato leaf mold"
                                  ? Text(
                                      "Tomato leaf mold is a fungal disease that can develop when there are extended periods of leaf wetness and the relative humidity is high (greater than 85 percent).",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: (Colors.black),
                                      ),
                                    )
                                  : _recognitions != null &&
                                          diseaseName ==
                                              "5 Tomato septoria leaf spot"
                                      ? Text(
                                          "Septoria leaf spot is caused by a fungus, Septoria lycopersici. It is one of the most destructive diseases of tomato foliage and is particularly severe in areas where wet, humid weather persists for extended periods.",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: (Colors.black),
                                          ),
                                        )
                                      : _recognitions != null &&
                                              diseaseName ==
                                                  "6 Tomato spider mites (two spotted spider mites)"
                                          ? Text(
                                              "Two-spotted spider mites are one of the most important pests of eggplant. They have up to 20 generations per year and are favored by excess nitrogen and dry and dusty conditions.",
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: (Colors.black),
                                              ),
                                            )
                                          : _recognitions != null &&
                                                  diseaseName ==
                                                      "7 Tomato target spot"
                                              ? Text(
                                                  "target spot of tomato is a fungal disease that attacks a diverse assortment of plants, including papaya, peppers, snap beans, potatoes, cantaloupe, and squash as well as passion flower and certain ornamentals.",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: (Colors.black),
                                                  ),
                                                )
                                              : _recognitions != null &&
                                                      diseaseName ==
                                                          "8 Tomato mosaic virus"
                                                  ? Text(
                                                      "Tomato mosaic virus is a plant pathogenic virus. It is found worldwide and affects tomatoes and many other plants.",
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: (Colors.black),
                                                      ),
                                                    )
                                                  : _recognitions != null &&
                                                          diseaseName ==
                                                              "9 Tomato Yellow leaf curl virus"
                                                      ? Text(
                                                          "Tomato yellow leaf curl virus (TYLCV) is a DNA virus from the genus Begomovirus and the family Geminiviridae. TYLCV causes the most destructive disease of tomato, and it can be found in tropical and subtropical regions causing severe economic losses.",
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color:
                                                                (Colors.black),
                                                          ),
                                                        )
                                                      : _recognitions != null &&
                                                              diseaseName ==
                                                                  "10 Potato early blight"
                                                          ? Text(
                                                              "Early blight (EB) is a disease of potato caused by the fungus Alternaria solani. It is found wherever potatoes are grown. The disease primarily affects leaves and stems, but under favorable weather conditions, and if left uncontrolled, can result in considerable defoliation and enhance the chance for tuber infection.",
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                                color: (Colors
                                                                    .black),
                                                              ),
                                                            )
                                                          : _recognitions !=
                                                                      null &&
                                                                  diseaseName ==
                                                                      "11 Potato healthy"
                                                              ? Text(
                                                                  "Keep potatoes evenly moist but not wet; water before the soil dries out. Potato tubers will rot if the soil is too wet. Even soil moisture is important; fluctuations in soil moisture—wet, dry, wet—can lead to cracked or knobby tubers.",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    color: (Colors
                                                                        .black),
                                                                  ),
                                                                )
                                                              : _recognitions !=
                                                                          null &&
                                                                      diseaseName ==
                                                                          "12 Potato late blight"
                                                                  ? Text(
                                                                      "Phytophthora infestans is an oomycete or water mold, a fungus-like microorganism that causes the serious potato and tomato disease known as late blight or potato blight.",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            11,
                                                                        color: (Colors
                                                                            .black),
                                                                      ),
                                                                    )
                                                                  : Container(),
            ))
            ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: _image != null && diseaseName != "2 Tomato healthy" &&
                            diseaseName != "11 Potato healthy"?RaisedButton(
          onPressed: handleCure,
          child: Text(
            'KNOW MORE',
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.white,
        ):Container(),
                 ),
            ],
          ),
    ));

    
   

   

    if (_busy) {
      stackChildren.add(const Opacity(
        child: ModalBarrier(dismissible: false, color: Colors.grey),
        opacity: 0.3,
      ));
      stackChildren.add(const Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("PLANT SCANNER",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: <Widget>[],
        centerTitle: true, // Put the title in the middle
        elevation: 0,
        brightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: stackChildren,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.camera),
      ),
    );
    
  }
}

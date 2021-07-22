import 'dart:async';
import 'dart:io';
import 'package:efarm/PDD/Cure.dart';
import 'package:efarm/Sources/CustomBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'CropSuggest.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SoilModel(),
    );
  }
}

class SoilModel extends StatefulWidget {
  @override
  _SoilModelState createState() => new _SoilModelState();
}

class _SoilModelState extends State<SoilModel> {
  File _image;
  List _recognitions;
  String soilType = "";
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
        model: "assets/SoilType.tflite",
        labels: "assets/Soillabels.txt",
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

  handleCrop() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CropSuggest(soilType), //edit
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
              child: Center(child: Text('UPLOAD PHOTO OF SOIL SAMPLE.')),
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
                  child: Text("Soil Type(s)",
                      style: TextStyle(color: Colors.brown, fontSize: 20)),
                ),
                Column(
                  children: _recognitions != null
                      ? _recognitions.map((res) {
                          soilType = res['label'];
                          return Column(
                            children: [
                              Text(
                                "${res["label"].substring(2)}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
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
                        child: _recognitions != null
                            ? Text(
                                "About Soil Type",
                                style: TextStyle(color: Colors.green[800]),
                              )
                            : Container(),
                      ),
                      subtitle: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: _recognitions != null &&
                                soilType == "0 Black Soil (Regur)"
                            ? Text(
                                "Black soil is also called Regur soil. It is black in colour and ideal for growing cotton. This type of soil is typical of the Deccan trap (Basalt) region spread over North-West Deccan plateau and is made up of lava flows.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: (Colors.black),
                                ),
                              )
                            : _recognitions != null &&
                                    soilType == "1 Cinder Soil"
                                ? Text(
                                    "This material is a blend of cinders and dirt. Cinders are crushed volcanic rocks formed during the cooling and depressurization process of a volcanic eruption. Their bubble-like cavities, called vesicles, allow them to float in water.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: (Colors.black),
                                    ),
                                  )
                                : _recognitions != null &&
                                        soilType == "2 Laterite Soil"
                                    ? Text(
                                        "Laterite is both a soil and a rock type rich in iron and aluminum and is commonly considered to have formed in hot and wet tropical areas. Nearly all laterites are of rusty-red coloration, because of high iron oxide content. They develop by intensive and prolonged weathering of the underlying parent rock.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: (Colors.black),
                                        ),
                                      )
                                    : _recognitions != null &&
                                            soilType == "3 Peat Soil (Peatland)"
                                        ? Text(
                                            "Peat is a type of soil made up of waterlogged partially-decomposed plant material including sphagnum moss and other acid-loving plants, which has built up over something like 10,000 years in poorly-drained wetland habitats.",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: (Colors.black),
                                            ),
                                          )
                                        : _recognitions != null &&
                                                soilType == "4 Yellow Soil"
                                            ? Text(
                                                "a soil formed under broad-leaved forests in humid subtropical regions, chiefly on parent material fromclayey shales. It has an acid reaction and low humus content, and its yellow color is caused by the presence of ferric hydroxide.",
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: (Colors.black),
                                                ),
                                              )
                                            : Container(),
                      )),
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: _image != null?RaisedButton(
          onPressed: handleCrop,
          child: Text(
            'SUGGESTIONS',
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
        title: Text("SOIL PICKER",
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

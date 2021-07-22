import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class CropSuggest extends StatelessWidget {
  String soilType;
  CropSuggest(this.soilType);



  final soilspec = {
    "0 Black Soil (Regur)":
        "Black soil is also called Regur soil. It is black in colour and ideal for growing cotton. This type of soil is typical of the Deccan trap (Basalt) region spread over North-West Deccan plateau and is made up of lava flows.",
    "1 Cinder Soil":
        "This material is a blend of cinders and dirt. Cinders are crushed volcanic rocks formed during the cooling and depressurization process of a volcanic eruption. Their bubble-like cavities, called vesicles, allow them to float in water.",
    "2 Laterite Soil":
        "Laterite is both a soil and a rock type rich in iron and aluminum and is commonly considered to have formed in hot and wet tropical areas. Nearly all laterites are of rusty-red coloration, because of high iron oxide content. They develop by intensive and prolonged weathering of the underlying parent rock.",
    "3 Peat Soil (Peatland)":
        "Peat is a type of soil made up of waterlogged partially-decomposed plant material including sphagnum moss and other acid-loving plants, which has built up over something like 10,000 years in poorly-drained wetland habitats.",
    "4 Yellow Soil":
        "a soil formed under broad-leaved forests in humid subtropical regions, chiefly on parent material fromclayey shales. It has an acid reaction and low humus content, and its yellow color is caused by the presence of ferric hydroxide.",
  };
  final soilcrops = {
    "0 Black Soil (Regur)":
        "Because of their high fertility and retentivity of moisture, the black soils are widely used for producing several important crops. Some of the major crops grown on the black soils are cotton, wheat, jowar, linseed, Virginia tobacco, castor, sunflower and millets. Rice and sugarcane are equally important where irrigation facilities are available. Large varieties of vegetables and fruits are also successfully grown on the black soils.",
    "1 Cinder Soil":
        " Cinder Soil are good for Onions,Scallions.Beets.Radishes.Carrots.Lettuce, chard, spinach, & other greens.Micro-greens,Tomatoes--especially determinate varieties, which tend to be smaller than indeterminate varieties.",
    "2 Laterite Soil":
        "Laterite soils are good for tea, coffee and cashew cultivation. Laterite soils lack fertility due to intensive leaching. When manured and irrigated, some laterites are suitable for growing plantation crops like tea, coffee, rubber, cinchona, coconut, areca nut, etc.",
    "3 Peat Soil (Peatland)":
        "Crops such as potatoes, sugar beet, celery, onions, carrots, lettuce and market garden crops are commonly grown. Cereals produce low yields. On light undrained peats, or where the water table remains high, the main crop is grass.",
    "4 Yellow Soil":
        "Rice, wheat, sugarcane, maize/corn, groundnut, ragi (finger millet) and potato, oilseeds, pulses, millets, and fruits such as mango, orange, citrus, and vegetables can be grown under ideal irrigation.",
  };

    final treatinfo = {
    "0 Black Soil (Regur)":
        "Adding materials such as organic compost, pine bark, composted leaves and gypsum to heavy clay can improve its structure and help eliminate drainage and compaction problems.",
    "1 Cinder Soil":
        "To hold the soil up in a single block cavity rather than fill each cavity deep, wire mesh and landscape fabric were cut and put under the blocks to hold the soil and let water drain. Put the mesh first and then cover with the fabric.",
    "2 Laterite Soil":
        "These soils are poor in organic matter, nitrogen, phosphate and calcium, while iron oxide and potash are in excess. Hence, laterites are not suitable for cultivation; however, application of manures and fertilisers are required for making the soils fertile for cultivation.",
    "3 Peat Soil (Peatland)":
        "Peat soils need precise application of fertiliser. Peat soils, in their natural state, have high organic matter content, and low nutrient levels and water table fluctuations, so they behave differently from mineral soils in nutrient transformations and cycling.",
    "4 Yellow Soil":
        "Water issues — either too much or too little — are the leading reason behind yellow leaves. In overly wet soil, roots can't breathe. They suffocate, shut down and stop delivering the water and nutrients plants need. ... With too little water, plants can't take up essential nutrients.",
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(soilType.substring(2),
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.green,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            //Start Crop Suggestion
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Container(
                        child: Image.asset(
                          "images/SoilModel/cropsuggest.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              soilType.substring(2),
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          "CROPS SUGGESTION",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  soilcrops[soilType],
                                  textAlign: TextAlign.justify,
                                )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            //End Crop Suggestion
            //Start soil info
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Container(
                        child: Image.asset(
                          "images/SoilModel/soilinfo.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              soilType.substring(2),
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          "SOIL SPECIFICATIONS",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  soilspec[soilType],
                                  textAlign: TextAlign.justify,
                                )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            //end soil info
            //Start treat info
            ExpandableNotifier(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                      child: Container(
                        child: Image.asset(
                          "images/SoilModel/soilprotect.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ScrollOnExpand(
                      scrollOnExpand: true,
                      scrollOnCollapse: false,
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                        ),
                        header: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              soilType.substring(2),
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          "SOIL PROTECTION ",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        expanded: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  treatinfo[soilType],
                                  textAlign: TextAlign.justify,
                                )),
                          ],
                        ),
                        builder: (_, collapsed, expanded) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Expandable(
                              collapsed: collapsed,
                              expanded: expanded,
                              theme:
                                  const ExpandableThemeData(crossFadePoint: 0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
            //End treat info
          ],
        ),
      ),
    );
  }
}

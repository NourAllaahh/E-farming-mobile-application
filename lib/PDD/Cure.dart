import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class Cure extends StatelessWidget {
  String diseaseName;
  Cure(this.diseaseName);

  final diseaseInfo = {
    "0 Tomato bacterial spot":
        "appears on leaves as small (less than ⅛ inch), sometimes water-soaked (i.e., wet-looking) circular areas. Spots may initially be yellow-green, but darken to brownish-red as they age.",
    "1 Tomato early blight":
        " Early blight is a common tomato disease caused by the fungus Alternaria solani. It can affect almost all parts of the tomato plants, including the leaves, stems, and fruits. The plants may not die, but they will be weakened and will set fewer tomatoes than normal.",
    "2 Tomato healthy":
        "your Crop Already Healthy",
    "3 Tomato leaf blight":
        "Leaf blight is a common tomato disease caused by the fungus Alternaria solani. It can affect almost all parts of the tomato plants, including the leaves, stems, and fruits.",
    "4 Tomato leaf mold":
        "Tomato leaf mold is a fungal disease that can develop when there are extended periods of leaf wetness and the relative humidity is high (greater than 85 percent).",
    "5 Tomato septoria leaf spot":
        "Septoria leaf spot is caused by a fungus, Septoria lycopersici. It is one of the most destructive diseases of tomato foliage and is particularly severe in areas where wet, humid weather persists for extended periods.",
    "6 Tomato spider mites (two spotted spider mites)":
        "Two-spotted spider mites are one of the most important pests of eggplant. They have up to 20 generations per year and are favored by excess nitrogen and dry and dusty conditions.",
    "7 Tomato target spot":
        "target spot of tomato is a fungal disease that attacks a diverse assortment of plants, including papaya, peppers, snap beans, potatoes, cantaloupe, and squash as well as passion flower and certain ornamentals.",
    "8 Tomato mosaic virus":
        "Tomato mosaic virus is a plant pathogenic virus. It is found worldwide and affects tomatoes and many other plants.",
    "9 Tomato Yellow leaf curl virus":
        "Tomato yellow leaf curl virus (TYLCV) is a DNA virus from the genus Begomovirus and the family Geminiviridae. TYLCV causes the most destructive disease of tomato, and it can be found in tropical and subtropical regions causing severe economic losses.",
    "10 Potato early blight":
        "Early blight (EB) is a disease of potato caused by the fungus Alternaria solani. It is found wherever potatoes are grown. The disease primarily affects leaves and stems, but under favorable weather conditions, and if left uncontrolled, can result in considerable defoliation and enhance the chance for tuber infection.",
    "11 Potato healthy":
        "your Crop Already Healthy",
    "12 Potato late blight":
        "Phytophthora infestans is an oomycete or water mold, a fungus-like microorganism that causes the serious potato and tomato disease known as late blight or potato blight.",
  };

  final diseaseCureOrganic = {
    "0 Tomato bacterial spot":
        "Remove symptomatic plants from the field or greenhouse to prevent the spread of bacteria to healthy plants.  Burn, bury or hot compost the affected plants and DO NOT eat symptomatic fruit.  Although bacterial spot pathogens are not human pathogens, the fruit blemishes that they cause can provide entry points for human pathogens that could cause illness.Cultural controls and some copper formulations are acceptable for use on organically certified produce.",
    "1 Tomato early blight":
        "Rotate out of tomatoes and related crops for at least two years, Avoid working in plants when they are wet from rain, irrigation, or dew, Use drip irrigation instead of overhead irrigation to keep foliage dry. ",
    "2 Tomato healthy": "your Crop Already Healthy",
    "3 Tomato leaf blight":
        "Destroy potato cull piles before the growing season begins by burying them, spreading and incorporating them into fields, or feeding them to animals.Control volunteer potato plants, as infected plants can grow from infected tubers.Seed infection is unlikely on commercially prepared tomato seed or on saved seed that has been thoroughly dried. Inspect tomato transplants for late blight symptoms prior to purchase and/or planting, as tomato transplants shipped from southern regions may be infected.",
    "4 Tomato leaf mold":
        "Champ (Copper Hydroxide), Double Nickle (Bacillus amyloliquefaciens), Oxidate (Hydrogen dioxide), Regalia (Reynoutria sachalinensis extract) and Zonix (Rhamnolipid biosurfactant). While the treatments did reduce the amount of tomato leaf mold, the disease level was still high. In this trial, all treatments performed comparably, but when price is brought into consideration, the copper product Champ gave the best value. Note, only certain copper hydroxide formulations are approved for organic use, including Champ WG and Kocide 3000-O, and formulations with a higher percentage of active ingredient increase the Re-Entry Interval (REI) to 48 hours",
    "5 Tomato septoria leaf spot":
        "Remove diseased leaves. If caught early, the lower infected leaves can be removed and burned or destroyed. However, removing leaves above where fruit has formed will weaken the plant and expose fruit to sunscald. At the end of the season, collect all foliage from infected plants and dispose of or bury. Do not compost diseased plants.",
    "6 Tomato spider mites (two spotted spider mites)":
        "Avoid weedy fields and do not plant eggplant adjacent to legume forage crops. Avoid early season, broad-spectrum insecticide applications for other pests. Do not over-fertilize. Overhead irrigation or prolonged periods of rain can help reduce populations.",
    "7 Tomato target spot":
        "Encourage healthy, strong growth of plants with adequate moisture and nutrition,Practice regular crop rotation methods so problems do not re-occur and reinfect young plants,Ensure all seed you may sow are disease free. Avoid collecting seed from mature plants showing this disease. If target spot becomes a major concern, remove all plants and burn or bin - do not compost!  Allow soil to be fallow for at least one season before attempting to replant",
    "8 Tomato mosaic virus":
        "Mosaic virus case by insects You can try covering your plants with a floating row cover or aluminum foil mulches to prevent these insects from infecting your plants.Control your weeds. Some types may serve as hosts for the disease, and when aphids and other insects feed on these plants, they will spread the viruses to your garden plants.",
    "9 Tomato Yellow leaf curl virus":
        "Plant tomato cultivars less susceptible to yellow leaf virus,Mulch to maintain consistent soil moisture,Avoid heavy pruning fo tomatoesWater as necessary",
    "10 Potato early blight":
        "support plants to improve air circulation and reduce fungal problems.Keep the soil under plants clean and free of garden debris. Add a layer of organic compost to prevent the spores from splashing back up onto vegetation",
    "11 Potato healthy": "your Crop Already Healthy",
    "12 Potato late blight":
        "destroy ALL foliage in a diseased field to prevent spread of the disease to other plants and tubers, or to neighboring fields. For potatoes, destruction of all foliage in the field is only recommended during later stages in tuber bulking, as tubers will cease growth when the foliage is dead",
  };
  final diseaseCureChemical = {
    "0 Tomato bacterial spot":
        "Using pathogen-free seed and disease-free transplants, when possible, is the best way to avoid bacterial spot on tomato. Avoiding sprinkler irrigation and cull piles near greenhouse or field operations, and rotating with a nonhost crop also helps control the disease.",
    "1 Tomato early blight":
        "It is important to alternate between different chemical families to avoid the development of pathogen insensitivity to particular active ingredients. Some insensitivity to the chemical family 11 has become more common in some areas, so particular care should be taken to rotate these with other chemical families. Also, if insensitivity is already present in a given field population of early blight, fungicides in chemical family 11 will not provide good control.",
    "2 Tomato healthy": "your Crop Already Healthy",
    "3 Tomato leaf blight":
        "ungicides are available for management of late blight on tomato. Late blight does not occur every year in Minnesota. Growers should watch for late blight symptoms in their regular scouting, particularly with weather conditions that favor disease",
    "4 Tomato leaf mold":
        "Bonide 811 Copper fungicide is the most effective to prevent and control the early blight of tomato. Besides, it helps to control and prevent late blight, powdery mildew, downy mildew, white and black spot, gray mold, anthracnose, and other fungal diseases It can also control the fungal disease of roses, fruits, vegetables, herbs, ornamentals, turf, and greenhouse. Also, it can prevent some insects (whiteflies) and bacterial diseases",
    "5 Tomato septoria leaf spot":
        "Consider chemical fungicides. While chemical options are not ideal, they may be the only option for controlling advanced infections. One of the least toxic and most effective is chlorothalonil (sold under the names Fungonil and Daconil)",
    "6 Tomato spider mites (two spotted spider mites)":
        "bifenazate (Acramite),abamectin (Agri-Mek),spirotetramat (Movento),spiromesifen (Oberon 2SC),",
    "7 Tomato target spot":
        "Chlorothalonil and mancozeb (maneb) provide fairly good control of target spot when applied on a preventative basis,New chemistries, including the strobilurins and related compounds (e.g., azoxystrobin and famoxadone +cymoxanil), have given excellent control of target spot in University research trials.",
    "8 Tomato mosaic virus":
        "Treating mosaic virus is difficult and there are no chemical controls like there are for fungal diseases, although some varieties of tomato are resistant to the disease, and seeds can be bought that are certified disease free.",
    "9 Tomato Yellow leaf curl virus":
        "Imidacloprid should be sprayed on the entire plant and below the leaves; eggs and flies are often found below the leaves. Spray every 14-21 days and rotate on a monthly basis with Abamectin so that the whiteflies do not build-up resistance to chemicals.",
    "10 Potato early blight":
        "For best control, apply copper-based fungicides early, two weeks before disease normally appears or when weather forecasts predict a long period of wet weather. Alternatively, begin treatment when disease first appears, and repeat every 7-10 days for as long as needed.",
    "11 Potato healthy": "your Crop Already Healthy",
    "12 Potato late blight":
        "Metalaxyl fungicide which comes under Phenylamide group with FARC 4, was introduced against oomycetes, very effective for late blight management and highly adopted worldwide",
  };

  final diseaseRecomenddedProd = {
    "0 Tomato bacterial spot":
        "fully submerge your tomato seeds in 1.3% sodium hypochlorite for one minute. A slightly more risky technique exists which could affect germination but helps to sterilize both the outer surface and interior of the tomato seed by submerging the seeds in 122 degree F water for 25 minutes.",
    "1 Tomato early blight": "Penthiopyrad, Boscalid, Pyraclostrobin",
    "2 Tomato healthy": "your Crop Already Healthy",
    "3 Tomato leaf blight": "Dimethomorph Cymoxanil Mefenoxam + chlorothaloni",
    "4 Tomato leaf mold":
        "Bonide 811 Copper 4E Fungicide Southern Ag - Copper Fungicide Garden Safe Brand Fungicide3",
    "5 Tomato septoria leaf spot":
        "These include maneb, mancozeb, chlorothalonil, and benomyl. Captan is not effective and zineb may be difficult to purchase",
    "6 Tomato spider mites (two spotted spider mites)":
        "insecticidal soap (M-Pede),neem oil (Trilogy)",
    "7 Tomato target spot":
        "The strobilurin fungicides azoxystrobin and pyraclostrobin, the fungicide boscalid, and the systemic acquired resistance (SAR) elicitor acibenzolar-S-methyl have also been shown to provide good control of target spot.4,11",
    "8 Tomato mosaic virus": "Noil,Trianum,V10",
    "9 Tomato Yellow leaf curl virus": "Protein c2",
    "10 Potato early blight":
        "SERENADE Garden is a broad spectrum, preventative bio-fungicide recommended for the control or suppression of many important plant diseases. For best results, treat prior to foliar disease development or at the first sign of infection. Repeat at 7-day intervals or as needed.",
    "11 Potato healthy": "your Crop Already Healthy",
    "12 Potato late blight":
        "The remaining fungicides viz., Maneb, Manzate (Mancozeb), Curzate (cymoxanil +mancozeb), and Acrobat MZ (dimethomorph + mancozeb) or Tattoo C (chlorothalonil + propamocarb HCl)",
  };

  final diseasesCause = {
    "0 Tomato bacterial spot":
        "Bacterial spot of tomato is caused by Xanthomonas vesicatoria, Xanthomonas euvesicatoria, Xanthomonas gardneri, and Xanthomonas perforans.",
    "1 Tomato early blight":
        "Early blight can be caused by two different closely related fungi, Alternaria tomatophila and Alternaria solani. Alternaria tomatophila is more virulent on tomato than A. solani, so in regions where A. tomatophila is found, it is the primary cause of early blight on tomato. However, if A. tomatophila is absent, A. solani will cause early blight on tomato.",
    "2 Tomato healthy": "your Crop Already Healthy",
    "3 Tomato leaf blight":
        "Late blight is caused by the oomycete Phytophthora infestans. Oomycetes are fungus-like organisms also called water molds, but they are not true fungi",
    "4 Tomato leaf mold":
        "Leaf mold of tomato is caused by pathogen Passalora fulva. It is found throughout the world, predominantly on tomatoes grown where the relative humidity is high, particularly in plastic greenhouses. Occasionally, if conditions are just right, leaf mold of tomato can be a problem on field grown fruit.",
    "5 Tomato septoria leaf spot":
        "Septoria leaf spot is caused by a fungus, Septoria lycopersici. It is one of the most destructive diseases of tomato foliage and is particularly severe in areas where wet, humid weather persists for extended periods.",
    "6 Tomato spider mites (two spotted spider mites)":
        "caused by the use of broad-spectrum insecticides which interfere with the numerous natural enemies that help to manage mite populations. As with most pests, catching the problem early will mean easier control.",
    "7 Tomato target spot":
        "Case it : target spot of tomato is caused by the fungal pathogen Corynespora cassiicola. 1 The disease occurs on field-grown tomatoes in tropical and subtropical regions of the world. Target spot was first observed on tomatoes in the U.S. in Immokalee, Florida in 1967.",
    "8 Tomato mosaic virus":
        "Tomato mosaic virus is a serious and extremely contagious disease. It is also hard to identify, with symptoms varying wildly depending upon the variety and age of the infected plant, the strain of the virus, and environmental conditions. To make matters worse, it is very hard to distinguish from the closely related tobacco mosaic virus.Tomato mosaic virus symptoms can be found at any stage of growth and all parts of the plant may be infected. They are often seen as a general mottling or mosaic appearance on foliage. When the plant is severely affected, leaves may look akin to ferns with raised dark green regions. Leaves may also become stunted.",
    "9 Tomato Yellow leaf curl virus":
        "Tomato yellow leaf curl virus (TYLCV) is a DNA virus from the genus Begomovirus and the family Geminiviridae. TYLCV causes the most destructive disease of tomato, and it can be found in tropical and subtropical regions causing severe economic losses. This virus is transmitted by an insect vector from the family Aleyrodidae and order Hemiptera, the whitefly Bemisia tabaci, commonly known as the silverleaf whitefly or the sweet potato whitefly.",
    "10 Potato early blight":
        "Early blight of potato is caused by the fungal pathogen Alternaria solani. The disease affects leaves, stems and tubers and can reduce yield, tuber size, storability of tubers, quality of fresh-market and processing tubers and marketability of the crop",
    "11 Potato healthy": "your Crop Already Healthy",
    "12 Potato late blight":
        "Late blight is caused by the funguslike oomycete pathogen Phytophthora infesting. This potentially devastating disease can infect potato foliage and tubers at any stage of crop development.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(diseaseName.substring(2),
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
            //Start Info
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
                          "images/PDD/AboutDisease.jpeg",
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
                              diseaseName.substring(2),
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          "ABOUT DISEASE",
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
                                  diseaseInfo[diseaseName],
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
            //End Info
            //Start Cause
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
                          "images/PDD/Causes.jpeg",
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
                              diseaseName.substring(2),
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          "WHAT CAUSE IT?",
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
                                  diseasesCause[diseaseName],
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
            //end Cause
            //Start Organic Control
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
                          "images/PDD/Organic.jpeg",
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
                              diseaseName.substring(2),
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          "ORGANIC CONTROL ",
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
                                  diseaseCureOrganic[diseaseName],
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
            //End Organic Control
            //Strat Chemical Control
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
                          "images/PDD/Chemical.jpeg",
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
                              diseaseName.substring(2),
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          "CHEMEICAL CONTROL",
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
                                  diseaseCureChemical[diseaseName],
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
            //End Chemeical Control
            //Start Recomended Products
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
                          "images/PDD/Product.jpeg",
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
                              diseaseName.substring(2),
                              style: Theme.of(context).textTheme.body2,
                            )),
                        collapsed: Text(
                          "RECOMENNDED PRODUCTS",
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
                                  diseaseRecomenddedProd[diseaseName],
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
            //End Recomennded Products
          ],
        ),
      ),
    );
  }
}

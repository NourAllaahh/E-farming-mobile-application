import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Foryou extends StatefulWidget {
  State<StatefulWidget> createState() {
    return ForyouState();
  }
}

class ForyouState extends State<Foryou> {
  var levelpref;
  var titleList;
  var descList;
  var imgList;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      levelpref = preferences.getString("level");
    });

    print(levelpref);
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  var titleListPackA = [
    "1.Choose a container",
    "2.Prepare your container",
    "3.Fill your container with soil",
    "4.Add a good starter food",
    "5.Pick your plants",
    "6.Prepare your plants",
    "7.Plant!",
    "8.Water",
    "9.Fertilize",
    "10.Maintain",
  ];
  var titleListPackB = [
    "1.Make Good Use of Your Location",
    "2.Plan Your Garden Layout",
    "3.Grow Recommended Varieties ",
    "4.Obtain Good Seed, Plants, Equipment, and Supplies",
    "5.Prepare and Care for the Soil Properly ",
    "6.Plant Your Vegetables Right",
    "7.Keep Down Weeds",
    "8.Control Pests",
    "9.Water Properly",
    "10.Harvest at Peak Quality",
  ];
  var titleListPackC = [
    "1.Compost",
    "2.Obtain Good Seed, Plants, Equipment, and Supplies",
    "3.Amendment",
    "4.Prepare and Care for the Soil Properly",
    "5.Planting",
    "6.Watering",
    "7.Weeding",
    "8.Harvesting",
    "9. Prepare",
    "10. Delivery",
  ];
  var descListPackA = [
    "There are many container options available, so choose one that fits your style. Choose from glazed clay pottery, natural looking stone pots, brightly colored plastic, rustic metal containers or find a truly unique container",
    "If your container is large and you are worried about the cost (or the weight) of filling the entire pot, simply turn sturdy recycled plastic pots upside down in the bottom of the container or use packing peanuts.",
    "Choosing the right soil for your container garden is essential. The better the soil is, the better your plants’ roots, foliage and flowers will grow. See more in soil picker section to identify plants for you ",
    "This microbe-enhanced all-natural plant food includes both endo & ecto mycorrhizae. You’ll grow a larger root mass to help plants establish quickly and promote bigger blooms, and Bio Tone reduces transplant loss. ",
    "Choose plants that go together, not only by color but also those that need the same growing conditions. Planting sun-loving plants in a shaded area container, or vice versa, will be a disappointment after all your work. ",
    "start by “cleaning” your plants first. Pick off any spent blooms or yellowing leaves. If any of your plants are root bound, carefully cut the roots which allows new roots to grow from the cuts. Pinch back any plants that are too tall or leggy",
    "Position your tallest plants in the center of the pot, and the trailers around the edge. As you plant, make sure not to compress the soil. Instead of pressing the soil down, move it to the side to make room for your plants. ",
    "Give your new plants a nice long drink. You want the water to run out of the drainage holes of the pot. If you don’t have drainage holes then you’ll want to water less you so don’t turn the soil into a bog.",
    "Quite honestly, the simplest trick to great containers is to routinely fertilize them. Choose a fertilizer high in phosphate, which encourages blooming. We recommend Fertilome Rooting & Blooming.",
    "As the season progresses, be mindful to keep up on the maintenance of your container garden. Deadheading flowers will not only help your garden stay disease free, it will also encourage new flowers to form. ",
  ];
  var descListPackB = [
    "The success of the garden depends on location. Even though you are limited in choice of location, you should consider the good soil, Sunlight, No nearby trees or shrubs, Water supply, and Nearness to your home.",
    "After choosing a garden site, plan arrangement of crops in the garden. Then sketch a map of your garden area showing the location of each vegetable, the spacing between rows, and the approximate dates for each planting.",
    "Selecting varieties for your garden is important. By careful selection you can grow vegetables that are disease-resistant and good yielders of high-quality, nutritious produce. Use the varieties that are known to do well in your area.",
    "Take inventory early of your needs for plant materials, supplies, and equipment and order the items you need or buy them locally from our AGRO market",
    "The soil provides food and water to plants. To promote good growth and development of your plants, prepare the soil before planting by adding organic matter, applying fertilizers, correcting acidity, and plowing the seedbed.",
    "Much of the success of your garden depends on when and how your vegetables are planted. So, learn from our planting guide when, how and where to plant your plants",
    "It is important to control weeds in your garden because they compete with your vegetables for water and nutrients. Also weeds harbor insects and diseases. The best time to attack weeds is just as they appear on the soil surface",
    "Insects and diseases can cause much damage to your crops if precautions are not taken before these pests arrive in your garden. To track them use plant scanner to perfectly fix your diseased plant.",
    "Water is very important for producing high-quality crops. Although rainfall is a good source of water, there are some dry periods during the growing season when you will have to water your garden. It is important to do it properly.",
    "The quality of your vegetables cannot be improved after harvest. It is therefore important to harvest your crops at the proper maturity. See Tips on Growing Specific Vegetables for information on harvesting specific crops.",
  ];
  var descListPackC = [
    "The key to compost is following all the steps and making sure you add just the right amount of water. One of the most important things for compost are worms. They add a lot of vitamins into the compost. ",
    "Take inventory early of your needs for plant materials, supplies, and equipment and order the items you need or buy them locally from our AGRO market.",
    "Taking care of your beds and soil is very crucial for successful harvest and healthy plants. Adding other organic materials like compost, manure, etc. to your soil and beds is also necessary in having rich and nutrient filled soil. ",
    "The soil provides food and water to plants. To promote good growth and development of your plants, prepare the soil before planting by adding organic matter, applying fertilizers, correcting acidity, and plowing the seedbed.",
    "Before planting, there is a lot of planning such as how long it will take the plant to grow and whether it is in season. You have to make sure your read the instructions to know how far apart the seeds should be planted.",
    "Watering is one of the most important parts of farming. We always water the plant after planting the seeds to “tell” the plants it is time to grow. After a few days, you see a little sprout come out. ",
    "To weed our beds, pick up plants that may have grown in the wrong spot or weren’t planted there. We pull the crab grass and nettles that are in the way or crowding the produce we sell, or just making the garden look ugly or dirty. ",
    "When you harvest, make sure that you don’t damage the leaves by soaking them in too much water when you wash them. You also have to make sure that you pull the plant by the roots and that the roots come out. Then you can cut them. ",
    "After harvesting you have to prepare and see the corrupted crops and the good ones and put them together in order to not be confused ",
    "When one is delivering products, one must be professional. It’s crucial to “sell” our products with our looks. It’s important that good impressions are set while going on a delivery. ",
  ];
  var imgListPackA = [
    "images/ForYou/A/1A.jpg",
    "images/ForYou/A/2A.png",
    "images/ForYou/A/3A.jpg",
    "images/ForYou/A/4A.jpg",
    "images/ForYou/A/5A.png",
    "images/ForYou/A/6A.png",
    "images/ForYou/A/7A.png",
    "images/ForYou/A/8A.jpg",
    "images/ForYou/A/9A.jpg",
    "images/ForYou/A/10A.png",
  ];
  var imgListPackB = [
    "images/ForYou/B/1B.jpg",
    "images/ForYou/B/2B.png",
    "images/ForYou/B/3B.png",
    "images/ForYou/B/4B.png",
    "images/ForYou/B/5B.jpg",
    "images/ForYou/B/6B.png",
    "images/ForYou/B/7B.png",
    "images/ForYou/B/8B.png",
    "images/ForYou/B/9B.png",
    "images/ForYou/B/10B.jpg",
  ];
  var imgListPackC = [
    "images/ForYou/C/1C.png",
    "images/ForYou/C/2C.png",
    "images/ForYou/C/3C.jpg",
    "images/ForYou/C/4C.png",
    "images/ForYou/C/5C.png",
   "images/ForYou/C/6C.png",
    "images/ForYou/C/7C.png",
    "images/ForYou/C/8C.png",
    "images/ForYou/C/9C.jpg",
    "images/ForYou/C/10C.png",
  ];

  @override
  Widget build(BuildContext context) {
    if (levelpref == "A") {
      titleList = titleListPackA;
      descList = descListPackA;
      imgList = imgListPackA;
    }
    if (levelpref == "B") {
      titleList = titleListPackB;
      descList = descListPackB;
      imgList = imgListPackB;
    }

    if (levelpref == "C") {
      titleList = titleListPackC;
      descList = descListPackC;
      imgList = imgListPackC;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Made For You",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          centerTitle: false, // put the title in the middle
          elevation: 0,
          brightness: Brightness.light,
        ),
        body: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  showDialogFunc(context, imgList[index], titleList[index],
                      descList[index]);
                },
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 400,
                        height: 200,
                        child: Image.asset(imgList[index]),
                      ),
                      Text(
                        titleList[index],
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 400,
                        child: Text(
                          descList[index],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[800],
                          ),
                        ),
                      )
                    ],
                  ),
                )));
          },
        ));
  }
}

showDialogFunc(context, img, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 520,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        img,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(title,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ),
        );
      });
}

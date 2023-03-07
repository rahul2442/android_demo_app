import 'package:android_demo_app/dao.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageDetails extends StatefulWidget {
  int title;
  ImageDetails({super.key, required this.title});

  @override
  State<ImageDetails> createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  int index = 0;
  List<String> demo = ["a","b","c"];
   List<Dao> mylist = [Dao("https://images.pexels.com/photos/1542495/pexels-photo-1542495.jpeg?auto=compress&cs=tinysrgb&w=600", "Starburst Galaxy M94 from Hubble", "Why does this galaxy have a ring of bright blue stars?  Beautiful island universe Messier 94 lies a mere 15 million light-years distant in the northern constellation of the Hunting Dogs (Canes Venatici). A popular target for Earth-based astronomers, the face-on spiral galaxy is about 30,000 light-years across, with spiral arms sweeping through the outskirts of its broad disk. But this Hubble Space Telescope field of view spans about 7,000 light-years across M94's central region. The featured close-up highlights the galaxy's compact, bright nucleus, prominent inner dust lanes, and the remarkable bluish ring of young massive stars. The ring stars are all likely less than 10 million years old"),
                      Dao("https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600", "M27: The Dumbbell Nebula", "Is this what will become of our Sun? Quite possibly.  The first hint of our Sun's future was discovered inadvertently in 1764. At that time, Charles Messier was compiling a list of diffuse objects not to be confused with comets. The 27th object on Messier's list, now known as M27 or the Dumbbell Nebula, is a planetary nebula, the type of nebula our Sun will produce when nuclear fusion stops in its core. M27 is one of the brightest planetary nebulae on the sky, and can be seen toward the constellation of the Fox (Vulpecula) with binoculars. It takes light about 1000 years to reach us from M27, featured here in colors emitted by hydrogen and oxygen. Understanding the physics and significance of M27 was well beyond 18th century science. Even today, many things remain mysterious about bipolar planetary nebula like M27, including the physical mechanism that expels a low-mass star's gaseous outer-envelope, leaving an X-ray hot white dwarf."),
                      Dao("https://images.pexels.com/photos/296234/pexels-photo-296234.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Electric Night", "It may appear, at first, like the Galaxy is producing the lightning, but really it's the Earth. The featured nighttime landscape was taken from a southern tip of the Italian Island of Sardinia in early June. The foreground rocks and shrubs are near the famous Capo Spartivento Lighthouse, and the camera is pointed south toward Algeria in Africa.  In the distance, across the Mediterranean Sea, a thunderstorm is threatening, with several electric lightning strokes caught together during this 25-second wide-angle exposure.  Much farther in the distance, strewn about the sky, are hundreds of stars in the neighborhood of our Sun in the Milky Way Galaxy. Farthest away, and slanting down from the upper left"),
                     Dao("https://images.pexels.com/photos/1542495/pexels-photo-1542495.jpeg?auto=compress&cs=tinysrgb&w=600", "Starburst Galaxy M94 from Hubble", "Why does this galaxy have a ring of bright blue stars?  Beautiful island universe Messier 94 lies a mere 15 million light-years distant in the northern constellation of the Hunting Dogs (Canes Venatici). A popular target for Earth-based astronomers, the face-on spiral galaxy is about 30,000 light-years across, with spiral arms sweeping through the outskirts of its broad disk. But this Hubble Space Telescope field of view spans about 7,000 light-years across M94's central region. The featured close-up highlights the galaxy's compact, bright nucleus, prominent inner dust lanes, and the remarkable bluish ring of young massive stars. The ring stars are all likely less than 10 million years old"),
                      Dao("https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=600", "M27: The Dumbbell Nebula", "Is this what will become of our Sun? Quite possibly.  The first hint of our Sun's future was discovered inadvertently in 1764. At that time, Charles Messier was compiling a list of diffuse objects not to be confused with comets. The 27th object on Messier's list, now known as M27 or the Dumbbell Nebula, is a planetary nebula, the type of nebula our Sun will produce when nuclear fusion stops in its core. M27 is one of the brightest planetary nebulae on the sky, and can be seen toward the constellation of the Fox (Vulpecula) with binoculars. It takes light about 1000 years to reach us from M27, featured here in colors emitted by hydrogen and oxygen. Understanding the physics and significance of M27 was well beyond 18th century science. Even today, many things remain mysterious about bipolar planetary nebula like M27, including the physical mechanism that expels a low-mass star's gaseous outer-envelope, leaving an X-ray hot white dwarf."),
                      Dao("https://images.pexels.com/photos/296234/pexels-photo-296234.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Electric Night", "It may appear, at first, like the Galaxy is producing the lightning, but really it's the Earth. The featured nighttime landscape was taken from a southern tip of the Italian Island of Sardinia in early June. The foreground rocks and shrubs are near the famous Capo Spartivento Lighthouse, and the camera is pointed south toward Algeria in Africa.  In the distance, across the Mediterranean Sea, a thunderstorm is threatening, with several electric lightning strokes caught together during this 25-second wide-angle exposure.  Much farther in the distance, strewn about the sky, are hundreds of stars in the neighborhood of our Sun in the Milky Way Galaxy. Farthest away, and slanting down from the upper left"),
                      ];
  @override
  void initState() {
    // TODO: implement initState
    index = widget.title;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.image),
        title: Text("Dynamic Add Image List"),
      ),
      body: GestureDetector(
         onHorizontalDragEnd: (DragEndDetails details){
          // Swiping in right direction.
          if (details.primaryVelocity! > 0) {
             print(index);
              setState(() {
                if(index == mylist.length-1) index = 0;
                else if(index!=mylist.length-1) index = index+1;
                
              });
          }

          // Swiping in left direction.
         if (details.primaryVelocity! < 0) {
            setState(() {
              if(index == 0) index = mylist.length-1;
             else if(index!=0) index = index-1;
             print(index);
            });
          }
        },
       
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          mylist[index].url,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Text(mylist[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(mylist[index].description))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

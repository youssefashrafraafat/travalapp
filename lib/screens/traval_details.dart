import 'package:flutter/material.dart';
import 'package:travelapp/app_data.dart';

class TravalDetails extends StatefulWidget {
  const TravalDetails({super.key, required this.favorite, required this.isFavorite});
static const id='details';
final Function favorite;
  final Function isFavorite;

  @override
  State<TravalDetails> createState() => _TravalDetailsState();
}

class _TravalDetailsState extends State<TravalDetails> {
  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding:const EdgeInsets.all(10),
      margin:const  EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final travalid=ModalRoute.of(context)!.settings.arguments as String;
     final selectedTrip = tripsdata.firstWhere((trip) => trip.id == travalid);
    return  Scaffold(
appBar: AppBar(title: Text(selectedTrip.title)),
    body:SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
      child: Column(
      children: [
         Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedTrip.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
           const   SizedBox(height: 10),
               buildSectionTitle(context, 'الأنشطة'),
            buildListViewContainer(
              ListView.builder(
                
                physics:const BouncingScrollPhysics(),
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
          const  SizedBox(height: 10),
                buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                physics:const BouncingScrollPhysics(),
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                   const Divider(),
                  ],
                ),
              ),
            ),
         const   SizedBox(height: 100),
      ],
    ),
    ),
    
    floatingActionButton: FloatingActionButton(
    
      onPressed:()=> widget.favorite(travalid),
    child:Icon(widget.isFavorite(travalid) ?
    
     Icons.star : Icons.star_border),
    
    ),
    );
  }
}
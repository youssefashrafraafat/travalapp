import 'package:flutter/material.dart';
import 'package:travelapp/screens/category_travels.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.imageUrl, required this.id});
final String title;
final String imageUrl;
final String id;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return  CategoryTravels(iditem: id,title: title,);
}));
        
      }, 
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        
      children: [
       ClipRRect(
      
      borderRadius: BorderRadius.circular(16),
        
        child: Image.network(imageUrl,height: 250,fit: BoxFit.fill,)),
      Container(
    
        decoration: BoxDecoration(
           color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16)
        ),
       
        alignment: Alignment.center,
        padding:const EdgeInsets.all(10),
      child: Text(title,style:Theme.of(context).textTheme.titleLarge,),
      )
      
      
      ],
      ),
    );
  }
}
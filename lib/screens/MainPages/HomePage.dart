import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/CustomSearchBar.dart';
import '../../components/LoginBtn.dart';
import '../../components/navbara.dart';
import '../../theme/AppTheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> productList = [
    Product('assets/images/img_6.png', 'Design Graphique', 4.9, 'A distance', 'Expert', 'Nourhene Bakalti', true),
    Product('assets/images/menage.jpeg', 'Menage', 4.9, 'Paris', 'Professionnel', 'Mark Marker', false),
    Product('assets/images/img_5.png', 'Plombier', 4.9, 'Paris', 'Professionnel', 'Mark Marker', false),
  ];

  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.position.pixels - 200.w,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.position.pixels + 200.w,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: PreferredSize(
    preferredSize: Size.fromHeight(150.h),
    child: ClipRRect(
    borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(30.h)
    ),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppTheme.primaryColor,
      title: Row(
        children: [
          Image.asset(
              "assets/icons/notification.png",
              width: 20.w,
              height: 20.h,


          ),
          SizedBox(width: 60.w),
          Text(
            'Acceuil',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Hauteur ajustée pour la barre de recherche
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0), // Moins de padding vertical
          child: Container(
            height: 40, // Taille réduite
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Recherche',
                prefixIcon:
                 IconButton(
                icon: Icon(Icons.search, color: Colors.blue),
    onPressed: () {
    _showSearchCard(context);  // Ouvre le BottomSheet lors du clic sur l'icône de recherche
    },
    ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 5), // Ajustement de l'espace vertical
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15), // Bordures arrondies plus petites
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    ),
    ),

    body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h), // Add spacing between the title and the list
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Verified Pros',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h), // Add spacing between the title and the list
            Stack(
              children: [
                Container(
                  height: 250.h,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return _buildListItem(context, index);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Best Offers',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: productList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Deux colonnes
                crossAxisSpacing: 16.w, // Espacement horizontal entre les cards
                mainAxisSpacing: 16.h,  // Espacement vertical entre les cards
                childAspectRatio: 0.75, // Ajustez le ratio pour correspondre à la taille de votre card
              ),
              itemBuilder: (context, index) {
                return _buildListItem(context, index);  // Réutilisation de la méthode _buildListItem pour chaque élément de la grille
              },
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                'Demandes recentes',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: productList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildListItem2(context, index);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Product product = productList[index];

    Color borderColor = product.verified ? Colors.green : Colors.orange;

    return Container(
      width: 200.w,
      height: 250.h,
      margin: EdgeInsets.symmetric(horizontal: 0.5.w), // Add margin between cards
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
          child: Stack(
            children: [
              Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
                width: 200.w,
                height: 250.h,
              ),
              Container(
                width: 200.w,
                height: 250.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  width: 30.sp,
                  height: 30.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 17.83.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  width: 30.sp,
                  height: 30.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle_outline_outlined,
                      color: Colors.white,
                      size: 17.83.sp,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8.h,
                left: 8.w,
                right: 8.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: product.tag == 'Expert' ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(7.51.w),
                      ),
                      child: Text(
                        product.tag,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star_border_outlined, color: Colors.white, size: 16.sp),
                            SizedBox(width: 2.w),
                            Text(
                              product.rating.toString(),
                              style: TextStyle(
                                fontSize: 7.96.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 16.sp, color: Colors.white),
                            SizedBox(width: 2.w),
                            Text(
                              product.location,
                              style: TextStyle(
                                fontSize: 7.96.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem2(BuildContext context, int index) {
    Product product = productList[index];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h), // Add margin between items
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.accentColor, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white, // Set background color to white
      ),
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: Image.asset(
                  product.imagePath,
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              if (product.verified)
                Positioned(
                  top: 0.h,
                  right: 0.w,
                  child: Container(
                    width: 20.sp,
                    height: 20.sp,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Colors.white,
                        size: 14.sp,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star_border_outlined, color: Colors.blue, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      product.rating.toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Icon(Icons.location_on_outlined, color: Colors.blue, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      product.location,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: product.tag == 'Expert' ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(9.51.w),
                  ),
                  child: Text(
                    product.tag,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }

  void _showSearchCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,// Pour que le BottomSheet prenne en compte le clavier
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recherche Avancée',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(height: 20.h),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Type de Service',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.work_history_outlined,color: Colors.blue),
                  ),
                  items: ['Demande', 'Location'].map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle type change
                  },
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Localisation',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.location_on,color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom de l\'expert',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.person,color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20.h),
            const RechercheBtn(),
            SizedBox(height: 16.h),
           // GestureDetector(

             // onTap: () {
               // Navigator.push(
                 // context,
                 // MaterialPageRoute(

                 // ),
               // );
             // },
              ],
            ),
          ),
        );
      },
    );
  }


}

class Product {
  final String imagePath;
  final String title;
  final double rating;
  final String location;
  final String tag;
  final String name;
  final bool verified;

  Product(this.imagePath, this.title, this.rating, this.location, this.tag, this.name, this.verified);
}



class RechercheBtn extends StatelessWidget {
  const RechercheBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 133,
          height: 46,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 133,
                  height: 46,
                  decoration: ShapeDecoration(
                    color: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 31,
                top: 15,
                child: SizedBox(
                  width: 71,
                  height: 17,
                  child: Text(
                    'Recherche',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
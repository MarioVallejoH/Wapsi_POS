import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';



class DBSync extends StatelessWidget {
  const DBSync({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TODO: Responsive image
              Container(
                width: _size.width,
                height: _size.height*0.4,
                child: Image(
                  image: AssetImage('assets/images/backupimage.png'),
                ),
              ),
      
            
              Text(
                'Sincronizando base de datos', 
                style: Theme.of(context).textTheme.headline6,
              ),
             
      
              CircularProgressIndicator()
      
            ],
            
          ),
        ),
      ),
    );
  }
}

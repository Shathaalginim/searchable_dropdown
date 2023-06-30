import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'Countrys.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dropdownSearch Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
 
  String ?userchooseCountry;
  bool isDropdownOpen = false;
  Country? selectedItem ;

void setStateUserchooseCountry(String value) {
  setState(() {
    userchooseCountry = value;
  });
}

        
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Container(
        color: Colors.white, // Set your desired background color here
        child: 
       Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
        //  key: _formKey,
       //   autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
Stack(
  children: <Widget>[
// Positioned(
//   top: 0,
//   left: 0,
//   child: Container(
//     width: 370,
//     height: 48,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       border: Border.all(
//         color: Colors.grey,
//         width: 1.0,
//       ),
//       borderRadius: BorderRadius.circular(5.0), // Adjust the value to control the border roundness
//     ),
//   ),
// )
// ,



// Expanded(
//   child: DropdownSearch<Country>(
//     items: countries,
//     autoValidateMode: AutovalidateMode.onUserInteraction,
//     validator: (Country? country) {
//       if (country == null) return 'required field';
//       // Add your validation logic here
//       return null;
//     },
//     clearButtonProps: ClearButtonProps(isVisible: true),
//     itemAsString: (Country country) => '${country.flag} ${country.name} ',
//     popupProps: PopupProps.menu(
//       showSearchBox: true,
//       //fit:  FlexFit.tight,
//       constraints: BoxConstraints.tightFor(
//         width: 500,
//         height: 300,
//       ),
//     ),
//     dropdownBuilder: (BuildContext context, Country? selectedItem) {
      
//       if (selectedItem == null) {
//         return Text('Select');

//       } else {
//         return Row(
//           children: [
//             SizedBox(width: 15.0),
//             Text(
//               selectedItem.flag,
//               style: TextStyle(fontSize: 28),
//             ),
//           ],
//         );
//       }
//     },
//     dropdownButtonProps: DropdownButtonProps(
//     // Set the icon and menuIcon to null
//     icon: Container(),
//    // menuIcon: null,
//     // Other properties...
//   ),
//     onChanged: (Country? country) {
//       if (country != null) {
//         // Handle the selected country
//         print('Selected country: ${country.name}');
//         setState(() {
//           userchooseCountry = country.dialCode;
//         });
//       }
//     },
//   ),
// )

Expanded(
  child: DropdownSearch<Country>(
    items: countries,
    autoValidateMode: AutovalidateMode.onUserInteraction,
    
    validator: (Country? country) {
      if (country == null) return 'required field';
      // Add your validation logic here
      return null;
    },
    clearButtonProps: ClearButtonProps(isVisible: true),
    itemAsString: (Country country) => '${country.flag} ${country.name} ',
    popupProps: PopupProps.menu(
      showSearchBox: true,
      constraints: BoxConstraints.tightFor(
        width: 500,
        height: 300,
      ),
    ),
    dropdownBuilder: (BuildContext context, Country? selectedItem) {
      if (selectedItem == null) {
        return Text('Select');
      } else {
        return Row(
          children: [
            SizedBox(width: 15.0),
            Text(
              '${selectedItem.flag}',
              style: TextStyle(fontSize: 28),

            ),
           
          ],
        );
      }
    },
    dropdownButtonProps: DropdownButtonProps(
      icon: Container(),
    ),
    onChanged: (Country? country) {
      if (country != null) {
        // Handle the selected country
        setState(() {
          userchooseCountry = '${country.dialCode}';
          setStateUserchooseCountry('${country.dialCode}');
        });
        print('Selected country: ${country.name}');
      } else if (countries.isNotEmpty) {
        // If default value is set and no country is selected, use the default value
        setState(() {
          userchooseCountry = '${countries[0].dialCode}';
          setStateUserchooseCountry('${countries[0].dialCode}');
        });
      }
    },
    selectedItem: countries.isNotEmpty ? countries[0] : null, // Set the first item as the default value
  ),
),


// Positioned(
//   top: 0,
//   left: 79,
//   child: Container(
//     width: 290,
//     height: 48,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       border: Border.all(
//         color: Colors.grey,
//         width: 1.0,
//       ),
//      // borderRadius: BorderRadius.circular(8.0), // Adjust the value to control the border roundness
//     ),
//   ),
// ),
SizedBox(width: 10,),
Positioned(
  top: 0,
  left: 79,
  child: Container(
    width: 290,
    height: 48,
    decoration: BoxDecoration(
      
      border: Border(
        left: BorderSide(width: 1.0, color: Colors.grey),
       
      ),
    ),
     child: Container(
      padding: EdgeInsets.all(8), // Add space before cursor
      child: TextField(
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '+ ${userchooseCountry?.isNotEmpty ?? false ? userchooseCountry! : countries.isNotEmpty ? countries[0].dialCode : ""}',
        
        ),
      ),
    ),
    ),
  ),
  ],
)
,
    ],
          ),
        ),
      ),
      ),  );
  }

 

}

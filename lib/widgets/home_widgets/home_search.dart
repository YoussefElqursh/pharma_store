import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/styles/colors.dart';
import '../../shared/components/functions.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  HomeSearchState createState() => HomeSearchState();
}

class HomeSearchState extends State<HomeSearch> {


  @override
  void initState() {
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 38,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search product...',
                hintStyle: TextStyle(
                  color: HexColor("#B2BAC6"),
                  fontFamily: 'Poppins',
                ),
                prefixIcon:  Padding(
                  padding: const EdgeInsets.only(top: 12.33,bottom: 12.33,left: 12.33,right: 8.95),
                  child: setPhoto(kind: 1, path: "assets/icons/Search.svg"),
                )
                    ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: HexColor("#DDE1EB")),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: HexColor("#DDE1EB")),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: HexColor(primary)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            child: setPhoto(
              kind: 1,
              path: 'assets/icons/text-number.svg',
              width: 38,
              height: 38,
            ),
          ),
        ),
      ],
    );
  }
}

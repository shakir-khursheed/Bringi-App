import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void _showAlertDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: ((context) => AlertDialog(
              title: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.logout,
                    color: Color(0xffD67676),
                    size: 100,
                  ),
                  Text(
                    'Are you sure you want to logout',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'Yes',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          'No',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ]),
          ))));
}

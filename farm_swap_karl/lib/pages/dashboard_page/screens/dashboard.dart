import "package:farm_swap_karl/colors/colors.dart";
import 'package:farm_swap_karl/pages/dashboard_page/data/retrieve_id.dart';
import 'package:farm_swap_karl/pages/dashboard_page/data/test_data/dsb_pie_graph/piegraph.dart';
import 'package:farm_swap_karl/pages/dashboard_page/functions/profileId.dart';
import 'package:farm_swap_karl/pages/dashboard_page/functions/profilename.dart';
import 'package:farm_swap_karl/pages/dashboard_page/functions/profilephoto.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_admin_account_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_communications_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_dashboard_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_dispute_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_listings_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_logout_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_options_header_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_edit_admin_profile_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_recentActivities_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_reports_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_transactions_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_user_account_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_sidemenu_option_widgets/dashboard_wallet_btn.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_graphs_widget/widget_dashboard_barter_bargraph.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_graphs_widget/widget_dashboard_linegraph.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_graphs_widget/widget_dashboard_piegraph.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_common_widget/widget_dashboard_search.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_graphs_widget/widget_dashboard_selling_bargraph.dart';
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_common_widget/widget_dashboard_txt.dart';
import 'package:farm_swap_karl/pages/dashboard_page/data/test_data/dsb_line_graph/pricePoint.dart';
import 'package:farm_swap_karl/pages/dashboard_page/data/test_data/dsb_line_graph/pricePoint2.dart';
import 'package:farm_swap_karl/pages/dashboard_page/data/test_data/dsb_line_graph/pricePoint3.dart';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter/cupertino.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardRetrieveSpecificID id = DashboardRetrieveSpecificID();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*CREATING ONE ROW AND PUTTING 3 EXPANDED, THUS CREATING THREE DIVISIONS IN
      A SINGLE ROW */
      body: Row(
        children: [
/*FIRST EXPANDED THAT WILL CONTAIN ALL THE NAVIGATION */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                /*DECORATING THE CONTAINER */
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                /*A COLUMN THAT WILL HOLD THE NAVIGATIONS OPTIONS */
                child: const Column(
                  children: [
                    /*THE TITLE AND LOGO IN THE PAGE OPTIONS */
                    DashPageOptionsTitle(),
                    /*30 PXLS SPACE BETWEEN*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL HOLD THE DASHBOARD LOGO AND THE DASHBOARD LABEL */
                    DashBoardOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL CONTAIN THE  ADMIN ACCOUNT LOGO AND LABEL*/
                    DashAdminAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL CONTAIN THE USER ACCOUNTS LOGO AND LABEL */
                    DashUserAccountOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL CONTAIN THE LISTINGS ICON AND LABEL */
                    DashListingsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL CONTAIN THE TRANSACTIONS ICON AND LABEL */
                    DashTransactionsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL CONTAIN THE REPORTS ICON AND LABEL */
                    DashReportsOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL CONTAIN THE DISPUTE ICON AND LABEL */
                    DashDisputeOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL CONTAIN THE WALLET ICON AND LABEL */
                    DashWalletOptions(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 30,
                    ),
                    /*THIS ROW WILL CONTAIN THE COMMUNICATIONS ICON AND LABEL */
                    DashCommunicationOptionsBtn(),
                    /*30 SPACE BEFORE NEXT OPTION*/
                    SizedBox(
                      height: 40,
                    ),
                    /*THIS ROW WILL CONTAIN THE lOGOUT ICON AND LABEL */
                    DashLogoutOptionBtn(),
                  ],
                ),
              ),
            ),
          ),
/*SECOND EXPANDED THAT WILL HOLD THE MAIN CONTENT */
          Expanded(
            flex: 4,
            child: Container(
              /*SETTING THE BACKGROUND OF THE CENTER OF THE PAGE INTO WHITE */
              color: Colors.white,
              child: Padding(
                /*WRAPPING A SCAFFOLD WITH PADDING SO THAT IT WILL HAVE SOME SPACE
                FROM THE BORDERS OF THE OTHER 2 DIVISIONS */
                padding: const EdgeInsets.only(top: 15),
                /*PUTTING A SCAFFOLD INSIDE THE  CENTER CONTAINER SO THAT WE CAN
                USE THE BODY PROPERTY AND DECLARE SOME COLUMN OR ROWS THAT WILL HAVE
                A CHILDREN PROPERTY WHERE WE CAN PUT A LOT OF WIDGETS HEHEHE */
                child: Scaffold(
                  /*THIS IS AN APPBAR OF THE CENTER DIVISION THAT HAS THE DASHBOARD TITLE AND THE 
                  SEARCH BAR */
                  appBar: AppBar(
                    /*PUTTING AND STYLING THE DASHBOARD TITLE. I USED THE TEXT CLASS THAT I CREATED IN
                    THIS TITLE, THAT CLASS CAN BE FOUND IN WIDGET_DASHBOARD_TXT.DART*/
                    title: DashBoardTitleText(
                      myText: "Dashboard",
                      myColor: Colors.black,
                      mySize: 48,
                      myFont: GoogleFonts.poppins().fontFamily,
                      myWeight: FontWeight.w900,
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    /*IN THE  APPBAR, WE USED THE ACTIONS PROPERTY SO THAT WE CAN PUT
                    A LOT OF WIDGETS IN THE APPBAR, IN HERE IT IS USED SO THAT WE CAN PUT 
                    A TEXT FIELD WIDGET FOR SEARCHING*/
                    actions: const [
                      /*WRAPPING THE SEARCH TEXT FIEL WITH A PADDING SO THAT WE CAN
                      HAVE SPACES ARROUND THE BORDER OF THIS SEARCH BAR */
                      Padding(
                        padding: EdgeInsets.all(5),
                        /*PUTTING THE TEXT WIDGET IN A SIZEBOX SO THAT WE  CAN CONTROL THE
                        HEIGH AND WIDTH OF THE TEXT FIELD */
                        child: SizedBox(
                          width: 300,
                          height: 30,
                          /*WRAPPING THE SEARCH BAR TEXT FIELD WITH MATERIAL WIDGET
                          SO THAT WE CAN USE THE ELEVATION AND SHADOW COLOR TO PUT SOME NICE
                          ELEVATED AND SHADOW EFFECT TO OUR SEARCH BAR */
                          child: Material(
                            elevation: 5,
                            shadowColor: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            /*THE ACTUAL SEARCH BAR WHICH IS A TEXT FIELD, THIS IS A CLASS I CREATED 
                            IN A SEPRATE FILE, CHECK THAT IN WIDGET_DASHBOARD_SEARCH.DART */
                            child: DashBSearchBar(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                    ],
                  ),
/*START OF THE SECOND EXPANDEDS BODY */
                  body: SingleChildScrollView(
                    child: Padding(
                      /*WRAPPING THE BODY WITH PADDING SO THAT IT WILL NOT TOUCH THE BORDERS OF
                      OF OTHER EXPANDEDS */
                      padding: const EdgeInsets.all(20),
                      /*A COLUMN THAT WILL HOLD THE WIDGETS OF THE BODY */
                      child: Column(
                        children: [
                          /*A FIRST ROW CHILDREN THAT WILL HOLD LINE GRAPH AND THE CIRCLE GRAPH AS
                          FIRST ROWS OF THE BODY */
                          Row(
                            children: [
                              /*LINE GRAPH COLUMN, A COLUMN AS A CHILD OF THE FIRST ROW, THAT IS ASSIGNED TO HOLD THE LINE
                              GRAPH AND ITS TEXT LABLE "REVENUE" */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  DashBoardTxt(
                                      myText: "Revenue",
                                      myColor: Colors.black87,
                                      mySize: 30,
                                      myFont: GoogleFonts.viga().fontFamily,
                                      myWeight: FontWeight.bold),
                                  Container(
                                    width: 425,
                                    height: 300,
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      ),
                                    ], color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: DashboardLineChart(
                                        points: pricePoints,
                                        points2: pricePoints2,
                                        points3: pricePoints3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              /*PIE GRAPH COLUMN*/
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DashBoardTxt(
                                      myText: "Users",
                                      myColor: Colors.black87,
                                      mySize: 30,
                                      myFont: GoogleFonts.viga().fontFamily,
                                      myWeight: FontWeight.bold),
                                  Container(
                                    width: 425,
                                    height: 300,
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      ),
                                    ], color: Colors.white),
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: DashBoardPieChart(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          /*SECOND ROW THAT WILL HOLD THE BARGRAPHS */
                          Row(
                            children: [
                              /*HOLDER FOR BARTER BAR GRAPH */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DashBoardTxt(
                                      myText: "Barter Transactions",
                                      myColor: Colors.black87,
                                      mySize: 30,
                                      myFont: GoogleFonts.viga().fontFamily,
                                      myWeight: FontWeight.bold),
                                  Container(
                                    width: 425,
                                    height: 300,
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      ),
                                    ], color: Colors.white),
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: DashBoardBarChart(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              /*HOLDER FOR SELLING BAR GRAPH */
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DashBoardTxt(
                                      myText: "Sale Transactions",
                                      myColor: Colors.black87,
                                      mySize: 30,
                                      myFont: GoogleFonts.viga().fontFamily,
                                      myWeight: FontWeight.bold),
                                  Container(
                                    width: 425,
                                    height: 300,
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      ),
                                    ], color: Colors.white),
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 0),
                                      child: SellingBarGraph(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          /*THIRD EXPANDED THAT WILL HOLD THE EDIT PROFILE */
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  /*borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),*/
                  /*PUTTING BOX SHADOW ON THE CONTAINER */
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(-5, 5),
                    ),
                  ],
                ),
                /*COLUMN THAT WILL CONTAIN EVERY ITEM OF THIS EXPANDED */
                child: Column(
                  children: [
                    /*FIRST ROW OF THE COLUMN THAT WILL HOLD THE PROFILE LABEL, THE MESSAGE 
                    AND THE NOTIFICATION ICON*/
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          /*PROFILE TEXT */
                          DashBoardTxt(
                            myText: "Profile",
                            myColor: Colors.black,
                            mySize: 15,
                            myFont: GoogleFonts.poppins().fontFamily,
                            myWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 36,
                          ),
                          /*MESSAGE BUTTON */
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.envelope,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                          /*NOTIFICATIOIN BUTTON */
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.bell,
                              color: farmSwapTitlegreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    /*SECOND ROW THAT WILL CONTAIN THE PROFILE PICTURE AND ID */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*PROFILE PICTURE WITH AN IMAGE PICKER SO WE CAN PICK IMAGE */
                        FutureBuilder(
                          future: id.getDocsId(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              String data = snapshot.data!;
                              return ProfilePhoto(documentId: data);
                            } else {
                              return const Text("No data");
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    /*THE NAME OF THE USER */
                    FutureBuilder(
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!;
                          return ProfileName(documentId: data);
                        } else {
                          return const Text("No data");
                        }
                      },
                    ),
                    /*ID OF THE USER */
                    FutureBuilder(
                      future: id.getDocsId(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!;
                          return ProfileId(documentId: data);
                        } else {
                          return const Text("No data");
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    /*EDIT PROFILE BUTTON */
                    const AdminEditProfileBtn(),
                    const SizedBox(
                      height: 30,
                    ),
                    /*ADMIN RECENT ACTIVITIES BUTTON */
                    const AdminRecentActivitiesBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //function that access the profile field
}

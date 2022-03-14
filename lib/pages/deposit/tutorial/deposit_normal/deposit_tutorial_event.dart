// import 'package:tikop/manager/event_tracking.dart';

// class Intro01 extends EventTracking {
//   Intro01()
//       : super(
//             name: "Intro01",
//             screenName: "Intro01",
//             previousScreen: "splash_screen") {
//     impression = "Intro01_impression";
//   }
// }

// class Intro02 extends EventTracking {
//   Intro02()
//       : super(
//             name: "Intro02", screenName: "Intro02", previousScreen: "Intro01") {
//     impression = "Intro02_impression";
//   }
// }

// class Intro03 extends EventTracking {
//   Intro03()
//       : super(
//             name: "Intro03", screenName: "Intro03", previousScreen: "Intro02") {
//     impression = "Intro03_impression";
//   }
// }

// class BtnSkipIntro01 extends EventTracking {
//   BtnSkipIntro01()
//       : super(
//             name: "btn_skip_intro01",
//             screenName: "Intro01",
//             previousScreen: "splash_screen");
//   factory BtnSkipIntro01.impression() {
//     return BtnSkipIntro01()..impression = "btn_skip_intro01_impression";
//   }

//   factory BtnSkipIntro01.click() {
//     return BtnSkipIntro01()..click = "btn_skip_intro01_click";
//   }
// }

// class BtnNextIntro01 extends EventTracking {
//   BtnNextIntro01()
//       : super(
//             name: "btn_next_intro01",
//             screenName: "Intro01",
//             previousScreen: "splash_screen");

//   factory BtnNextIntro01.impression() {
//     return BtnNextIntro01()..impression = "btn_next_intro01_impression";
//   }

//   factory BtnNextIntro01.click() {
//     return BtnNextIntro01()..click = "btn_next_intro01_click";
//   }
// }

// class BtnSkipIntro02 extends EventTracking {
//   BtnSkipIntro02()
//       : super(
//             name: "btn_skip_intro02",
//             screenName: "Intro02",
//             previousScreen: "Intro01");
//   factory BtnSkipIntro02.impression() {
//     return BtnSkipIntro02()..impression = "btn_skip_intro02_impression";
//   }

//   factory BtnSkipIntro02.click() {
//     return BtnSkipIntro02()..click = "btn_skip_intro01_click";
//   }
// }

// class BtnNextIntro02 extends EventTracking {
//   BtnNextIntro02()
//       : super(
//             name: "btn_next_intro02",
//             screenName: "Intro02",
//             previousScreen: "Intro01");

//   factory BtnNextIntro02.impression() {
//     return BtnNextIntro02()..impression = "btn_next_intro02_impression";
//   }

//   factory BtnNextIntro02.click() {
//     return BtnNextIntro02()..click = "btn_next_intro02_click";
//   }
// }

// class BtnNextIntro03 extends EventTracking {
//   BtnNextIntro03()
//       : super(
//             name: "btn_next_intro03",
//             screenName: "Intro03",
//             previousScreen: "Intro02");

//   factory BtnNextIntro03.impression() {
//     return BtnNextIntro03()..impression = "btn_next_intro03_impression";
//   }

//   factory BtnNextIntro03.click() {
//     return BtnNextIntro03()..click = "btn_next_intro03_click";
//   }
// }

// class BtnBackIntro02 extends EventTracking {
//   BtnBackIntro02()
//       : super(
//             name: "btn_back_intro02",
//             screenName: "Intro02",
//             previousScreen: "Intro01");

//   factory BtnBackIntro02.impression() {
//     return BtnBackIntro02()..impression = "btn_back_intro02_impression";
//   }

//   factory BtnBackIntro02.click() {
//     return BtnBackIntro02()..click = "btn_back_intro02_click";
//   }
// }

// class BtnBackIntro03 extends EventTracking {
//   BtnBackIntro03()
//       : super(
//             name: "btn_back_intro03",
//             screenName: "Intro03",
//             previousScreen: "Intro02");

//   factory BtnBackIntro03.impression() {
//     return BtnBackIntro03()..impression = "btn_back_intro03_impression";
//   }

//   factory BtnBackIntro03.click() {
//     return BtnBackIntro03()..click = "btn_back_intro03_click";
//   }
// }

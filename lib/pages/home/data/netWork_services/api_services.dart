import 'package:trading_mobile/configs/constants.dart';
import 'package:trading_mobile/pages/home/data/netWork_services/api.dart';


class ApiServices {
  final api = Api(backendUrl: "", fullToken: "");

  fetchAllCases() async {
    var response = await api.getData(endPoint: "", timeOut: AppConstants.timeOut);
    if (response.success){
      //var body = json.decode(response.data);
    }

  }
  // fetchAllPopularMovies() async{
  //
  //   List<PopularMovieModel> popularMoviesList = [];
  //   var response = await Api.getData
  //   if (response.statusCode == 200)
  //   {
  //       var body = json.decode(response.body);
  //       List listJson = body['results'];
  //       for(int i = 0; i < listJson.length ; i++ )
  //       {
  //         PopularMovieModel movieModel = PopularMovieModel.fromJson(listJson[i]);
  //         popularMoviesList.add(movieModel);
  //       }
  //
  //   }
  //   else throw Exception(errorFromApi);
  //
  //   return popularMoviesList;
  // }


//   fetchMovieCast(movieId) async {
//
//     List<PopularMovieCastModel> popularMoviesCastList = [];
//     var fullVideoUrl = ApiUrls().movieCastUrl(movieId);
//
//     var response = await http.get(fullVideoUrl);
//
//
//     if (response.statusCode == 200)
//     {
//       var body = json.decode(response.body);
//       List listJson = body['cast'];
//       for(int i = 0; i < listJson.length ; i++ )
//       {
//         if (listJson[i]['profile_path'] != null) {
//           PopularMovieCastModel castModel = PopularMovieCastModel.fromJson(listJson[i]);
//           popularMoviesCastList.add(castModel);
//         }
//
//
//       }
//
//     }
//     else throw Exception(errorFromApi);
//
//     return popularMoviesCastList;
//   }
}
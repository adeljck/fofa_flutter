import 'package:exploitman/conf/config.dart';

var fofa = FoFaApi();
var FOFA_SEARCH_API = fofa.fofa_api + "/api/v1/search/all";
var FOFA_ANALYSE_API = fofa.fofa_api + "/api/v1/search/stats";
var FOFA_SEARCH_HOST = fofa.fofa_api + "/api/v1/host/";
void init() {
  fofa = FoFaApi();
}

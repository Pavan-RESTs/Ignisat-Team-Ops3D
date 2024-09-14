import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonData {
  static const List<LatLng> polygon1 = [
    LatLng(11.970156603427657, 79.81459159075456),
    LatLng(11.963234428551432, 79.80337877491212),
    LatLng(11.958465013045446, 79.80331183114222),
    LatLng(11.954860472030918, 79.80168439395592),
    LatLng(11.958710685533864, 79.79614666422268),
    LatLng(11.962075787900941, 79.79001704507364),
    LatLng(11.955221242396805, 79.78699871894561),
    LatLng(11.950992013360798, 79.78694603767468),
    LatLng(11.946344332770893, 79.78770526754316),
    LatLng(11.942675852769417, 79.78736748773132),
    LatLng(11.938361535437936, 79.78662065345425),
    LatLng(11.934051044600011, 79.78587238033548),
    LatLng(11.929005884970287, 79.78599943512901),
    LatLng(11.924134981911127, 79.79052115213536),
    LatLng(11.916195753041295, 79.79727012597432),
    LatLng(11.917221440268792, 79.79870476576343),
    LatLng(11.920693975363454, 79.80039023182526),
    LatLng(11.922434569283515, 79.80129382303834),
    LatLng(11.922895798202646, 79.80069971374608),
    LatLng(11.923565005196997, 79.80170420101166),
    LatLng(11.923115644830132, 79.80468684240586),
    LatLng(11.921551168254265, 79.80430075422257),
    LatLng(11.918884647640725, 79.80168864497551),
    LatLng(11.914637577359183, 79.80093269498173),
    LatLng(11.914547935809564, 79.79766830328815),
    LatLng(11.914285862783897, 79.79890442849175),
    LatLng(11.914283894463486, 79.79985594214156),
    LatLng(11.914086354588651, 79.80085817484714),
    LatLng(11.907543397190393, 79.79972084517024),
    LatLng(11.902673743263806, 79.80178435480812),
    LatLng(11.901694494486922, 79.80994541631475),
    LatLng(11.900581683322422, 79.81415112004127),
    LatLng(11.904665467970057, 79.81844265446712),
    LatLng(11.905295352166123, 79.81705863465918),
    LatLng(11.905882144550942, 79.81485949589523),
    LatLng(11.908018599492674, 79.81341187179495),
    LatLng(11.909560841416136, 79.81301821002468),
    LatLng(11.912443050836078, 79.81556236879914),
    LatLng(11.911467479079416, 79.81467461449628),
    LatLng(11.910262511900697, 79.81407466215344),
    LatLng(11.907160993559243, 79.81453629794814),
    LatLng(11.906720077802351, 79.81745454126411),
    LatLng(11.907832863822074, 79.8187420016021),
    LatLng(11.908641205551417, 79.82132765109516),
    LatLng(11.909124109833352, 79.82197138123838),
    LatLng(11.908315769558309, 79.82597323711232),
    LatLng(11.912871837879244, 79.82667061147045),
    LatLng(11.915118350297583, 79.82478233638365),
    LatLng(11.917196882679232, 79.82191773720932),
    LatLng(11.918671983160719, 79.81880724570962),
    LatLng(11.918412182168332, 79.81836723264323),
    LatLng(11.91748803089255, 79.81749099968333),
    LatLng(11.916103653823935, 79.81529472749865),
    LatLng(11.917078645673637, 79.81602916841257),
    LatLng(11.917910999095469, 79.8167364830169),
    LatLng(11.91823832839366, 79.81706146540267),
    LatLng(11.91925210324161, 79.82083778658274),
    LatLng(11.923272492015139, 79.82536696009187),
    LatLng(11.93077151588526, 79.8218637466661),
    LatLng(11.92846160433813, 79.82087924112196),
    LatLng(11.920156815113167, 79.82850531769657),
    LatLng(11.916532866763882, 79.8287351149643),
    LatLng(11.908140588862063, 79.8273550007609),
    LatLng(11.906630586267807, 79.82928401167241),
    LatLng(11.907700172305583, 79.82966981385474),
    LatLng(11.956096029677871, 79.8402539658619),
    LatLng(11.961182901096748, 79.82847813255727),
    LatLng(11.973450844351198, 79.81869042695341),
    LatLng(11.972553208848488, 79.81333777545129),
    LatLng(11.970156603427657, 79.81459159075455),
  ];

  static const List<LatLng> polygon2 = [
    LatLng(11.955779908040482, 79.81799244646074),
    LatLng(11.956978181320132, 79.82054420804583),
    LatLng(11.961771221362929, 79.82125870128965),
    LatLng(11.964666975227017, 79.81891108063138),
    LatLng(11.964167709531846, 79.81339927560761),
    LatLng(11.959674276794566, 79.81166407772976),
    LatLng(11.955480338891405, 79.81135786633953),
    LatLng(11.955380482434672, 79.81421583931483),
    LatLng(11.955779908040482, 79.81799244646074)
  ];

  static const List<LatLng> polygon3 = [
    LatLng(11.93071480970614, 79.79176033736613),
    LatLng(11.93470940301161, 79.79339346478058),
    LatLng(11.935208723036288, 79.7970680014631),
    LatLng(11.935308586930852, 79.80155910185285),
    LatLng(11.933710760203034, 79.80268187695027),
    LatLng(11.93091454076915, 79.80288601787709),
    LatLng(11.928318025475772, 79.80074253814561),
    LatLng(11.927219492291423, 79.79798663563372),
    LatLng(11.926720157555051, 79.79421002848781),
    LatLng(11.928118292500459, 79.79196447829294),
    LatLng(11.93071480970614, 79.79176033736613)
  ];

  static const List<LatLng> polygon4 = [
    LatLng(11.943079173997836, 79.82669005788124),
    LatLng(11.940466542017043, 79.82086367765835),
    LatLng(11.935478720099274, 79.81795048754688),
    LatLng(11.928234339102556, 79.81807187046819),
    LatLng(11.927759290964191, 79.82329133608455),
    LatLng(11.933763454738575, 79.83112243951511),
    LatLng(11.934961825434453, 79.8321176265333),
    LatLng(11.935660872560481, 79.83183693275895),
    LatLng(11.943079173997836, 79.82669005788124)
  ];
}

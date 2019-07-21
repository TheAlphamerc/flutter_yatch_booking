import 'package:flutter_yatch_booking/model/yatch.dart';
import 'package:scoped_model/scoped_model.dart';

class ConnectedModel extends Model{
  List<Yatch>  _yatchList =  [
    Yatch(
      id:'1',
      name : 'Atlandita',
      isBookmark: false,
      hasTag: 'Yatching',
      price: '1000',
      lenght: '22',
      height: '12',
      draft: '12',
      image: 'assets/image/yatch_side_1.png',
      detailImage: 'assets/image/yatch_1.png',
     ),
      Yatch(
        id:'2',
      name : 'Hakamai',
      isBookmark: false,
      hasTag: 'Yatching',
      price: '5000',
      lenght: '43',
      height: '23',
      draft: '16',
      image: 'assets/image/yatch_side_2.png',
      detailImage: 'assets/image/yatch_2.png',
     ),
      Yatch(
        id:'3',
      name : 'Feisla',
      isBookmark: false,
      hasTag: 'Yatching',
      price: '18000',
      lenght: '42',
      height: '23',
      draft: '34',
      image: 'assets/image/yatch_side_3.png',
      detailImage: 'assets/image/yatch_3.png',
     ),
      Yatch(
        id:'4',
      name : 'Louise',
      isBookmark: false,
      hasTag: 'Yatching',
      price: '1500',
      lenght: '32',
      height: '24',
      draft: '54',
      image: 'assets/image/yatch_side_4.png',
      detailImage: 'assets/image/yatch_4.png',
     ),
      Yatch(
        id:'5',
      name : 'Mistas',
      isBookmark: false,
      hasTag: 'Yatching',
      price: '92000',
      lenght: '54',
      height: '36',
      draft: '82',
      image: 'assets/image/yatch_side_5.png',
      detailImage: 'assets/image/yatch_5.png',
     ),
  ];
}
class YatchModel extends ConnectedModel {
  List<Yatch> get allYatch {
    return List.from(_yatchList);
  }
  int _selectedYatchId;
  void setSelectedYatchId(int id){
    _selectedYatchId = id;
  }
   Yatch get selectedProductIndex {
    return _yatchList.firstWhere((x) {
      return x.id ==_selectedYatchId.toString();
    });
  }
}
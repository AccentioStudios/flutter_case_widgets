import 'package:book_widgets/app/modules/home/data_source/home_data_source_local_app_impl.dart';
import 'package:book_widgets/app/modules/home/data_source/home_data_source_shared_preferences_impl.dart';
import 'package:book_widgets/app/modules/home/favorite_page.dart';
import 'package:book_widgets/app/modules/home/home_controller.dart';
import 'package:book_widgets/app/modules/home/home_page.dart';
import 'package:book_widgets/app/modules/book_detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i){
   i.addSingleton(HomeController.new);
   i.add<IDataSource>(HomeDataSourceSharedPreferencesImpl.new);
   i.add<IDataSourceLocalApp>(HomeDataSourceLocalAppImpl.new);
  }

  @override
  void routes(r){
    r.child('/', child: (context) => HomePage(controller: Modular.get()));
    r.child('/bookdetail/', child: (context) => BookDetailPage(book: r.args.data[0], controller: Modular.get(), index:  r.args.data[1]) );
    r.child('/favorite/', child:(context) => FavoritePage(controller: Modular.get()));
    
  }
}
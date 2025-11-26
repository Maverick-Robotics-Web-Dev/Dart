import 'package:e_commerce_valamy/src/presentation/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<ProductsBloc>(
    create:
        (context) =>
            ProductsBloc()
              ..add(LoadPopularProducts())
              ..add(LoadFlashSaleProducts())
              ..add(LoadBestSellersProducts())
              ..add(LoadKidsProducts()),
  ),
];

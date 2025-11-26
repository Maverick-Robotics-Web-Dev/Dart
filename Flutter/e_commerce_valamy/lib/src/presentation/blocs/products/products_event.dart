abstract class ProductsEvent {
  const ProductsEvent();
}

class LoadPopularProducts extends ProductsEvent {
  LoadPopularProducts();
}

class LoadFlashSaleProducts extends ProductsEvent {
  LoadFlashSaleProducts();
}

class LoadBestSellersProducts extends ProductsEvent {
  LoadBestSellersProducts();
}

class LoadKidsProducts extends ProductsEvent {
  LoadKidsProducts();
}

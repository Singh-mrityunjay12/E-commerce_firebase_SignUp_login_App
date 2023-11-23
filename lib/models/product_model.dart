class ProductModel {
  final String productId;
  final String categaryId;
  final String productName;
  final String categaryName;
  final String salePrice;
  final List productImage;
  final String deliveryTime;
  final bool isSale;
  final String productDiscription;
  final dynamic createdAt;
  final dynamic updateAt;
  ProductModel(
      {required this.productId,
      required this.categaryId,
      required this.productName,
      required this.categaryName,
      required this.salePrice,
      required this.productImage,
      required this.deliveryTime,
      required this.isSale,
      required this.productDiscription,
      required this.createdAt,
      required this.updateAt});
}

import 'package:costly/features/home/data/models/products/main_variation.dart';
import 'package:costly/features/home/data/models/products/media_link.dart';
import 'package:costly/features/home/data/models/products/variation.dart';

class Product {
  String id;
  String enName;
  String arName;
  String arSlug;
  String enSlug;
  int mainVariationPrice;
  String? status;
  String? visibilityStatus;
  String? productVariationType;
  String? enOverview;
  String? arOverview;
  int? favoritesCount;
  int? viewsCount;
  int? averageRate;
  bool? isPrimary;
  bool? special;
  dynamic primaryProductId;
  String? brandId;
  dynamic colorId;
  dynamic categorizationId;
  dynamic classificationId;
  String? creatorId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  dynamic fabricId;
  dynamic discountId;
  String? slugByLang;
  String? nameByLang;
  String? overviewByLang;
  List<MediaLink>? mediaLinks;
  String mainMediaUrl;
  MainVariation? mainVariation;
  bool? isFavorited;
  bool? isInCart;
  dynamic categorization;
  List<Variation>? variations;

  Product({
    required this.id,
    required this.enName,
    required this.arName,
    required this.arSlug,
    required this.enSlug,
    required this.mainVariationPrice,
    this.status,
    this.visibilityStatus,
    this.productVariationType,
    this.enOverview,
    this.arOverview,
    this.favoritesCount,
    this.viewsCount,
    this.averageRate,
    this.isPrimary,
    this.special,
    this.primaryProductId,
    this.brandId,
    this.colorId,
    this.categorizationId,
    this.classificationId,
    this.creatorId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.fabricId,
    this.discountId,
    this.slugByLang,
    this.nameByLang,
    this.overviewByLang,
    this.mediaLinks,
    required this.mainMediaUrl,
    this.mainVariation,
    this.isFavorited,
    this.isInCart,
    this.categorization,
    this.variations,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as String,
        enName: json['en_name'] as String,
        arName: json['ar_name'] as String,
        arSlug: json['ar_slug'] as String,
        enSlug: json['en_slug'] as String,
        mainVariationPrice: json['main_variation_price'] as int,
        status: json['status'] as String?,
        visibilityStatus: json['visibility_status'] as String?,
        productVariationType: json['product_variation_type'] as String?,
        enOverview: json['en_overview'] as String?,
        arOverview: json['ar_overview'] as String?,
        favoritesCount: json['favorites_count'] as int?,
        viewsCount: json['views_count'] as int?,
        averageRate: json['average_rate'] as int?,
        isPrimary: json['is_primary'] as bool?,
        special: json['special'] as bool?,
        primaryProductId: json['primary_product_id'] as dynamic,
        brandId: json['brand_id'] as String?,
        colorId: json['color_id'] as dynamic,
        categorizationId: json['categorization_id'] as dynamic,
        classificationId: json['classification_id'] as dynamic,
        creatorId: json['creator_id'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        fabricId: json['fabric_id'] as dynamic,
        discountId: json['discount_id'] as dynamic,
        slugByLang: json['slug_by_lang'] as String?,
        nameByLang: json['name_by_lang'] as String?,
        overviewByLang: json['overview_by_lang'] as String?,
        mediaLinks: (json['media_links'] as List<dynamic>?)
            ?.map((e) => MediaLink.fromJson(e as Map<String, dynamic>))
            .toList(),
        mainMediaUrl: json['main_media_url'] as String,
        mainVariation: json['main_variation'] == null
            ? throw ArgumentError(
                "Main variation is required.") // Throw error if null
            : MainVariation.fromJson(
                json['main_variation'] as Map<String, dynamic>),
        isFavorited: json['is_favorited'] as bool?,
        isInCart: json['is_in_cart'] as bool?,
        categorization: json['categorization'] as dynamic,
        variations: (json['variations'] as List<dynamic>?)
            ?.map((e) => Variation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'en_name': enName,
        'ar_name': arName,
        'ar_slug': arSlug,
        'en_slug': enSlug,
        'main_variation_price': mainVariationPrice,
        'status': status,
        'visibility_status': visibilityStatus,
        'product_variation_type': productVariationType,
        'en_overview': enOverview,
        'ar_overview': arOverview,
        'favorites_count': favoritesCount,
        'views_count': viewsCount,
        'average_rate': averageRate,
        'is_primary': isPrimary,
        'special': special,
        'primary_product_id': primaryProductId,
        'brand_id': brandId,
        'color_id': colorId,
        'categorization_id': categorizationId,
        'classification_id': classificationId,
        'creator_id': creatorId,
        'deleted_at': deletedAt,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'fabric_id': fabricId,
        'discount_id': discountId,
        'slug_by_lang': slugByLang,
        'name_by_lang': nameByLang,
        'overview_by_lang': overviewByLang,
        'media_links': mediaLinks?.map((e) => e.toJson()).toList(),
        'main_media_url': mainMediaUrl,
        'main_variation': mainVariation?.toJson(),
        'is_favorited': isFavorited,
        'is_in_cart': isInCart,
        'categorization': categorization,
        'variations': variations?.map((e) => e.toJson()).toList(),
      };
}

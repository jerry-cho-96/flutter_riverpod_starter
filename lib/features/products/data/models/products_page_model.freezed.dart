// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsPageModel {

 List<ProductModel> get items; bool get hasMore;
/// Create a copy of ProductsPageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsPageModelCopyWith<ProductsPageModel> get copyWith => _$ProductsPageModelCopyWithImpl<ProductsPageModel>(this as ProductsPageModel, _$identity);

  /// Serializes this ProductsPageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsPageModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),hasMore);

@override
String toString() {
  return 'ProductsPageModel(items: $items, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $ProductsPageModelCopyWith<$Res>  {
  factory $ProductsPageModelCopyWith(ProductsPageModel value, $Res Function(ProductsPageModel) _then) = _$ProductsPageModelCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> items, bool hasMore
});




}
/// @nodoc
class _$ProductsPageModelCopyWithImpl<$Res>
    implements $ProductsPageModelCopyWith<$Res> {
  _$ProductsPageModelCopyWithImpl(this._self, this._then);

  final ProductsPageModel _self;
  final $Res Function(ProductsPageModel) _then;

/// Create a copy of ProductsPageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsPageModel].
extension ProductsPageModelPatterns on ProductsPageModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductsPageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductsPageModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductsPageModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductsPageModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductsPageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductsPageModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductModel> items,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductsPageModel() when $default != null:
return $default(_that.items,_that.hasMore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductModel> items,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _ProductsPageModel():
return $default(_that.items,_that.hasMore);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductModel> items,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _ProductsPageModel() when $default != null:
return $default(_that.items,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductsPageModel implements ProductsPageModel {
  const _ProductsPageModel({required final  List<ProductModel> items, required this.hasMore}): _items = items;
  factory _ProductsPageModel.fromJson(Map<String, dynamic> json) => _$ProductsPageModelFromJson(json);

 final  List<ProductModel> _items;
@override List<ProductModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  bool hasMore;

/// Create a copy of ProductsPageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsPageModelCopyWith<_ProductsPageModel> get copyWith => __$ProductsPageModelCopyWithImpl<_ProductsPageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductsPageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsPageModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasMore);

@override
String toString() {
  return 'ProductsPageModel(items: $items, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$ProductsPageModelCopyWith<$Res> implements $ProductsPageModelCopyWith<$Res> {
  factory _$ProductsPageModelCopyWith(_ProductsPageModel value, $Res Function(_ProductsPageModel) _then) = __$ProductsPageModelCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> items, bool hasMore
});




}
/// @nodoc
class __$ProductsPageModelCopyWithImpl<$Res>
    implements _$ProductsPageModelCopyWith<$Res> {
  __$ProductsPageModelCopyWithImpl(this._self, this._then);

  final _ProductsPageModel _self;
  final $Res Function(_ProductsPageModel) _then;

/// Create a copy of ProductsPageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasMore = null,}) {
  return _then(_ProductsPageModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsQuery {

 String get category; String get searchTerm;
/// Create a copy of ProductsQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsQueryCopyWith<ProductsQuery> get copyWith => _$ProductsQueryCopyWithImpl<ProductsQuery>(this as ProductsQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsQuery&&(identical(other.category, category) || other.category == category)&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm));
}


@override
int get hashCode => Object.hash(runtimeType,category,searchTerm);

@override
String toString() {
  return 'ProductsQuery(category: $category, searchTerm: $searchTerm)';
}


}

/// @nodoc
abstract mixin class $ProductsQueryCopyWith<$Res>  {
  factory $ProductsQueryCopyWith(ProductsQuery value, $Res Function(ProductsQuery) _then) = _$ProductsQueryCopyWithImpl;
@useResult
$Res call({
 String category, String searchTerm
});




}
/// @nodoc
class _$ProductsQueryCopyWithImpl<$Res>
    implements $ProductsQueryCopyWith<$Res> {
  _$ProductsQueryCopyWithImpl(this._self, this._then);

  final ProductsQuery _self;
  final $Res Function(ProductsQuery) _then;

/// Create a copy of ProductsQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? searchTerm = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,searchTerm: null == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsQuery].
extension ProductsQueryPatterns on ProductsQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductsQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductsQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductsQuery value)  $default,){
final _that = this;
switch (_that) {
case _ProductsQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductsQuery value)?  $default,){
final _that = this;
switch (_that) {
case _ProductsQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  String searchTerm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductsQuery() when $default != null:
return $default(_that.category,_that.searchTerm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  String searchTerm)  $default,) {final _that = this;
switch (_that) {
case _ProductsQuery():
return $default(_that.category,_that.searchTerm);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  String searchTerm)?  $default,) {final _that = this;
switch (_that) {
case _ProductsQuery() when $default != null:
return $default(_that.category,_that.searchTerm);case _:
  return null;

}
}

}

/// @nodoc


class _ProductsQuery implements ProductsQuery {
  const _ProductsQuery({this.category = 'all', this.searchTerm = ''});
  

@override@JsonKey() final  String category;
@override@JsonKey() final  String searchTerm;

/// Create a copy of ProductsQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsQueryCopyWith<_ProductsQuery> get copyWith => __$ProductsQueryCopyWithImpl<_ProductsQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsQuery&&(identical(other.category, category) || other.category == category)&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm));
}


@override
int get hashCode => Object.hash(runtimeType,category,searchTerm);

@override
String toString() {
  return 'ProductsQuery(category: $category, searchTerm: $searchTerm)';
}


}

/// @nodoc
abstract mixin class _$ProductsQueryCopyWith<$Res> implements $ProductsQueryCopyWith<$Res> {
  factory _$ProductsQueryCopyWith(_ProductsQuery value, $Res Function(_ProductsQuery) _then) = __$ProductsQueryCopyWithImpl;
@override @useResult
$Res call({
 String category, String searchTerm
});




}
/// @nodoc
class __$ProductsQueryCopyWithImpl<$Res>
    implements _$ProductsQueryCopyWith<$Res> {
  __$ProductsQueryCopyWithImpl(this._self, this._then);

  final _ProductsQuery _self;
  final $Res Function(_ProductsQuery) _then;

/// Create a copy of ProductsQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? searchTerm = null,}) {
  return _then(_ProductsQuery(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,searchTerm: null == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

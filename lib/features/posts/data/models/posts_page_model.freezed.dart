// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostsPageModel {

 List<PostModel> get items; bool get hasMore;
/// Create a copy of PostsPageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsPageModelCopyWith<PostsPageModel> get copyWith => _$PostsPageModelCopyWithImpl<PostsPageModel>(this as PostsPageModel, _$identity);

  /// Serializes this PostsPageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsPageModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),hasMore);

@override
String toString() {
  return 'PostsPageModel(items: $items, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $PostsPageModelCopyWith<$Res>  {
  factory $PostsPageModelCopyWith(PostsPageModel value, $Res Function(PostsPageModel) _then) = _$PostsPageModelCopyWithImpl;
@useResult
$Res call({
 List<PostModel> items, bool hasMore
});




}
/// @nodoc
class _$PostsPageModelCopyWithImpl<$Res>
    implements $PostsPageModelCopyWith<$Res> {
  _$PostsPageModelCopyWithImpl(this._self, this._then);

  final PostsPageModel _self;
  final $Res Function(PostsPageModel) _then;

/// Create a copy of PostsPageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PostModel>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PostsPageModel].
extension PostsPageModelPatterns on PostsPageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostsPageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostsPageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostsPageModel value)  $default,){
final _that = this;
switch (_that) {
case _PostsPageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostsPageModel value)?  $default,){
final _that = this;
switch (_that) {
case _PostsPageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PostModel> items,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostsPageModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PostModel> items,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _PostsPageModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PostModel> items,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _PostsPageModel() when $default != null:
return $default(_that.items,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostsPageModel implements PostsPageModel {
  const _PostsPageModel({required final  List<PostModel> items, required this.hasMore}): _items = items;
  factory _PostsPageModel.fromJson(Map<String, dynamic> json) => _$PostsPageModelFromJson(json);

 final  List<PostModel> _items;
@override List<PostModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  bool hasMore;

/// Create a copy of PostsPageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostsPageModelCopyWith<_PostsPageModel> get copyWith => __$PostsPageModelCopyWithImpl<_PostsPageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostsPageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostsPageModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasMore);

@override
String toString() {
  return 'PostsPageModel(items: $items, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$PostsPageModelCopyWith<$Res> implements $PostsPageModelCopyWith<$Res> {
  factory _$PostsPageModelCopyWith(_PostsPageModel value, $Res Function(_PostsPageModel) _then) = __$PostsPageModelCopyWithImpl;
@override @useResult
$Res call({
 List<PostModel> items, bool hasMore
});




}
/// @nodoc
class __$PostsPageModelCopyWithImpl<$Res>
    implements _$PostsPageModelCopyWith<$Res> {
  __$PostsPageModelCopyWithImpl(this._self, this._then);

  final _PostsPageModel _self;
  final $Res Function(_PostsPageModel) _then;

/// Create a copy of PostsPageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasMore = null,}) {
  return _then(_PostsPageModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PostModel>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

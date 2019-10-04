// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueAnalyzerIgnoreGenerator
// **************************************************************************

// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: unnecessary_new
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

class _$AppState extends AppState {
  @override
  final CardIdEnum activeCard;
  @override
  final bool isCardHidden;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.activeCard, this.isCardHidden}) : super._() {
    if (activeCard == null) {
      throw new BuiltValueNullFieldError('AppState', 'activeCard');
    }
    if (isCardHidden == null) {
      throw new BuiltValueNullFieldError('AppState', 'isCardHidden');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        activeCard == other.activeCard &&
        isCardHidden == other.isCardHidden;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, activeCard.hashCode), isCardHidden.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('activeCard', activeCard)
          ..add('isCardHidden', isCardHidden))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  CardIdEnum _activeCard;
  CardIdEnum get activeCard => _$this._activeCard;
  set activeCard(CardIdEnum activeCard) => _$this._activeCard = activeCard;

  bool _isCardHidden;
  bool get isCardHidden => _$this._isCardHidden;
  set isCardHidden(bool isCardHidden) => _$this._isCardHidden = isCardHidden;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _activeCard = _$v.activeCard;
      _isCardHidden = _$v.isCardHidden;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    final _$result = _$v ??
        new _$AppState._(activeCard: activeCard, isCardHidden: isCardHidden);
    replace(_$result);
    return _$result;
  }
}

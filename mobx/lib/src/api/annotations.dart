/// Declares configuration of a Store class.
/// Currently the only configuration used is boolean to indicate generation of toString method (true), or not (false)
library;

class StoreConfig {
  const StoreConfig({this.hasToString = true});

  final bool hasToString;
}

/// Internal class only used for code-generation with `mobx_codegen`.
///
/// During code-generation, this type is detected to identify an `Observable`
/// [readOnly] indicates that the field is only modifiable within the Store.
/// It is possible to override equality comparison of new values with [equals].
/// ```
///
/// bool _alwaysNotEqual(_, __) => false;
///
/// @MakeObservable(equals: _alwaysNotEqual)
/// String alwaysNotifyObservable = 'hello';
///
/// bool _equals(oldValue, newValue) => oldValue == newValue;
///
/// @MakeObservable(equals: _equals)
/// String withEquals = 'world';
/// ```
class MakeObservable {
  const MakeObservable({
    this.readOnly = false,
    this.equals,
    this.useDeepEquality = true,
  });

  final bool readOnly;

  /// A [Function] to use check whether the value of an observable has changed.
  ///
  /// Must be a top-level or static [Function] that takes two arguments and
  /// returns a [bool].
  /// The arguments are the old value and the new value of the observable.
  /// If the function returns `true`, a reaction will be triggered.
  /// If the function returns `false`, no reaction will be triggered.
  /// If no function is provided, the default behavior is to only trigger if
  /// : `oldValue != newValue`.
  final Function? equals;

  /// By default, MobX uses the `==` to compare the previous value. This is fine for
  /// primitives, but for Iterable and Map, you may want to use a deep equality on collections. When
  /// using deep equal, no reaction will occur if all elements are equal.
  final bool useDeepEquality;
}

bool observableAlwaysNotEqual(_, _) => false;

/// Declares a class field as an observable. See the `Observable` class for full
/// documentation
const MakeObservable observable = MakeObservable();

/// Declares a class field as an observable. See the `Observable` class for full
/// documentation.
///
/// But, it's only modifiable within the Store
const MakeObservable readonly = MakeObservable(readOnly: true);

/// Allows a reaction to be fired even if the value hasn't changed.
const MakeObservable alwaysNotify = MakeObservable(
  equals: observableAlwaysNotEqual,
);

/// Internal class only used for code-generation with `mobx_codegen`.
///
/// During code-generation, this type is detected to identify a `Computed`
class MakeComputed {
  const MakeComputed({this.keepAlive, this.useDeepEquality});

  final bool? keepAlive;

  /// When true, uses deep collection equality for comparing computed values.
  /// This is useful when the computed returns a List, Set, or Map and you want
  /// to avoid notifying observers when the collection contents are the same.
  final bool? useDeepEquality;
}

/// Declares a method as a computed value. See the `Computed` class for full
/// documentation.
const MakeComputed computed = MakeComputed();

/// Internal class only used for code-generation with `mobx_codegen`.
///
/// During code-generation, this type is detected to identify an `Action`
class MakeAction {
  const MakeAction._();
}

/// Declares a method as an action. See the `Action` class for full
/// documentation.
const MakeAction action = MakeAction._();

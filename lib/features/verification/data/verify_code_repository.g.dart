// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyCodeRepositorHash() =>
    r'6b6c7437b3e593d272b5f0102a5ac2b45ec2acd4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [verifyCodeRepositor].
@ProviderFor(verifyCodeRepositor)
const verifyCodeRepositorProvider = VerifyCodeRepositorFamily();

/// See also [verifyCodeRepositor].
class VerifyCodeRepositorFamily extends Family<VerifyCodeRepository> {
  /// See also [verifyCodeRepositor].
  const VerifyCodeRepositorFamily();

  /// See also [verifyCodeRepositor].
  VerifyCodeRepositorProvider call({
    required String code,
    required String cellphone,
  }) {
    return VerifyCodeRepositorProvider(
      code: code,
      cellphone: cellphone,
    );
  }

  @override
  VerifyCodeRepositorProvider getProviderOverride(
    covariant VerifyCodeRepositorProvider provider,
  ) {
    return call(
      code: provider.code,
      cellphone: provider.cellphone,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'verifyCodeRepositorProvider';
}

/// See also [verifyCodeRepositor].
class VerifyCodeRepositorProvider
    extends AutoDisposeProvider<VerifyCodeRepository> {
  /// See also [verifyCodeRepositor].
  VerifyCodeRepositorProvider({
    required String code,
    required String cellphone,
  }) : this._internal(
          (ref) => verifyCodeRepositor(
            ref as VerifyCodeRepositorRef,
            code: code,
            cellphone: cellphone,
          ),
          from: verifyCodeRepositorProvider,
          name: r'verifyCodeRepositorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyCodeRepositorHash,
          dependencies: VerifyCodeRepositorFamily._dependencies,
          allTransitiveDependencies:
              VerifyCodeRepositorFamily._allTransitiveDependencies,
          code: code,
          cellphone: cellphone,
        );

  VerifyCodeRepositorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.code,
    required this.cellphone,
  }) : super.internal();

  final String code;
  final String cellphone;

  @override
  Override overrideWith(
    VerifyCodeRepository Function(VerifyCodeRepositorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyCodeRepositorProvider._internal(
        (ref) => create(ref as VerifyCodeRepositorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        code: code,
        cellphone: cellphone,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<VerifyCodeRepository> createElement() {
    return _VerifyCodeRepositorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyCodeRepositorProvider &&
        other.code == code &&
        other.cellphone == cellphone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);
    hash = _SystemHash.combine(hash, cellphone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyCodeRepositorRef on AutoDisposeProviderRef<VerifyCodeRepository> {
  /// The parameter `code` of this provider.
  String get code;

  /// The parameter `cellphone` of this provider.
  String get cellphone;
}

class _VerifyCodeRepositorProviderElement
    extends AutoDisposeProviderElement<VerifyCodeRepository>
    with VerifyCodeRepositorRef {
  _VerifyCodeRepositorProviderElement(super.provider);

  @override
  String get code => (origin as VerifyCodeRepositorProvider).code;
  @override
  String get cellphone => (origin as VerifyCodeRepositorProvider).cellphone;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

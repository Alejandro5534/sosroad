// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_phone_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendPhoneHash() => r'0664f60ec1a0b4ec69f1df399b8834f9034dcd19';

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

/// See also [sendPhone].
@ProviderFor(sendPhone)
const sendPhoneProvider = SendPhoneFamily();

/// See also [sendPhone].
class SendPhoneFamily extends Family<SendPhoneRepository> {
  /// See also [sendPhone].
  const SendPhoneFamily();

  /// See also [sendPhone].
  SendPhoneProvider call(
    String phone,
  ) {
    return SendPhoneProvider(
      phone,
    );
  }

  @override
  SendPhoneProvider getProviderOverride(
    covariant SendPhoneProvider provider,
  ) {
    return call(
      provider.phone,
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
  String? get name => r'sendPhoneProvider';
}

/// See also [sendPhone].
class SendPhoneProvider extends AutoDisposeProvider<SendPhoneRepository> {
  /// See also [sendPhone].
  SendPhoneProvider(
    String phone,
  ) : this._internal(
          (ref) => sendPhone(
            ref as SendPhoneRef,
            phone,
          ),
          from: sendPhoneProvider,
          name: r'sendPhoneProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendPhoneHash,
          dependencies: SendPhoneFamily._dependencies,
          allTransitiveDependencies: SendPhoneFamily._allTransitiveDependencies,
          phone: phone,
        );

  SendPhoneProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phone,
  }) : super.internal();

  final String phone;

  @override
  Override overrideWith(
    SendPhoneRepository Function(SendPhoneRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendPhoneProvider._internal(
        (ref) => create(ref as SendPhoneRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phone: phone,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<SendPhoneRepository> createElement() {
    return _SendPhoneProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendPhoneProvider && other.phone == phone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendPhoneRef on AutoDisposeProviderRef<SendPhoneRepository> {
  /// The parameter `phone` of this provider.
  String get phone;
}

class _SendPhoneProviderElement
    extends AutoDisposeProviderElement<SendPhoneRepository> with SendPhoneRef {
  _SendPhoneProviderElement(super.provider);

  @override
  String get phone => (origin as SendPhoneProvider).phone;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

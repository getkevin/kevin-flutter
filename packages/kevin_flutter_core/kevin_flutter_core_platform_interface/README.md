# kevin_flutter_core_platform_interface

A common platform interface for the [`kevin_flutter_core`][1] plugin.

This interface allows platform-specific implementations of the `kevin_flutter_core`
plugin, as well as the plugin itself, to ensure they are supporting the
same interface.

# Usage

To implement a new platform-specific implementation of `kevin_flutter_core`, extend
[`KevinFlutterCorePlatformInterface`][2] with an implementation that performs the
platform-specific behavior, and when you register your plugin, set the default
`KevinFlutterCorePlatformInterface` by calling
`KevinFlutterCorePlatformInterface.instance = MyPlatformKevinFlutterCore()`.

# Note on breaking changes

Strongly prefer non-breaking changes (such as adding a method to the interface)
over breaking changes for this package.

See https://flutter.dev/go/platform-interface-breaking-changes for a discussion
on why a less-clean interface is preferable to a breaking change.

[1]: ../kevin_flutter_core
[2]: lib/src/kevin_flutter_core_platform_interface.dart

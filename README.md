# Babylon Native Flutter plugin

<img src="assets/images/screenshot001.jpg" width="512" height="1138">

https://github.com/BabylonJS/BabylonNative

Babylon Native is a collection of technologies intended to bring the power and flexibility of Babylon.js to cross-platform applications beyond the browser. The goal of this project is to allow the same JavaScript that powers Babylon.js apps on the Web to work identically in native apps on Windows, macOS, iOS, Android, and Linux.

This Flutter plugin brings all the Babylon Native technologies, ready to use, inside your app.

## Status

This plugin is a work in progress, non production-ready. PRs are welcome.

## Todo
- [x] Android PoC
- [ ] iOS port
- [ ] MacOS port
- [ ] Windows port
- [ ] Linux port
- [ ] On ready state exposed with a callback
- [ ] Ability to load/run a script URL or a code snipppet from Dart
- [x] CI build / Github Action
- [ ] CI publish / Github Action
- [x] Fix local builds

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Building

Clone repo with submodules
```
git clone --recursive https://github.com/CedricGuillemet/babylonnative_flutter.git
```

Install node modules

```
cd babylonnative_flutter/BabylonNative/Apps
npm i
```

Build and run example

```
cd babylonnative_flutter/example
flutter run
```

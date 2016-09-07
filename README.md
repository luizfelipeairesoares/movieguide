# movieguide

 * Special build instructions, if any

    It is recommended to run bundle install to install the Ruby Gems.
    After, to install the iOS Dependencies please do it using the command:
    bundle exec pod install

* List of thirdparty libraries used and short description of why/how they were used

    Using bundler (http://bundler.io/) to manage RubyGems (CocoaPods, fastlane...)
    Using CocoaPods (https://cocoapods.org/) to manage iOS Dependencies

    Pods Used:

      Moya (https://github.com/Moya/Moya) - Network abstraction layer on top of AlamoFire

      Moya_ModelMapper (https://cocoapods.org/pods/Moya-ModelMapper) - Bindings for Moya.
        Easier model mapping

      PKHUD (https://cocoapods.org/pods/PKHUD) - HUD's based on the Apple's HUD.
        For user experience.

      Fabric (https://cocoapods.org/pods/Fabric) - Using Crashlytics Kit to track crashes
      Crashlytics (https://cocoapods.org/pods/Crashlytics)

      Kingfisher (https://cocoapods.org/pods/Kingfisher) - Easier image downloading

// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Ls {
  /// 
  public static let aboutExplainer01 = Ls.tr("Localizables", "about_explainer_01", fallback: "Welcome to MRKPortal!")
  /// 
  public static let aboutExplainer02 = Ls.tr("Localizables", "about_explainer_02", fallback: "The gate to the iOS Multiverse Development")
  /// 
  public static let aboutExplainer03 = Ls.tr("Localizables", "about_explainer_03", fallback: "We are a team of engineers with ten years of experience in iOS development")
  /// 
  public static let aboutExplainer04 = Ls.tr("Localizables", "about_explainer_04", fallback: "After exploring the multiverse being part of several companies, we have assembled a group of extraordinary people ready to use our knowledge and experiences to help new companies and startups build their dreams")
  /// 
  public static let aboutExplainer05 = Ls.tr("Localizables", "about_explainer_05", fallback: "Let's take a look at the portals, follow me!")
  /// 
  public static let appMoto = Ls.tr("Localizables", "app_moto", fallback: "A gate to quality")
  /// 
  public static let appName = Ls.tr("Localizables", "app_name", fallback: "MRKPortal OÜ")
  /// 
  public static let contactGitDescription = Ls.tr("Localizables", "contact_git_description", fallback: "If you would like to see a little about our code before taking any decision, you can check the very code of this App in our Github")
  /// 
  public static let contactLinkedinDescription = Ls.tr("Localizables", "contact_linkedin_description", fallback: "Get a little about more information about us and our team on LinkedIN")
  /// 
  public static let contactMailDescription = Ls.tr("Localizables", "contact_mail_description", fallback: "And that's all folks!\nIf you are interested in our experience don't hesitate to mail us")
  /// 
  public static let contactSocialDescription = Ls.tr("Localizables", "contact_social_description", fallback: "Follow us on Instagram and Threads to get the last updates on our cool projects!")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Ls {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type

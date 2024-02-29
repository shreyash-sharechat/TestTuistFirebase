import ProjectDescription
import ProjectDescriptionHelpers

let packages: [Package] = [
  .remote(url: "https://github.com/firebase/firebase-ios-sdk.git", requirement: .exact("10.6.0")),
]

let dependencies = Dependencies(
  swiftPackageManager: SwiftPackageManagerDependencies(packages),
  platforms: [.iOS]
)

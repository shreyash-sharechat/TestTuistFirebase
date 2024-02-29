import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
 +-------------+
 |             |
 |     App     | Contains TestTuistFirebase App target and TestTuistFirebase unit-test target
 |             |
 +------+-------------+-------+
 |         depends on         |
 |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let kitName = "TestTuistFirebaseKit"
let uiName = "TestTuistFirebaseUI"
// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(name: "TestTuistFirebase",
                      targets: [
                        Target(name: "TestTuistFirebase",
                               destinations: .iOS,
                               product: .app,
                               bundleId: "com.test.testtuistfirebase",
                               sources: [
                                .glob("Targets/TestTuistFirebase/Sources/**/*")
                               ],
                               dependencies: [
                                .target(name: kitName),
                                .target(name: uiName),
                                .external(name: "FirebaseAnalytics"),
                                .external(name: "FirebasePerformance"),
                                .external(name: "FirebaseCrashlytics")
                               ]),
                        Target(name: kitName,
                               destinations: .iOS,
                                product: .framework,
                                bundleId: "io.tuist.\(kitName)",
                                infoPlist: .default,
                                sources: ["Targets/\(kitName)/Sources/**"],
                                resources: [],
                                dependencies: []),
                        Target(name: uiName,
                                destinations: .iOS,
                                product: .framework,
                                bundleId: "io.tuist.\(uiName)",
                                infoPlist: .default,
                                sources: ["Targets/\(uiName)/Sources/**"],
                                resources: [],
                                dependencies: [])
                      ])

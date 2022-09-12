import Foundation

internal struct KevinNavigationBarStyleEntity : Decodable {
    let titleColor: Int?
    let tintColor: Int?
    let backgroundColorLightMode: Int?
    let backgroundColorDarkMode: Int?
    let backButtonImage: [UInt8]?
    let closeButtonImage: [UInt8]?
}

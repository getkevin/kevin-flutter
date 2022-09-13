import Foundation

internal struct KevinEmptyStateStyleEntity : Decodable {
    let titleTextColor: Int?
    let titleFont: KevinUiFontEntity?
    let subtitleTextColor: Int?
    let subtitleFont: KevinUiFontEntity?
    let cornerRadius: Double?
    let iconTintColor: Int?
}

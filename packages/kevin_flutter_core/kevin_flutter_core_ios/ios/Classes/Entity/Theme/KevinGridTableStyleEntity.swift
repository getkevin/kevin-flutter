import Foundation

internal struct KevinGridTableStyleEntity : Decodable {
    let cellBackgroundColor: Int?
    let cellCornerRadius: Double?
    let cellBorderWidth: Double?
    let cellBorderColor: Int?
    let cellSelectedBackgroundColor: Int?
    let cellSelectedBorderWidth: Double?
    let cellSelectedBorderColor: Int?
}

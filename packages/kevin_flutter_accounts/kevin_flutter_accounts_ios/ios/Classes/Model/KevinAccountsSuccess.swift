import Foundation

internal struct KevinAccountsSuccess: Codable {
    let bank: KevinBank?
    let authorizationCode: String
}

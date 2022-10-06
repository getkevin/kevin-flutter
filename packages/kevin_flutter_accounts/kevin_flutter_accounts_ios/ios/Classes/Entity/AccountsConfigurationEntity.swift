import Foundation

internal struct AccountsConfigurationEntity: Codable {
    let callbackUrl: String
    let showUnsupportedBanks: Bool
}

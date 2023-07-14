import Foundation

internal struct AccountSessionConfigurationEntity: Codable {
    let state: String
    let preselectedCountry: String?
    let disableCountrySelection: Bool
    let countryFilter: [String]
    let bankFilter: [String]
    let preselectedBank: String?
    let skipBankSelection: Bool
}

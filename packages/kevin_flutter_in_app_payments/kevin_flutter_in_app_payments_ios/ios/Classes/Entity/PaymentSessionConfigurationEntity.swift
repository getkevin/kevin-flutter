import Foundation

internal struct PaymentSessionConfigurationEntity : Codable {
    let paymentId: String
    let preselectedCountry: String?
    let disableCountrySelection: Bool
    let countryFilter: [String]
    let bankFilter: [String]
    let preselectedBank: String?
    let skipBankSelection: Bool
    let skipAuthentication: Bool
}

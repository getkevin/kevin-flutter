internal struct PaymentSessionConfigurationEntity : Codable {
    let paymentId: String
    let paymentType: String
    let preselectedCountry: String?
    let disableCountrySelection: Bool
    let countryFilter: [String]
    let bankFilter: [String]
    let preselectedBank: String?
    let skipBankSelection: Bool
    let skipAuthentication: Bool
    
    init(
        paymentId: String,
        paymentType: String,
        preselectedCountry: String?,
        disableCountrySelection: Bool,
        countryFilter: [String],
        bankFilter: [String],
        preselectedBank: String?,
        skipBankSelection: Bool,
        skipAuthentication: Bool) {
            self.paymentId = paymentId
            self.paymentType = paymentType
            self.preselectedCountry = preselectedCountry
            self.disableCountrySelection = disableCountrySelection
            self.countryFilter = countryFilter
            self.bankFilter = bankFilter
            self.preselectedBank = preselectedBank
            self.skipBankSelection = skipBankSelection
            self.skipAuthentication = skipAuthentication
        }
}

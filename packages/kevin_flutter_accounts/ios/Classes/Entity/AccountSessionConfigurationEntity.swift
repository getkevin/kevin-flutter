internal struct AccountSessionConfigurationEntity: Codable {
    let state: String
    let preselectedCountry: String?
    let disableCountrySelection: Bool
    let countryFilter: [String]
    let bankFilter: [String]
    let preselectedBank: String?
    let skipBankSelection: Bool
    let accountLinkingType: String
    
    init(
        state: String,
        preselectedCountry: String?,
        disabledCountrySelection: Bool,
        countryFilter: [String],
        bankFilter: [String],
        preselectedBank: String?,
        skipBankSelection: Bool,
        accountLinkingType: String)
    {
        self.state = state
        self.preselectedCountry = preselectedCountry
        self.disableCountrySelection = disabledCountrySelection
        self.countryFilter = countryFilter
        self.bankFilter = bankFilter
        self.preselectedBank = preselectedBank
        self.skipBankSelection = skipBankSelection
        self.accountLinkingType = accountLinkingType
    }
}

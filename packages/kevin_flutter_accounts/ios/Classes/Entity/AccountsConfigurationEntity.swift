internal struct AccountsConfigurationEntity: Codable {
    let callbackUrl: String
    let showUnsupportedBanks: Bool
    
    init(callbackUrl: String, showUnsupportedBanks: Bool) {
        self.callbackUrl = callbackUrl
        self.showUnsupportedBanks = showUnsupportedBanks
    }
}

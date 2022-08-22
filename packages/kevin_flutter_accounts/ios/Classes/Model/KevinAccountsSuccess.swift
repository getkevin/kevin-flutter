internal struct KevinAccountsSuccess: Codable {
    let bank: KevinBank?
    let authorizationCode: String
    let linkingType: String
    
    init(
        bank: KevinBank?,
        authorizationCode: String,
        linkingType: String
    ) {
        self.bank = bank
        self.authorizationCode = authorizationCode
        self.linkingType = linkingType
    }
}

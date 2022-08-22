internal struct PaymentsConfigurationEntity : Codable {
    let callbackUrl: String
    
    init(callbackUrl: String) {
        self.callbackUrl = callbackUrl
    }
}

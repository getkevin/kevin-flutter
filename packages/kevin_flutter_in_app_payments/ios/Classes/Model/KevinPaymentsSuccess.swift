internal struct KevinPaymentsSuccess : Codable {
    let paymentId: String
    
    init(paymentId: String) {
        self.paymentId = paymentId
    }
}

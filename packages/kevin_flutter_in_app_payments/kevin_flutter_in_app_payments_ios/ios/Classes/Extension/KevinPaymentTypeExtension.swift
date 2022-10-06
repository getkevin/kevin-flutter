import Foundation
import kevin_ios

internal extension KevinPaymentType {
    init?(string: String) {
        switch string.lowercased() {
        case "card":
            self = .card
        case "bank":
            self = .bank
        default:
            return nil
        }
    }
}

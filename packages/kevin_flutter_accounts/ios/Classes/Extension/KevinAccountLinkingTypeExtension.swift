import kevin_ios

internal extension KevinAccountLinkingType {
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
    
    func toString() -> String {
        switch self {
        case .bank:
            return "bank"
        case .card:
            return "card"
        }
    }
}

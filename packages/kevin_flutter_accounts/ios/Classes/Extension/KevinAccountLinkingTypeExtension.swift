import kevin_ios

internal extension KevinAccountLinkingType {
    func toString() -> String {
        switch self {
        case .bank:
            return "bank"
        case .card:
            return "bank"
        }
    }
}

internal func toKevinAccountLinkingType(string: String) -> KevinAccountLinkingType? {
    switch string.lowercased() {
    case "card":
        return KevinAccountLinkingType.card
    case "bank":
        return KevinAccountLinkingType.bank
    default:
        return nil
    }
}

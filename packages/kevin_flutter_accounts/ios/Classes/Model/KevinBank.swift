import Foundation
import kevin_ios

internal struct KevinBank: Codable {
    let id: String
    let name: String
    let officialName: String?
    let imageUri: String
    let bic: String?
}

internal extension ApiBank {
    func toKevinBank() -> KevinBank {
        return KevinBank(
            id: self.id,
            name: self.name,
            officialName: self.officialName,
            imageUri: self.imageUri,
            bic: self.bic)
    }
}

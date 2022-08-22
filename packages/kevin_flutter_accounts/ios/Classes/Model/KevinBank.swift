import kevin_ios

internal struct KevinBank: Codable {
    let id: String
    let name: String
    let officialName: String?
    let imageUri: String
    let bic: String?
    
    init(
        id: String,
        name: String,
        officialName: String? = nil,
        imageUri: String,
        bic: String? = nil
    ) {
        self.id = id
        self.name = name
        self.officialName = officialName
        self.imageUri = imageUri
        self.bic = bic
    }
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

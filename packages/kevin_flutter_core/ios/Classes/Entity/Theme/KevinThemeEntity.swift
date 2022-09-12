import Foundation

internal struct KevinThemeEntity : Decodable {
    let insets: KevinInsetsEntity?
    let generalStyle: KevinGeneralStyleEntity?
    let navigationBarStyle: KevinNavigationBarStyleEntity?
    let sheetPresentationStyle: KevinSheetPresentationStyleEntity?
    let sectionStyle: KevinSectionStyleEntity?
    let gridTableStyle: KevinGridTableStyleEntity?
    let listTableStyle: KevinListTableStyleEntity?
    let navigationLinkStyle: KevinNavigationLinkStyleEntity?
    let mainButtonStyle: KevinButtonStyleEntity?
    let negativeButtonStyle: KevinButtonStyleEntity?
    let textFieldStyle: KevinTextFieldStyleEntity?
    let emptyStateStyle: KevinEmptyStateStyleEntity?
}

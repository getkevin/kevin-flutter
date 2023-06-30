import Foundation
import kevin_ios
import UIKit

internal extension KevinThemeEntity {
    func toKevinTheme() -> KevinTheme {
        let theme = KevinTheme()
        
        if let insets = self.insets {
            theme.insets = getInsets(data: insets)
        }
        
        if let generalStyle = self.generalStyle {
            theme.generalStyle = getGeneralStyle(data: generalStyle)
        }
        
        if let navigationBarStyle = self.navigationBarStyle {
            theme.navigationBarStyle = getNavigationBarStyle(data: navigationBarStyle)
        }
        
        if let sheetPresentationStyle = self.sheetPresentationStyle {
            theme.sheetPresentationStyle = getSheetPresentationStyle(data: sheetPresentationStyle)
        }
        
        if let sectionStyle = self.sectionStyle {
            theme.sectionStyle = getSectionStyle(data: sectionStyle)
        }
        
        if let gridTableStyle = self.gridTableStyle {
            theme.gridTableStyle = getGridTableStyle(data: gridTableStyle)
        }
        
        if let listTableStyle = self.listTableStyle {
            theme.listTableStyle = getListTableStyle(data: listTableStyle)
        }
        
        if let navigationLinkStyle = self.navigationLinkStyle {
            theme.navigationLinkStyle = getNavigationLinkStyle(data: navigationLinkStyle)
        }
        
        if let mainButtonStyle = self.mainButtonStyle {
            theme.mainButtonStyle = getMainButtonStyle(data: mainButtonStyle)
        }
        
        if let negativeButtonStyle = self.negativeButtonStyle {
            theme.negativeButtonStyle = getNegativeButtonStyle(data: negativeButtonStyle)
        }
        
        if let textFieldStyle = self.textFieldStyle {
            theme.textFieldStyle = getTextFieldStyle(data: textFieldStyle)
        }
        
        if let emptyStateStyle = self.emptyStateStyle {
            theme.emptyStateStyle = getEmptyStateStyle(data: emptyStateStyle)
        }
        
        return theme
    }
}

private func getInsets(data: KevinInsetsEntity) -> KevinTheme.Insets {
    var insets = KevinTheme.Insets()
    
    if let left = data.left {
        insets.left = left
    }
    
    if let top = data.top {
        insets.top = top
    }
    
    if let right = data.right {
        insets.right = right
    }
    
    if let bottom = data.bottom {
        insets.bottom = bottom
    }
    
    return insets
}

private func getGeneralStyle(data: KevinGeneralStyleEntity) -> KevinTheme.GeneralStyle {
    var generalStyle = KevinTheme.GeneralStyle()
    
    if let primaryBackgroundColor = data.primaryBackgroundColor {
        generalStyle.primaryBackgroundColor = primaryBackgroundColor.toUIColor()
    }
    
    if let primaryTextColor = data.primaryTextColor {
        generalStyle.primaryTextColor = primaryTextColor.toUIColor()
    }
    
    if let secondaryTextColor = data.secondaryTextColor {
        generalStyle.secondaryTextColor = secondaryTextColor.toUIColor()
    }
    
    if let actionTextColor = data.actionTextColor {
        generalStyle.actionTextColor = actionTextColor.toUIColor()
    }
    
    if let primaryFont = data.primaryFont?.toUIFont() {
        generalStyle.primaryFont = primaryFont
    }
    
    if let secondaryFont = data.secondaryFont?.toUIFont() {
        generalStyle.secondaryFont = secondaryFont
    }
    
    return generalStyle
}

private func getNavigationBarStyle(data: KevinNavigationBarStyleEntity) -> KevinTheme.NavigationBarStyle {
    var navigationBarStyle = KevinTheme.NavigationBarStyle()
    
    if let titleColor = data.titleColor {
        navigationBarStyle.titleColor = titleColor.toUIColor()
    }
    
    if let tintColor = data.tintColor {
        navigationBarStyle.tintColor = tintColor.toUIColor()
    }
    
    if let backgroundColorLightMode = data.backgroundColorLightMode {
        navigationBarStyle.backgroundColorLightMode = backgroundColorLightMode.toUIColor()
    }
    
    if let backgroundColorDarkMode = data.backgroundColorDarkMode {
        navigationBarStyle.backgroundColorDarkMode = backgroundColorDarkMode.toUIColor()
    }
    
    if let backButtonImage = data.backButtonImage?.toUIImage() {
        navigationBarStyle.backButtonImage = backButtonImage
    }
    
    if let closeButtonImage = data.closeButtonImage?.toUIImage() {
        navigationBarStyle.closeButtonImage = closeButtonImage
    }
    
    return navigationBarStyle
}

private func getSheetPresentationStyle(data: KevinSheetPresentationStyleEntity) -> KevinTheme.SheetPresentationStyle {
    var sheetPresentationStyle = KevinTheme.SheetPresentationStyle()
    
    if let dragIndicatorTintColor = data.dragIndicatorTintColor {
        sheetPresentationStyle.dragIndicatorTintColor = dragIndicatorTintColor.toUIColor()
    }
    
    if let backgroundColor = data.backgroundColor {
        sheetPresentationStyle.backgroundColor = backgroundColor.toUIColor()
    }
    
    if let titleLabelFont = data.titleLabelFont?.toUIFont() {
        sheetPresentationStyle.titleLabelFont = titleLabelFont
    }
    
    if let cornerRadius = data.cornerRadius {
        sheetPresentationStyle.cornerRadius = cornerRadius
    }
    
    return sheetPresentationStyle
}

private func getSectionStyle(data: KevinSectionStyleEntity) -> KevinTheme.SectionStyle {
    var sectionStyle = KevinTheme.SectionStyle()
    
    if let titleLabelFont = data.titleLabelFont.toUIFont() {
        sectionStyle.titleLabelFont = titleLabelFont
    }
    
    return sectionStyle
}

private func getGridTableStyle(data: KevinGridTableStyleEntity) -> KevinTheme.GridTableStyle {
    var gridTableStyle = KevinTheme.GridTableStyle()
    
    if let cellBackgroundColor = data.cellBackgroundColor {
        gridTableStyle.cellBackgroundColor = cellBackgroundColor.toUIColor()
    }
    
    if let cellCornerRadius = data.cellCornerRadius {
        gridTableStyle.cellCornerRadius = cellCornerRadius
    }
    
    if let cellBorderWidth = data.cellBorderWidth {
        gridTableStyle.cellBorderWidth = cellBorderWidth
    }
    
    if let cellBorderColor = data.cellBorderColor {
        gridTableStyle.cellBorderColor = cellBorderColor.toUIColor()
    }
    
    if let cellSelectedBackgroundColor = data.cellSelectedBackgroundColor {
        gridTableStyle.cellSelectedBackgroundColor = cellSelectedBackgroundColor.toUIColor()
    }
    
    if let cellSelectedBorderWidth = data.cellSelectedBorderWidth {
        gridTableStyle.cellSelectedBorderWidth = cellSelectedBorderWidth
    }
    
    if let cellSelectedBorderColor = data.cellSelectedBorderColor {
        gridTableStyle.cellSelectedBorderColor = cellSelectedBorderColor.toUIColor()
    }
    
    return gridTableStyle
}

private func getListTableStyle(data: KevinListTableStyleEntity) -> KevinTheme.ListTableStyle {
    var listTableStyle = KevinTheme.ListTableStyle()
    
    if let cornerRadius = data.cornerRadius {
        listTableStyle.cornerRadius = cornerRadius
    }
    
    if let isOccupyingFullWidth = data.isOccupyingFullWidth {
        listTableStyle.isOccupyingFullWidth = isOccupyingFullWidth
    }
    
    if let cellBackgroundColor = data.cellBackgroundColor {
        listTableStyle.cellBackgroundColor = cellBackgroundColor.toUIColor()
    }
    
    if let cellSelectedBackgroundColor = data.cellSelectedBackgroundColor {
        listTableStyle.cellSelectedBackgroundColor = cellSelectedBackgroundColor.toUIColor()
    }
    
    if let titleLabelFont = data.titleLabelFont?.toUIFont() {
        listTableStyle.titleLabelFont = titleLabelFont
    }
    
    if let chevronImage = data.chevronImage?.toUIImage() {
        listTableStyle.chevronImage = chevronImage
    }
    
    return listTableStyle
}

private func getNavigationLinkStyle(data: KevinNavigationLinkStyleEntity) -> KevinTheme.NavigationLinkStyle {
    var navigationLinkStyle = KevinTheme.NavigationLinkStyle()
    
    if let backgroundColor = data.backgroundColor {
        navigationLinkStyle.backgroundColor = backgroundColor.toUIColor()
    }
    
    if let titleLabelFont = data.titleLabelFont?.toUIFont() {
        navigationLinkStyle.titleLabelFont = titleLabelFont
    }
    
    if let selectedBackgroundColor = data.selectedBackgroundColor {
        navigationLinkStyle.selectedBackgroundColor = selectedBackgroundColor.toUIColor()
    }
    
    if let cornerRadius = data.cornerRadius {
        navigationLinkStyle.cornerRadius = cornerRadius
    }
    
    if let borderWidth = data.borderWidth {
        navigationLinkStyle.borderWidth = borderWidth
    }
    
    if let borderColor = data.borderColor {
        navigationLinkStyle.borderColor = borderColor.toUIColor()
    }
    
    if let chevronImage = data.chevronImage?.toUIImage() {
        navigationLinkStyle.chevronImage = chevronImage
    }
    
    return navigationLinkStyle
}

private func getMainButtonStyle(data: KevinButtonStyleEntity) -> KevinTheme.MainButtonStyle {
    var mainButtonStyle = KevinTheme.MainButtonStyle()
    
    if let width = data.width {
        mainButtonStyle.width = width
    }
    
    if let height = data.height {
        mainButtonStyle.height = height
    }
    
    if let backgroundColor = data.backgroundColor {
        mainButtonStyle.backgroundColor = backgroundColor.toUIColor()
    }
    
    if let titleLabelTextColor = data.titleLabelTextColor {
        mainButtonStyle.titleLabelTextColor = titleLabelTextColor.toUIColor()
    }
    
    if let titleLabelFont = data.titleLabelFont?.toUIFont() {
        mainButtonStyle.titleLabelFont = titleLabelFont
    }
    
    if let cornerRadius = data.cornerRadius {
        mainButtonStyle.cornerRadius = cornerRadius
    }
    
    if let shadowRadius = data.shadowRadius {
        mainButtonStyle.shadowRadius = shadowRadius
    }
    
    if let shadowOpacity = data.shadowOpacity {
        mainButtonStyle.shadowOpacity = Float(shadowOpacity)
    }
    
    if let shadowOffset = data.shadowOffset {
        mainButtonStyle.shadowOffset = shadowOffset.toCGSize()
    }
    
    if let shadowColor = data.shadowColor {
        mainButtonStyle.shadowColor = shadowColor.toUIColor()
    }
    
    return mainButtonStyle
}

private func getNegativeButtonStyle(data: KevinButtonStyleEntity) -> KevinTheme.NegativeButtonStyle {
    var negativeButtonStyle = KevinTheme.NegativeButtonStyle()
    
    if let width = data.width {
        negativeButtonStyle.width = width
    }
    
    if let height = data.height {
        negativeButtonStyle.height = height
    }
    
    if let backgroundColor = data.backgroundColor {
        negativeButtonStyle.backgroundColor = backgroundColor.toUIColor()
    }
    
    if let titleLabelTextColor = data.titleLabelTextColor {
        negativeButtonStyle.titleLabelTextColor = titleLabelTextColor.toUIColor()
    }
    
    if let titleLabelFont = data.titleLabelFont?.toUIFont() {
        negativeButtonStyle.titleLabelFont = titleLabelFont
    }
    
    if let cornerRadius = data.cornerRadius {
        negativeButtonStyle.cornerRadius = cornerRadius
    }
    
    if let shadowRadius = data.shadowRadius {
        negativeButtonStyle.shadowRadius = shadowRadius
    }
    
    if let shadowOpacity = data.shadowOpacity {
        negativeButtonStyle.shadowOpacity = Float(shadowOpacity)
    }
    
    if let shadowOffset = data.shadowOffset {
        negativeButtonStyle.shadowOffset = shadowOffset.toCGSize()
    }
    
    if let shadowColor = data.shadowColor {
        negativeButtonStyle.shadowColor = shadowColor.toUIColor()
    }
    
    return negativeButtonStyle
}

private func getTextFieldStyle(data: KevinTextFieldStyleEntity) -> KevinTheme.TextFieldStyle {
    var textFieldStyle = KevinTheme.TextFieldStyle()
    
    if let textColor = data.textColor {
        textFieldStyle.textColor = textColor.toUIColor()
    }
    
    if let font = data.font?.toUIFont() {
        textFieldStyle.font = font
    }
    
    if let cornerRadius = data.cornerRadius {
        textFieldStyle.cornerRadius = cornerRadius
    }
    
    if let backgroundColor = data.backgroundColor {
        textFieldStyle.backgroundColor = backgroundColor.toUIColor()
    }
    
    if let borderWidth = data.borderWidth {
        textFieldStyle.borderWidth = borderWidth
    }
    
    if let errorBorderColor = data.errorBorderColor {
        textFieldStyle.errorBorderColor = errorBorderColor.toUIColor()
    }
    
    if let errorMessageFont = data.errorMessageFont?.toUIFont() {
        textFieldStyle.errorMessageFont = errorMessageFont
    }
    
    return textFieldStyle
}

private func getEmptyStateStyle(data: KevinEmptyStateStyleEntity) -> KevinTheme.EmptyStateStyle {
    var emptyStateStyle = KevinTheme.EmptyStateStyle()
    
    if let titleTextColor = data.titleTextColor {
        emptyStateStyle.titleTextColor = titleTextColor.toUIColor()
    }
    
    if let titleFont = data.titleFont?.toUIFont() {
        emptyStateStyle.titleFont = titleFont
    }
    
    if let subtitleTextColor = data.subtitleTextColor {
        emptyStateStyle.subtitleTextColor = subtitleTextColor.toUIColor()
    }
    
    if let subtitleFont = data.subtitleFont?.toUIFont() {
        emptyStateStyle.subtitleFont = subtitleFont
    }
    
    if let cornerRadius = data.cornerRadius {
        emptyStateStyle.cornerRadius = cornerRadius
    }
    
    if let iconTintColor = data.iconTintColor {
        emptyStateStyle.iconTintColor = iconTintColor.toUIColor()
    }
    
    return emptyStateStyle
}

private extension Int {
    func toUIColor() -> UIColor {
        let alpha = (0xFF000000 & self) >> 24
        let opacity = alpha / 0xFF
        
        let red = (0x00FF0000 & self) >> 16
        let green = (0x0000FF00 & self) >> 8
        let blue = (0x000000FF & self) >> 0
        
        return UIColor(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: CGFloat(opacity)
        )
    }
}

private extension KevinUiFontEntity {
    func toUIFont() -> UIFont? {
        guard let weight = UIFont.Weight(string: self.weight) else {
            return nil
        }
        
        return UIFont.systemFont(
            ofSize: self.size,
            weight: weight
        )
    }
}

private extension Array where Element == UInt8 {
    func toUIImage() -> UIImage? {
        let data = self.withUnsafeBufferPointer {Data(buffer: $0)}
        return UIImage(data: data)
    }
}

private extension KevinSizeEntity {
    func toCGSize() -> CGSize {
        return CGSize(width: self.width, height: self.height)
    }
}

private extension UIFont.Weight {
    init?(string: String) {
        switch string {
        case "ultraLight":
            self = .ultraLight
        case "thin":
            self = .thin
        case "regular":
            self = .regular
        case "medium":
            self = .medium
        case "semibold":
            self = .semibold
        case "bold":
            self = .bold
        case "heavy":
            self = .heavy
        case "black":
            self = .black
        default:
            return nil
        }
    }
}

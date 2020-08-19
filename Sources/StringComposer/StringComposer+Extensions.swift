//
//  StringComposer+Extensions.swift
//  
//
//  Created by Arthur da Paz on 18/08/20.
//

import UIKit

internal extension Sequence where Element: NSAttributedString {

    func join<AttributedType: NSAttributedString>(withSeparator separator: String? = nil) -> AttributedType {
        let finalString = NSMutableAttributedString()
        for (index, string) in enumerated() {
            if index > 0 && separator != nil {
                let separatorAttributed = NSAttributedString(string: separator!)
                finalString.append(separatorAttributed)
            }
            finalString.append(string)
        }
        return finalString as! AttributedType
    }
}

internal extension UIFont {

    var bolded: UIFont {
        guard let desc = fontDescriptor.withSymbolicTraits(.traitBold) else { return self }
        return UIFont(descriptor: desc, size: pointSize)
    }

    var italicized: UIFont {
        guard let desc = fontDescriptor.withSymbolicTraits(.traitItalic) else { return self }
        return UIFont(descriptor: desc, size: pointSize)
    }

    func scaled(scaleFactor: CGFloat) -> UIFont {
        let newDescriptor = fontDescriptor.withSize(fontDescriptor.pointSize * scaleFactor)
        return UIFont(descriptor: newDescriptor, size: self.pointSize)
    }

    func with(weight: Weight) -> UIFont {
        let weightedFontDescriptor = fontDescriptor.addingAttributes([
            UIFontDescriptor.AttributeName.traits: [
                UIFontDescriptor.TraitKey.weight: weight
            ]
        ])
        return UIFont(descriptor: weightedFontDescriptor, size: fontDescriptor.pointSize)
    }

}

//
//  StringComposerBase.swift
//  
//
//  Created by Arthur da Paz on 18/08/20.
//

import UIKit

public protocol BaseComposer {
    var composed: NSMutableAttributedString { get }

    init(_ font: UIFont?, @StringComposer builder: () -> NSAttributedString)

    static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString
    static func buildExpression(_ string: String) -> NSAttributedString
    static func buildExpression(_ strings: String...) -> NSAttributedString
    static func buildExpression(_ attributedString: NSAttributedString) -> NSAttributedString
    static func buildExpression(_ image: UIImage) -> NSAttributedString

    func compose(with attributes: StringAttribute...) -> NSAttributedString
}

public extension BaseComposer {
    static func buildBlock(_ components: NSAttributedString...) -> NSAttributedString {
        components.join()
    }

    static func buildExpression(_ string: String) -> NSAttributedString {
        NSAttributedString(string: string, attributes: [:])
    }

    static func buildExpression(_ strings: String...) -> NSAttributedString {
        let result = NSMutableAttributedString(string: "")

        for string in strings {
            result.append(NSAttributedString(string: string, attributes: [:]))
        }

        return result
    }

    static func buildExpression(_ attributedString: NSAttributedString) -> NSAttributedString {
        attributedString
    }

    static func buildExpression(_ image: UIImage) -> NSAttributedString {
        let attachment = NSTextAttachment()
        attachment.image = image
        return NSAttributedString(attachment: attachment)
    }

    // handle a single paragraph :)
    init(@StringComposer builder: () -> String) {
        self.init(nil) { () -> NSAttributedString in
            NSAttributedString(string: builder())
        }
    }

    // modifiers
    func compose(with attributes: StringAttribute...) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self.composed)
        for attribute in attributes {
            copy.addAttribute(attribute.keyName, value: attribute.value, range: NSRange(location: 0, length: self.composed.string.count))
        }
        return copy
    }

    
}

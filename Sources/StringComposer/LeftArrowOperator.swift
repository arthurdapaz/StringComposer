//
//  StringComposerOperator.swift
//  comparecompre
//
//  Created by Arthur da Paz on 29/07/20.
//  Copyright © 2020 Arthur da Paz. All rights reserved.
//

import UIKit

// Left arrow operator
precedencegroup HeightPrecedence {
    lowerThan: AdditionPrecedence
    associativity: left
}

infix operator § : HeightPrecedence

@discardableResult
public func § (left: String, right: StringAttribute) -> NSAttributedString {
    NSAttributedString(string: left, attributes: [right.keyName: right.value])
}

@discardableResult
public func § (left: NSAttributedString, right: StringAttribute) -> NSAttributedString {
    let copy = left.mutableCopy() as! NSMutableAttributedString
    
    let range = NSRange(location: 0, length: left.string.count)
    copy.addAttribute(right.keyName, value: right.value, range: range)
    return copy
}

@discardableResult
public func § (left: NSAttributedString, right: String) -> NSAttributedString {
    [left, NSAttributedString(string: right)].join()
}

@discardableResult
public func § (left: String, right: NSAttributedString) -> NSAttributedString {
    [NSAttributedString(string: left), right].join()
}

@discardableResult
public func § (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
    [left, right].join()
}

@discardableResult
public func § (left: String, right: ExtraAttribute) -> String {
    left + right.value
}

@discardableResult
public func § (left: NSAttributedString, right: ExtraAttribute) -> NSAttributedString {
    [left, NSAttributedString(string: right.value)].join()
}

@discardableResult
public func § (left: UIImage, right: ImageAttribute) -> NSAttributedString {
    
    let ratio = left.size.width / left.size.height
    let attachment = NSTextAttachment()
    attachment.bounds = CGRect(x: attachment.bounds.origin.x, y: attachment.bounds.origin.y, width: ratio * right.value, height: right.value)
    attachment.image = left
    
    return NSAttributedString(attachment: attachment)
}

@discardableResult
public func § (left: String, right: FontAttribute) -> NSAttributedString {
    NSAttributedString(string: left, attributes: [.font: right.value])
}

@discardableResult
public func § (left: NSAttributedString, right: FontAttribute) -> NSAttributedString {
    let copy = left.mutableCopy() as! NSMutableAttributedString
    #warning("verificar se attributo já existe ?")
    let range = NSRange(location: 0, length: left.string.count)
    copy.addAttribute(.font, value: right.value, range: range)
    
    return copy
}

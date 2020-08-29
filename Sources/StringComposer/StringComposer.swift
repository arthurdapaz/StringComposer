//
//  StringComposer.swift
//  comparecompre
//
//  Created by Arthur da Paz on 26/07/20.
//  Copyright © 2020 Arthur da Paz. All rights reserved.
//

import UIKit

@_functionBuilder
public struct StringComposer: BaseComposer {

    public static var font: UIFont = .preferredFont(forTextStyle: .body)

    public var composed: NSMutableAttributedString

    public init(@StringComposer builder: () -> NSAttributedString) {
        self.composed = builder().mutableCopy() as! NSMutableAttributedString
    }

    // handle a single paragraph :)
    public init(@StringComposer builder: () -> Paragraph) {
        self.composed = builder().composed
    }


    public static func buildExpression(_ paragraph: Paragraph) -> NSAttributedString {
        if !paragraph.isLastParagraph {
            let breakline = NSAttributedString(string: "\n")
            paragraph.composed.append(breakline)
        }
        return paragraph.composed
    }

}


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

    public init(_ font: UIFont? = nil, @StringComposer builder: () -> NSAttributedString) {
        if let font = font {
            Self.font = font
        }

        self.composed = builder().mutableCopy() as! NSMutableAttributedString
    }

    // handle a single paragraph :)
    public init(@StringComposer builder: () -> Paragraph) {
        self.composed = builder().composed
    }

    public static func buildExpression(_ paragraphs: [Paragraph]) -> NSAttributedString {
        let breakline = NSAttributedString(string: "\n")
        let result = NSMutableAttributedString(string: "")

        for (index, p) in paragraphs.enumerated() {

            let attributedParagraph = NSMutableAttributedString(attributedString: p.composed)
            let range = NSRange(location: 0, length: p.composed.string.count)
            attributedParagraph.addAttribute(.paragraphStyle, value: p.paragraph, range: range)

            result.append(attributedParagraph)

            // last element
            if index != paragraphs.endIndex-1 {
                result.append(breakline)
            }
        }

        return result
    }

    public static func buildExpression(_ paragraph: Paragraph) -> NSAttributedString {
        return paragraph.composed
    }

}


//
//  Paragraph.swift
//  
//
//  Created by Arthur da Paz on 18/08/20.
//

import UIKit

@_functionBuilder
public struct Paragraph: BaseComposer {

    public var style: NSMutableParagraphStyle = Paragraph.getParagraph()

    private var _composed: NSMutableAttributedString
    public var composed: NSMutableAttributedString {
        get {
            let range = NSRange(location: 0, length: _composed.string.count)
            _composed.addAttribute(.paragraphStyle, value: style, range: range)
            return _composed
        }
    }

    public init(_ font: UIFont? = nil, @StringComposer builder: () -> NSAttributedString) {
        if let font = font {
            StringComposer.font = font
        }
        _composed = builder().mutableCopy() as! NSMutableAttributedString
    }

    public var isLastParagraph: Bool = false
    public func last() -> Paragraph {
        var copy = self
        copy.isLastParagraph = true
        return copy
    }

    // MARK: - Default Paragraph
    static func getParagraph(alignment: NSTextAlignment = NSParagraphStyle.default.alignment,
                             firstLineHeadIndent: CGFloat = NSParagraphStyle.default.firstLineHeadIndent,
                             headIndent: CGFloat = NSParagraphStyle.default.headIndent,
                             tailIndent: CGFloat = NSParagraphStyle.default.tailIndent,
                             lineBreakMode: NSLineBreakMode = NSParagraphStyle.default.lineBreakMode,
                             maximumLineHeight: CGFloat = NSParagraphStyle.default.maximumLineHeight,
                             minimumLineHeight: CGFloat = NSParagraphStyle.default.minimumLineHeight,
                             lineSpacing: CGFloat = NSParagraphStyle.default.lineSpacing,
                             lineHeightMultiple: CGFloat = NSParagraphStyle.default.lineHeightMultiple,
                             paragraphSpacing: CGFloat = NSParagraphStyle.default.paragraphSpacing,
                             paragraphSpacingBefore: CGFloat = NSParagraphStyle.default.paragraphSpacingBefore,
                             hyphenationFactor: Float = NSParagraphStyle.default.hyphenationFactor,
                             writingDirection: NSWritingDirection = NSParagraphStyle.default.baseWritingDirection,
                             tabStops: [NSTextTab] = NSParagraphStyle.default.tabStops,
                             defaultTabInterval: CGFloat = NSParagraphStyle.default.defaultTabInterval) -> NSMutableParagraphStyle {

        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = alignment
        paragraph.firstLineHeadIndent = firstLineHeadIndent
        paragraph.headIndent = headIndent
        paragraph.tailIndent = tailIndent
        paragraph.lineBreakMode = lineBreakMode
        paragraph.lineSpacing = lineSpacing
        paragraph.maximumLineHeight = maximumLineHeight
        paragraph.minimumLineHeight = minimumLineHeight
        paragraph.lineHeightMultiple = lineHeightMultiple
        paragraph.paragraphSpacing = paragraphSpacing
        paragraph.paragraphSpacingBefore = paragraphSpacingBefore
        paragraph.hyphenationFactor = hyphenationFactor
        paragraph.baseWritingDirection = writingDirection
        paragraph.tabStops = tabStops
        paragraph.defaultTabInterval = defaultTabInterval
        return paragraph
    }

    // MARK: - Paragraph Properties
    public func alignment(_ ₁: NSTextAlignment) -> Paragraph {
        style.alignment = ₁
        return self
    }

    public func firstLineHeadIndent(_ ₁: CGFloat) -> Paragraph {
        style.firstLineHeadIndent = ₁
        return self
    }

    public func headIndent(_ ₁: CGFloat) -> Paragraph {
        style.headIndent = ₁
        return self
    }

    public func tailIndent(_ ₁: CGFloat) -> Paragraph {
        style.tailIndent = ₁
        return self
    }

    public func lineBreakMode(_ ₁: NSLineBreakMode) -> Paragraph {
        style.lineBreakMode = ₁
        return self
    }

    public func maximumLineHeight(_ ₁: CGFloat) -> Paragraph {
        style.maximumLineHeight = ₁
        return self
    }

    public func minimumLineHeight(_ ₁: CGFloat) -> Paragraph {
        style.minimumLineHeight = ₁
        return self
    }

    public func lineSpacing(_ ₁: CGFloat) -> Paragraph {
        style.lineSpacing = ₁
        return self
    }

    public func lineHeightMultiple(_ ₁: CGFloat) -> Paragraph {
        style.lineHeightMultiple = ₁
        return self
    }

    public func paragraphSpacing(_ ₁: CGFloat) -> Paragraph {
        style.paragraphSpacing = ₁
        return self
    }

    public func paragraphSpacingBefore(_ ₁: CGFloat) -> Paragraph {
        style.paragraphSpacingBefore = ₁
        return self
    }

    public func hyphenationFactor(_ ₁: Float) -> Paragraph {
        style.hyphenationFactor = ₁
        return self
    }

    public func writingDirection(_ ₁: NSWritingDirection) -> Paragraph {
        style.baseWritingDirection = ₁
        return self
    }

    public func tabStops(_ ₁: [NSTextTab]) -> Paragraph {
        style.tabStops = ₁
        return self
    }

    public func defaultTabInterval(_ ₁: CGFloat) -> Paragraph {
        style.defaultTabInterval = ₁
        return self
    }

}

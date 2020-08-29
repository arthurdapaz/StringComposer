//
//  Paragraph.swift
//  
//
//  Created by Arthur da Paz on 18/08/20.
//

import UIKit

@_functionBuilder
public struct Paragraph: BaseComposer {

    public var style: NSMutableParagraphStyle = NSMutableParagraphStyle()

    private var _composed: NSMutableAttributedString
    public var composed: NSMutableAttributedString {
        get {
            let range = NSRange(location: 0, length: _composed.string.count)
            _composed.addAttribute(.paragraphStyle, value: style, range: range)
            return _composed
        }
    }

    public init(@StringComposer builder: () -> NSAttributedString) {
        _composed = builder().mutableCopy() as! NSMutableAttributedString
    }

    public var isLastParagraph: Bool = false
    public func last() -> Paragraph {
        var copy = self
        copy.isLastParagraph = true
        return copy
    }

//    // MARK: - Default Paragraph
//    static func defaultParagraph(alignment: NSTextAlignment = NSParagraphStyle.default.alignment,
//                             firstLineHeadIndent: CGFloat = NSParagraphStyle.default.firstLineHeadIndent,
//                             headIndent: CGFloat = NSParagraphStyle.default.headIndent,
//                             tailIndent: CGFloat = NSParagraphStyle.default.tailIndent,
//                             lineBreakMode: NSLineBreakMode = NSParagraphStyle.default.lineBreakMode,
//                             maximumLineHeight: CGFloat = NSParagraphStyle.default.maximumLineHeight,
//                             minimumLineHeight: CGFloat = NSParagraphStyle.default.minimumLineHeight,
//                             lineSpacing: CGFloat = NSParagraphStyle.default.lineSpacing,
//                             lineHeightMultiple: CGFloat = NSParagraphStyle.default.lineHeightMultiple,
//                             paragraphSpacing: CGFloat = NSParagraphStyle.default.paragraphSpacing,
//                             paragraphSpacingBefore: CGFloat = NSParagraphStyle.default.paragraphSpacingBefore,
//                             hyphenationFactor: Float = NSParagraphStyle.default.hyphenationFactor,
//                             writingDirection: NSWritingDirection = NSParagraphStyle.default.baseWritingDirection,
//                             tabStops: [NSTextTab] = NSParagraphStyle.default.tabStops,
//                             defaultTabInterval: CGFloat = NSParagraphStyle.default.defaultTabInterval) -> NSMutableParagraphStyle {
//
//        let paragraph = NSMutableParagraphStyle()
//        paragraph.alignment = alignment
//        paragraph.firstLineHeadIndent = firstLineHeadIndent
//        paragraph.headIndent = headIndent
//        paragraph.tailIndent = tailIndent
//        paragraph.lineBreakMode = lineBreakMode
//        paragraph.lineSpacing = lineSpacing
//        paragraph.maximumLineHeight = maximumLineHeight
//        paragraph.minimumLineHeight = minimumLineHeight
//        paragraph.lineHeightMultiple = lineHeightMultiple
//        paragraph.paragraphSpacing = paragraphSpacing
//        paragraph.paragraphSpacingBefore = paragraphSpacingBefore
//        paragraph.hyphenationFactor = hyphenationFactor
//        paragraph.baseWritingDirection = writingDirection
//        paragraph.tabStops = tabStops
//        paragraph.defaultTabInterval = defaultTabInterval
//        return paragraph
//    }

    // MARK: - Paragraph Properties
    public func alignment(_ ⁱ: NSTextAlignment) -> Paragraph {
        style.alignment = ⁱ
        return self
    }

    public func firstLineHeadIndent(_ ⁱ: CGFloat) -> Paragraph {
        style.firstLineHeadIndent = ⁱ
        return self
    }

    public func headIndent(_ ⁱ: CGFloat) -> Paragraph {
        style.headIndent = ⁱ
        return self
    }

    public func tailIndent(_ ⁱ: CGFloat) -> Paragraph {
        style.tailIndent = ⁱ
        return self
    }

    public func lineBreakMode(_ ⁱ: NSLineBreakMode) -> Paragraph {
        style.lineBreakMode = ⁱ
        return self
    }

    public func maximumLineHeight(_ ⁱ: CGFloat) -> Paragraph {
        style.maximumLineHeight = ⁱ
        return self
    }

    public func minimumLineHeight(_ ⁱ: CGFloat) -> Paragraph {
        style.minimumLineHeight = ⁱ
        return self
    }

    public func lineSpacing(_ ⁱ: CGFloat) -> Paragraph {
        style.lineSpacing = ⁱ
        return self
    }

    public func lineHeightMultiple(_ ⁱ: CGFloat) -> Paragraph {
        style.lineHeightMultiple = ⁱ
        return self
    }

    public func paragraphSpacing(_ ⁱ: CGFloat) -> Paragraph {
        style.paragraphSpacing = ⁱ
        return self
    }

    public func paragraphSpacingBefore(_ ⁱ: CGFloat) -> Paragraph {
        style.paragraphSpacingBefore = ⁱ
        return self
    }

    public func hyphenationFactor(_ ⁱ: Float) -> Paragraph {
        style.hyphenationFactor = ⁱ
        return self
    }

    public func writingDirection(_ ⁱ: NSWritingDirection) -> Paragraph {
        style.baseWritingDirection = ⁱ
        return self
    }

    public func tabStops(_ ⁱ: [NSTextTab]) -> Paragraph {
        style.tabStops = ⁱ
        return self
    }

    public func defaultTabInterval(_ ⁱ: CGFloat) -> Paragraph {
        style.defaultTabInterval = ⁱ
        return self
    }

}

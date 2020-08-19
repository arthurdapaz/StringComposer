//
//  Paragraph.swift
//  
//
//  Created by Arthur da Paz on 18/08/20.
//

import UIKit

@_functionBuilder
public struct Paragraph: BaseComposer {

    public var composed: NSMutableAttributedString

    public var paragraph: NSMutableParagraphStyle = Paragraph.getParagraph()

    public init(_ font: UIFont? = nil, @StringComposer builder: () -> NSAttributedString) {
        if let font = font {
            StringComposer.font = font
        }
        composed = builder().mutableCopy() as! NSMutableAttributedString
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
    public func alignment(_ alignment: NSTextAlignment = NSParagraphStyle.default.alignment) -> Paragraph {
        paragraph.alignment = alignment
        return self
    }

    public func firstLineHeadIndent(_ firstLineHeadIndent: CGFloat = NSParagraphStyle.default.firstLineHeadIndent) -> Paragraph {
        paragraph.firstLineHeadIndent = firstLineHeadIndent
        return self
    }

    public func headIndent(_ headIndent: CGFloat = NSParagraphStyle.default.headIndent) -> Paragraph {
        paragraph.headIndent = headIndent
        return self
    }

    public func tailIndent(_ tailIndent: CGFloat = NSParagraphStyle.default.tailIndent) -> Paragraph {
        paragraph.tailIndent = tailIndent
        return self
    }

    public func lineBreakMode(_ lineBreakMode: NSLineBreakMode = NSParagraphStyle.default.lineBreakMode) -> Paragraph {
        paragraph.lineBreakMode = lineBreakMode
        return self
    }

    public func maximumLineHeight(_ maximumLineHeight: CGFloat = NSParagraphStyle.default.maximumLineHeight) -> Paragraph {
        paragraph.maximumLineHeight = maximumLineHeight
        return self
    }

    public func minimumLineHeight(_ minimumLineHeight: CGFloat = NSParagraphStyle.default.minimumLineHeight) -> Paragraph {
        paragraph.minimumLineHeight = minimumLineHeight
        return self
    }

    public func lineSpacing(_ lineSpacing: CGFloat = NSParagraphStyle.default.lineSpacing) -> Paragraph {
        paragraph.lineSpacing = lineSpacing
        return self
    }

    public func lineHeightMultiple(_ lineHeightMultiple: CGFloat = NSParagraphStyle.default.lineHeightMultiple) -> Paragraph {
        paragraph.lineHeightMultiple = lineHeightMultiple
        return self
    }

    public func paragraphSpacing(_ paragraphSpacing: CGFloat = NSParagraphStyle.default.paragraphSpacing) -> Paragraph {
        paragraph.paragraphSpacing = paragraphSpacing
        return self
    }

    public func paragraphSpacingBefore(_ paragraphSpacingBefore: CGFloat = NSParagraphStyle.default.paragraphSpacingBefore) -> Paragraph {
        paragraph.paragraphSpacingBefore = paragraphSpacingBefore
        return self
    }

    public func hyphenationFactor(_ hyphenationFactor: Float = NSParagraphStyle.default.hyphenationFactor) -> Paragraph {
        paragraph.hyphenationFactor = hyphenationFactor
        return self
    }

    public func writingDirection(_ writingDirection: NSWritingDirection = NSParagraphStyle.default.baseWritingDirection) -> Paragraph {
        paragraph.baseWritingDirection = writingDirection
        return self
    }

    public func tabStops(_ tabStops: [NSTextTab] = NSParagraphStyle.default.tabStops) -> Paragraph {
        paragraph.tabStops = tabStops
        return self
    }

    public func defaultTabInterval(_ defaultTabInterval: CGFloat = NSParagraphStyle.default.defaultTabInterval) -> Paragraph {
        paragraph.defaultTabInterval = defaultTabInterval
        return self
    }

}

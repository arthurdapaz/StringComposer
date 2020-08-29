//
//  FontAttribute.swift
//  
//
//  Created by Arthur da Paz on 18/08/20.
//

import UIKit

public enum FontAttribute {
    // traits
    case bolded//(UIFont)
    case italicized//(UIFont)
    // weights
    case ultraLight//(UIFont)
    case thin//(UIFont)
    case light//(UIFont)
    case regular//(UIFont)
    case medium//(UIFont)
    case semibold//(UIFont)
    case bold//(UIFont)
    case heavy//(UIFont)
    case black//(UIFont)

    public var value: UIFont {
        switch self {
        // traits
        case .bolded/*(let font)*/: return StringComposer.font.bolded
        case .italicized/*(let font)*/: return StringComposer.font.italicized

        // weights
        case .ultraLight/*(let font)*/: return StringComposer.font.with(weight: .ultraLight)
        case .thin/*(let font)*/: return StringComposer.font.with(weight: .thin)
        case .light/*(let font)*/: return StringComposer.font.with(weight: .light)
        case .regular/*(let font)*/: return StringComposer.font.with(weight: .regular)
        case .medium/*(let font)*/: return StringComposer.font.with(weight: .medium)
        case .semibold/*(let font)*/: return StringComposer.font.with(weight: .semibold)
        case .bold/*(let font)*/: return StringComposer.font.with(weight: .bold)
        case .heavy/*(let font)*/: return StringComposer.font.with(weight: .heavy)
        case .black/*(let font)*/: return StringComposer.font.with(weight: .black)
        }
    }
}

public enum ExtraAttribute {
    case breakline
    case space

    public var value: String {
        switch self {
        case .breakline: return "\n"
        case .space: return " "
        }
    }
}

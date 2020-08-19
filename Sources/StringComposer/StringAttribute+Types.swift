//
//  StringAttribute+Types.swift
//  comparecompre
//
//  Created by Arthur da Paz on 29/07/20.
//  Copyright © 2020 Arthur da Paz. All rights reserved.
//

import UIKit

extension StringAttribute {
    
    // MARK: - Ligatures
    public enum Ligatures: Int {
        case none
        case `default`
    }
    
    // MARK: - Text Effects
    public enum TextEffect: RawRepresentable {
        case letterPressStyle
        
        public init?(rawValue: String) {
            switch rawValue {
                case NSAttributedString.TextEffectStyle.letterpressStyle.rawValue:
                    self = .letterPressStyle
                default:
                    return nil
            }
        }
        
        public var rawValue: String {
            switch self {
                case .letterPressStyle:
                    return NSAttributedString.TextEffectStyle.letterpressStyle.rawValue
            }
        }
    }
    
    // MARK: - NSShadow Builder
    public enum Shadow: RawRepresentable {
        case with(color: UIColor = .black, blur: CGFloat = .zero, offset: CGSize = .zero)
        
        public init(rawValue: NSShadow) {
            self = .with(color: rawValue.shadowColor as! UIColor, blur: rawValue.shadowBlurRadius, offset: rawValue.shadowOffset)
        }
        
        public var rawValue: NSShadow {
            switch self {
                case .with(let color, let blur, let offset):
                    let shadow = NSShadow()
                    shadow.shadowOffset = offset
                    shadow.shadowBlurRadius = blur
                    shadow.shadowColor = color
                    return shadow
            }
        }
    }
    
}

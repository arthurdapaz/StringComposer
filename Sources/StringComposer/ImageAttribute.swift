//
//  ImageAttribute.swift
//  
//
//  Created by Arthur da Paz on 18/08/20.
//

import CoreGraphics

public enum ImageAttribute {
    case height(CGFloat)

    public var value: CGFloat {
        switch self {
        case .height(let height): return height
        }
    }
}

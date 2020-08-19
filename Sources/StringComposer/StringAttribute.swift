//
//  StringAttribute.swift
//  comparecompre
//
//  Created by Arthur da Paz on 26/07/20.
//  Copyright © 2020 Arthur da Paz. All rights reserved.
//

import UIKit

public enum StringAttribute: Equatable {
    case baselineOffset(Double)
    case backgroundColor(UIColor)
    case expansion(Double)
    case font(UIFont)
    case kern(Double)
    case ligatures(Ligatures)
    case link(String)
    case obliqueness(Double)
    case shadow(Shadow)
    case strokeColor(UIColor)
    case strokeWidth(Double)
    case strikethroughColor(UIColor)
    case strikethroughStyle(NSUnderlineStyle)
    case textColor(UIColor)
    case textEffect(TextEffect)
    case underlineColor(UIColor)
    case underlineStyle(NSUnderlineStyle)

    case custom(String, Any)
    
    // MARK: - Initializer
    init(name: NSAttributedString.Key, foundationValue: Any) {

        func validate<Type>(_ val: Any) -> Type {
            assert(val is Type, "Attribute \(name.rawValue) must have a value of type \(Type.self)")
            return val as! Type
        }
        
        func validateDouble(_ val: Any) -> Double {
            assert(val is NSNumber, "Attribute \(name.rawValue) must have a value castable to NSNumber")
            return (val as! NSNumber).doubleValue
        }
        
        var ret: StringAttribute!
        
        switch name {
            case .shadow: ret = .shadow(validate(foundationValue))
            case .baselineOffset: ret = .baselineOffset(validateDouble(foundationValue))
            case .backgroundColor: ret = .backgroundColor(validate(foundationValue))
            case .expansion: ret = .expansion(validateDouble(foundationValue))
            case .font: ret = .font(validate(foundationValue))
            case .kern: ret = .kern(validateDouble(foundationValue))
            case .ligature: ret = .ligatures(Ligatures(rawValue: validate(foundationValue))!)
            case .link: ret = .link(validate(foundationValue))
            case .obliqueness: ret = .obliqueness(validateDouble(foundationValue))
            case .strokeColor: ret = .strokeColor(validate(foundationValue))
            case .strokeWidth: ret = .strokeWidth(validateDouble(foundationValue))
            case .strikethroughColor: ret = .strikethroughColor(validate(foundationValue))
            case .strikethroughStyle: ret = .strikethroughStyle(NSUnderlineStyle(rawValue: validate(foundationValue)))
            case .foregroundColor: ret = .textColor(validate(foundationValue))
            case .textEffect: ret = .textEffect(TextEffect(rawValue: validate(foundationValue))!)
            case .underlineColor: ret = .underlineColor(validate(foundationValue))
            case .underlineStyle: ret = .underlineStyle(NSUnderlineStyle(rawValue: validate(foundationValue)))
            default:
                if ret == nil {
                    ret = .custom(name.rawValue, foundationValue)
            }
        }
        
        self = ret
    }
    
    // MARK: - Key Name
    public var keyName: NSAttributedString.Key {
        var name: NSAttributedString.Key!
        
        switch self {
            case .shadow: name = .shadow
            case .baselineOffset: name = .baselineOffset
            case .backgroundColor: name = .backgroundColor
            case .expansion: name = .expansion
            case .font: name = .font
            case .kern: name = .kern
            case .ligatures: name = .ligature
            case .link: name = .link
            case .obliqueness: name = .obliqueness
            case .strokeColor: name = .strokeColor
            case .strokeWidth: name = .strokeWidth
            case .strikethroughColor: name = .strikethroughColor
            case .strikethroughStyle: name = .strikethroughStyle
            case .textColor: name = .foregroundColor
            case .textEffect: name = .textEffect
            case .underlineColor: name = .underlineColor
            case .underlineStyle: name = .underlineStyle
            case .custom(let attributeName, _) where name == nil:
                name = NSAttributedString.Key(rawValue: attributeName)
            default: break
        }
        
        return name
    }
    
    // MARK: - Private Value
    private var baseValue: Any {
        
        switch self {
            case .shadow(let shadow): return shadow
            case .baselineOffset(let offset): return offset
            case .backgroundColor(let color): return color
            case .expansion(let expansion): return expansion
            case .font(let font): return font
            case .kern(let kern): return kern
            case .ligatures(let ligatures): return ligatures
            case .link(let link): return URL(string: link)!
            case .obliqueness(let value): return value
            case .strokeColor(let color): return color
            case .strokeWidth(let width): return width
            case .strikethroughColor(let color): return color
            case .strikethroughStyle(let style): return style
            case .textColor(let color): return color
            case .textEffect(let effect): return effect
            case .underlineColor(let color): return color
            case .underlineStyle(let style): return style
            case .custom(_, let value): return value
        }
    }
    
    // MARK: - Value
    public var value: Any {
        switch self {
            case .ligatures(let ligatures): return ligatures.rawValue
            case .strikethroughStyle(let style): return style.rawValue
            case .textEffect(let effect): return effect.rawValue
            case .underlineStyle(let style): return style.rawValue
            case .shadow(let shadow): return shadow.rawValue
            default:
                return baseValue
        }
    }
    
    // MARK: - Equatable
    static public func == (lhs: StringAttribute, rhs: StringAttribute) -> Bool {
        return (lhs.value as? NSObject) == (rhs.value as? NSObject)
    }
}



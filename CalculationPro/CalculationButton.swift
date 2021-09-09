//
//  SwiftUIView.swift
//  CalculationPro
//
//  Created by Володя Зверев on 9/9/21.
//

import SwiftUI

enum CalculationButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equlas, plus, minus, multiply, divide
    case devimal
    case ac, plusMinus, percent
    var title : String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .minus: return "-"
        case .plus: return "+"
        case .multiply: return "x"
        case .percent: return "%"
        case .plusMinus: return "+/-"
        case .equlas: return "="
        case .devimal: return "."
        case .divide: return "/"
        default: return "AC"
        }
    }
    
    var background: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .devimal:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return Color("buttonColor")
        }
    }
}

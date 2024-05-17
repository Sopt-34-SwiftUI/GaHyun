//
//  CalculatorButton.swift
//  SwiftUIStudy
//
//  Created by Gahyun Kim on 2024/05/17.
//

import SwiftUI

enum CalculatorButton: String {
    // 숫자
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    
    // 연산자
    case subtract = "\u{2212}"
    case add = "\u{002B}"
    case divide = "\u{00F7}"
    case multiply = "\u{00D7}"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "\u{002B}/-"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .divide, .multiply, .equal:
            return Color(.cyan)
        case .clear, .negative, .percent:
            return Color(.magenta)
        default:
            return Color(.systemPink)
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .clear, .negative, .percent:
            return Color(.black)
        default:
            return Color(.white)
        }
    }
}

enum Operation {
    case add, subtract, divide, multiply, none
}

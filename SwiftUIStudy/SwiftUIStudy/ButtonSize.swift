//
//  ButtonSize.swift
//  SwiftUIStudy
//
//  Created by Gahyun Kim on 2024/05/17.
//

import SwiftUI

/// Button Width
func buttonWidth(item: CalculatorButton) -> CGFloat {
    // 0일 경우에만 넓은 width를 준다!
    if item == .zero {
        return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
    }
    return (UIScreen.main.bounds.width - (5 * 12)) / 4
}

/// Button Height
func buttonHeight() -> CGFloat {
    return (UIScreen.main.bounds.width - (5 * 12)) / 4
}

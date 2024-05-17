//
//  MainView.swift
//  SwiftUIStudy
//
//  Created by Gahyun Kim on 2024/05/17.
//

import SwiftUI

struct MainView: View {
    
    // HStack이 5개니깐... 일단 이러케...
    private let buttons: [[CalculatorButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack {
            Spacer()
            ForEach(buttons, id: \.self) { button in
                HStack(spacing: 10) {
                    ForEach(button, id: \.self) { item in
                        Button {
                            calculate(button: item)
                        } label: {
                            Text(item.rawValue)
                                .font(.system(size: 40) .bold())
                                .frame(width: buttonWidth(item: item), height: buttonHeight())
                                .background(item.buttonColor)
                            // clipShape 와 rect의 활용에 대해서 다시 공부
                                .clipShape(.rect(cornerRadius: buttonWidth(item: item) / 2))
                                .foregroundColor(item.foregroundColor)
                        }
                    }
                }
            }
            .padding(.bottom, 7)
        }
    }
    
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
    
    /// 계산은 차차... 해볼게요
    func calculate(button: CalculatorButton) {
        print("")
    }
}

#Preview {
    MainView()
}

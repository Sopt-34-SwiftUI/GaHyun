//
//  MainView.swift
//  SwiftUIStudy
//
//  Created by Gahyun Kim on 2024/05/17.
//

import SwiftUI

struct MainView: View {
    
    @State private var displayNumber = "0"
    @State private var computeNumber = 0
    @State private var currentOperator: Operation = .none
    @State private var shouldClearDisplay = false
    @State private var history = []
    
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
            HStack {
                Spacer()
                Text("\(displayNumber)")
                    .bold()
                    .font(.system(size: 80))
                    .foregroundColor(.white)
            }
            .padding()
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
}

extension MainView {
    /// 계산은 차차... 해볼게요
    func calculate(button: CalculatorButton) {
        print("")
    }
}

#Preview {
    MainView()
}

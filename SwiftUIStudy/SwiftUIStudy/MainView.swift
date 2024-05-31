//
//  MainView.swift
//  SwiftUIStudy
//
//  Created by Gahyun Kim on 2024/05/17.
//

import SwiftUI

struct MainView: View {
    
    @State private var displayNumber = "0"
    @State private var runningNumber = 0
    @State private var currentOperator: Operation = .none
    @State private var shouldClearDisplay = false
 
    
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
        .padding()
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
    
}

extension MainView {
    func calculate(button: CalculatorButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                currentOperator = .add
                runningNumber = Int(displayNumber) ?? 0
            }
            else if button == .subtract {
                currentOperator = .subtract
                runningNumber = Int(displayNumber) ?? 0
            }
            else if button == .multiply {
                currentOperator = .multiply
                runningNumber = Int(displayNumber) ?? 0
            }
            else if button == .divide {
                currentOperator = .divide
                runningNumber = Int(displayNumber) ?? 0
            }
            else if button == .equal {
                let runningValue = runningNumber
                let currentValue = Int(displayNumber) ?? 0
                
                switch self.currentOperator {
                case .add: displayNumber = "\(runningValue + currentValue)"
                case .subtract: displayNumber = "\(runningValue - currentValue)"
                case .multiply: displayNumber = "\(runningValue * currentValue)"
                case .divide: displayNumber = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            shouldClearDisplay = true
            
        case .clear:
            displayNumber = "0"
            runningNumber = 0
            currentOperator = .none
            shouldClearDisplay = false
        case .decimal, .negative, .percent:
            break
        default: // 숫자일 경우
            if shouldClearDisplay {
                displayNumber = button.rawValue
                shouldClearDisplay = false
            } else {
                let number = button.rawValue
                if displayNumber == "0" {
                    displayNumber = number
                }
                else {
                    displayNumber = "\(displayNumber)\(number)"
                }
            }
        }
    }
}

#Preview {
    MainView()
}

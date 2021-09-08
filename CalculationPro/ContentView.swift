//
//  ContentView.swift
//  CalculationPro
//
//  Created by Володя Зверев on 8/9/21.
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

class GlobalEnvironment: ObservableObject {
    @Published var display = "0"
    func receiveInput(calculatorButton: CalculationButton) {
        self.display = calculatorButton.title
    }
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculationButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .devimal, .equlas],
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("backgroundColor").ignoresSafeArea(.all)
            VStack(spacing: 12) {
                HStack{
                    Spacer()
                    Text(env.display)
                        .font(.system(size: 64))
                        .foregroundColor(Color("textColor"))
                }.padding()
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    func buttonWidth(button: CalculationButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 3 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}

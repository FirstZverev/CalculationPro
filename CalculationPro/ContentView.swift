//
//  ContentView.swift
//  CalculationPro
//
//  Created by Володя Зверев on 8/9/21.
//

import SwiftUI

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
                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}

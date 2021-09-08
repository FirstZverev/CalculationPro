//
//  CalculatorButtonView.swift
//  CalculationPro
//
//  Created by Володя Зверев on 8/9/21.
//

import SwiftUI

struct CalculatorButtonView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    var button: CalculationButton

    var body: some View {
        Button(action: {
            self.env.receiveInput(calculatorButton: button)
        }, label: {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: buttonWidth(button: button), height: buttonHeight(), alignment: .center)
                .background(button.background)
                .cornerRadius(buttonHeight())
                .foregroundColor(.white)
            
        })
    }
}

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView()
    }
}

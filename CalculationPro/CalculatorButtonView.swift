//
//  CalculatorButtonView.swift
//  CalculationPro
//
//  Created by Володя Зверев on 8/9/21.
//

import SwiftUI
enum DragState {
    case inactive(translation: CGSize)
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive(let translation):
            return translation
        case .dragging(let translation):
            return translation
        }
    }
}
struct CalculatorButtonView: View {
    @EnvironmentObject var env: GlobalEnvironment
    @GestureState var dragState: DragState = DragState.inactive(translation: .zero)

    var button: CalculationButton

    var body: some View {
        let dragGesture = DragGesture()
            .updating($dragState) { value, state, transc in
                state = .dragging(translation: value.translation)
            }
        Button(action: {
            self.env.receiveInput(calculatorButton: button)
        }, label: {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: buttonWidth(button: button), height: buttonHeight(), alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color("buttonColor"), button.background]), startPoint: .topLeading, endPoint: .bottomTrailing))
                
                .cornerRadius(buttonHeight())
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: Double(dragState.translation.width) / 10))
                .offset(
                    x: dragState.translation.width,
                    y: dragState.translation.height)
                .gesture(dragGesture)
                .animation(.spring(response: 0.7, dampingFraction: 0.5))

        })
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

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonView(button: CalculationButton(rawValue: "zero")!)
    }
}

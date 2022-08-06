//
//  PincodeField.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import SwiftUI

struct PincodeField: View {

    @Environment(\.theme) var theme: Theme

    let pinLimit: Int = 6
    let canEdit: Bool = true
    @Binding var pinCode: String

    private var pins: [String] {
        return pinCode.map {String($0)}
    }
    var body: some View {
        ZStack {
            VStack {
                PinCodeTextField(limit: pinLimit, canEdit: canEdit, text: $pinCode)
                    .border(Color.black, width: 1)
                    .frame(height: 72)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .opacity(0)

            HStack {
                ForEach(0 ..< pinLimit, id: \.self) { item in
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundColor(theme.colors.actionSubduedPressed)

                        if item < pinCode.count {
                            Text(pins[item])
                                .font(theme.typography.displayLarge)
                                .foregroundColor(theme.colors.textDefault)
                        }
                    }
                }
                .frame(width: 44, height: 72)
            }
        }
    }
}

struct PinCodeTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        let limit: Int
        var canEdit: Bool
        @Binding var text: String

        init(limit: Int, canEdit: Bool, text: Binding<String>) {
            self.limit = limit
            self.canEdit = canEdit
            self._text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.sync {
                self.text = textField.text ?? ""
            }
            if self.limit == self.text.count {
                textField.resignFirstResponder()
            }
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard canEdit else { return false }

            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }

            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

            return updatedText.count <= limit
        }
    }
    let limit: Int
    var canEdit: Bool
    @Binding var text: String

    func makeUIView(context: UIViewRepresentableContext<PinCodeTextField>) -> some UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .numberPad

        return textField
    }

    func makeCoordinator() -> PinCodeTextField.Coordinator {
        return Coordinator(limit: limit, canEdit: canEdit, text: $text)
    }

    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<PinCodeTextField>) {
        uiView.text = text
        context.coordinator.canEdit = canEdit
        uiView.becomeFirstResponder()
    }
}

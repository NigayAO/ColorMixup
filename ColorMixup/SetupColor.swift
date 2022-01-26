//
//  SetupColor.swift
//  ColorMixup
//
//  Created by Alik Nigay on 26.01.2022.
//

import SwiftUI

struct SetupColor: View {
    @State private var value = Double.random(in: 0...255)
    @State private var stringValue = ""
    @FocusState private var isInputActive: Bool
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 50, height: 35)
                .foregroundColor(.red)
            Slider(value: $value, in: 0...255, step: 1)
            TextField("255", text: $stringValue)
                .frame(width: 50, height: 35)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            if let digital = Double(stringValue) {
                                value = digital
                            }
                            isInputActive = false
                        }
                    }
                }
        }
    }
}

struct SetupColor_Previews: PreviewProvider {
    static var previews: some View {
        SetupColor()
    }
}

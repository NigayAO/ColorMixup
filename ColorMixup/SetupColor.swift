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
    var body: some View {
        SliderResult(color: .red, value: $value, stringValue: $stringValue)
    }
}

struct TextLabel: View {
    
    let value: Double
    let color: Color
    
    var body: some View {
        Text("\(lround(value))")
            .foregroundColor(color)
            .frame(width: 50, height: 50)
    }
}

struct SetSlider: View {
    
    @Binding var value: Double
    
    let color: Color
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
            .tint(color)
    }
}

struct SetTextField: View {
    
    @Binding var value: Double
    @Binding var stringValue: String
    
    var body: some View {
        TextField("\(lround(value))", text: $stringValue)
            .frame(width: 50, height: 35)
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
    }
}

struct SliderResult: View {
    
    let color: Color
    
    @Binding var value: Double
    @Binding var stringValue: String
    
    var body: some View {
        HStack {
            TextLabel(value: value, color: color)
            SetSlider(value: $value, color: color)
            SetTextField(value: $value, stringValue: $stringValue)
        }
    }
}

struct SetupColor_Previews: PreviewProvider {
    static var previews: some View {
        SetupColor()
    }
}

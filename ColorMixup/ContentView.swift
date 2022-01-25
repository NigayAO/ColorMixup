//
//  ContentView.swift
//  ColorMixup
//
//  Created by Alik Nigay on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = 25.0
    @State private var greenValue = 50.0
    @State private var blueValue = 100.0
    
    @State private var stringValue = ""
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        VStack {
            ColorView(red: redValue, green: greenValue, blue: blueValue)
            SliderResult(color: .red, value: $redValue)
            SliderResult(color: .green, value: $greenValue)
            SliderResult(color: .blue, value: $blueValue)
        }
        .focused($isInputActive)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: { isInputActive = false }) {
                    Text("Done")
                }
            }
        }
        .padding()
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorView: View {
    
    var red: Double
    var green: Double
    var blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 300, height: 150)
            .foregroundColor(Color(.sRGB, red: red, green: green, blue: blue, opacity: 1.0))
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 5))
            .shadow(radius: 10)
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
    
    var body: some View {
        TextField("", value: $value, formatter: NumberFormatter())
            .frame(width: 50, height: 50)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
    }
}

struct SliderResult: View {
    
    let color: Color
    
    @Binding var value: Double
    
    var body: some View {
        HStack {
            TextLabel(value: value, color: color)
            SetSlider(value: $value, color: color)
            SetTextField(value: $value)
        }
    }
}

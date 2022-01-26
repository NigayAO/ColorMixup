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

    @State private var redStringValue = ""
    @State private var greenStringValue = ""
    @State private var blueStringValue = ""
    
    @State private var alertPresenter = false
    
    @FocusState private var isInputActive: Bool

    var body: some View {
        VStack {
            ColorView(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
            SliderResult(color: .red, value: $redValue, stringValue: $redStringValue)
            SliderResult(color: .green, value: $greenValue, stringValue: $greenStringValue)
            SliderResult(color: .blue, value: $blueValue, stringValue: $blueStringValue)
        }
        .focused($isInputActive)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button(action: { donePressed(for: redValue, with: redStringValue) }) {
                    Text("Done")
                }
                .alert("Input wrong!", isPresented: $alertPresenter, actions: {}) {
                    Text("You must enter value from 0 to 255")
                }
            }
        }
        .padding()
        Spacer()
    }
    
    private func donePressed(for value: Double, with string: String) {
        
        guard let digit = Double(string) else { return }
        if digit <= 255 {
            switch value {
            case redValue:
                redValue = digit
                redStringValue = ""
            case greenValue:
                greenValue = digit
                greenStringValue = ""
            default:
                blueValue = digit
                blueStringValue = ""
            }
        } else {
            alertPresenter.toggle()
        }
        isInputActive = false
        
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
            .foregroundColor(Color(red: red, green: green, blue: blue))
            .frame(width: 300, height: 150)
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

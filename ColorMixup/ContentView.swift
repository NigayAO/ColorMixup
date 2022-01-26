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
                Button(action: { donePressed()}) {
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
    
    private func donePressed() {
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

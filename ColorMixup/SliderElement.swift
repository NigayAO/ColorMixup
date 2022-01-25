////
////  SliderElement.swift
////  ColorMixup
////
////  Created by Alik Nigay on 25.01.2022.
////
//
//import SwiftUI
//
//struct SliderElement: View {
//    @Binding var value: Double
//    @Binding var stringValue: String
//    let color: Color
//    var body: some View {
//        
//        HStack {
//            TextLabel(value: value, color: color)
//            SetupSlider(value: $value, color: color)
//            SetupTextField(stringValue: stringValue, value: $value)
//        }
//        
//    }
//}
//
////struct SliderElement_Previews: PreviewProvider {
////    static var previews: some View {
////        SliderElement(value: 20, stringValue: "", color: .red)
////    }
////}
//
//struct TextLabel: View {
//    let value: Double
//    let color: Color
//    var body: some View {
//        Text("\(lround(value))")
//            .foregroundColor(color)
//            .frame(width: 50, height: 50)
//    }
//}
//
//struct SetupSlider: View {
//    @Binding var value: Double
//    let color: Color
//    var body: some View {
//        Slider(value: $value, in: 1...255, step: 1)
//            .tint(color)
//    }
//}
//
//struct SetupTextField: View {
//    let stringValue: String
//    @Binding var value: Double
//    var body: some View {
//        TextField(stringValue, value: $value, formatter: NumberFormatter())
//            .frame(width: 50, height: 50)
//            .textFieldStyle(.roundedBorder)
//            .keyboardType(.decimalPad)
//    }
//}

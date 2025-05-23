//
//  ContentView.swift
//  conversion
//
//  Created by shalinth adithyan on 19/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Feet"
    
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var convertedValue: Double {
        let baseValueInMeters = convertToMeters(value: inputValue, unit: inputUnit)
        return convertFromMeters(value: baseValueInMeters, to: outputUnit)
    }
    
    var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Input")) {
                        TextField("Enter value", value: $inputValue, format: .number)
                            .keyboardType(.decimalPad)
                        
                        Picker("From", selection: $inputUnit) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(header: Text("Output")) {
                        Picker("To", selection: $outputUnit) {
                            ForEach(units, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        Text("\(convertedValue, specifier: "%.2f") \(outputUnit)")
                    }
                }
                .navigationTitle("Length Converter")
            }
        }
        
        func convertToMeters(value: Double, unit: String) -> Double {
            switch unit {
            case "Meters": return value
            case "Kilometers": return value * 1000
            case "Feet": return value * 0.3048
            case "Yards": return value * 0.9144
            case "Miles": return value * 1609.34
            default: return value
            }
        }
        
        func convertFromMeters(value: Double, to unit: String) -> Double {
            switch unit {
            case "Meters": return value
            case "Kilometers": return value / 1000
            case "Feet": return value / 0.3048
            case "Yards": return value / 0.9144
            case "Miles": return value / 1609.34
            default: return value
            }
        }
    }


#Preview {
    ContentView()
}

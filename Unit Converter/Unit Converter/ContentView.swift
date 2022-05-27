//
//  ContentView.swift
//  Unit Converter
//
//  Created by Kamal Preet Singh on 2022-04-27.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "m"
    @State private var outputUnit = "km"
    @State private var input = 0.0
    
    let units = ["m", "km", "ft", "yd", "mi"]
    
    private var output: Double {
        var output = 0.0
        switch (inputUnit, outputUnit) {
        case ("m", "km"):
            output = input / 1000
        case ("m", "ft"):
            output = input * 3.28
        case ("m", "yd"):
            output = input * 1.09
        case ("m", "mi"):
            output = input * 0.0006
        case ("km", "m"):
            output = input * 1000
        case ("km", "ft"):
            output = input * 3280.8
        case ("km", "yd"):
            output = input * 1093.6
        case ("km", "mi"):
            output = input * 0.6
        case ("ft", "m"):
            output = input * 0.3
        case ("ft", "km"):
            output = input * 0.0003
        case ("ft", "yd"):
            output = input * 0.33
        case ("ft", "mi"):
            output = input * 0.0001
        case ("yd", "m"):
            output = input * 0.9
        case ("yd", "km"):
            output = input * 0.0009
        case ("yd", "ft"):
            output = input * 3
        case ("yd", "mi"):
            output = input * 0.0005
        case ("mi", "m"):
            output = input * 1609.3
        case ("mi", "km"):
            output = input * 1.609
        case ("mi", "ft"):
            output = input * 5280
        case ("mi", "yd"):
            output = input * 1760
        default:
            output = input
        }
        return output
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Unit")
                }
                
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
                
                Section {
                    TextField("Enter input", value: $input, format: .number)
                }
                
                Section {
                    Text(output, format: .number)
                }
            }
            .navigationTitle("Unit Convertor")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

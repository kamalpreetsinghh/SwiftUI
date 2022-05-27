//
//  ContentView.swift
//  SleepTime
//
//  Created by Kamal Preet Singh on 2022-05-07.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeTime = defaultWakeTime
    @State private var numberOfCups = 1
    @State private var sleepingHours = 8.0
    @State private var sleepTime = Date.now
    @State private var showSleepTime = false
    @State private var showError = false
    
    static var defaultWakeTime: Date {
        var dateComponents = DateComponents()
        dateComponents.hour = 7
        dateComponents.minute = 0
        return Calendar.current.date(from: dateComponents) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Please select a time", selection: $wakeTime, displayedComponents: .hourAndMinute)
                } header: {
                    Text("Please select a time")
                }
                
                Section {
                    Stepper("\(sleepingHours.formatted()) hours", value: $sleepingHours, in: 4...12, step: 0.25)
                } header: {
                    Text("Sleeping hours")
                }
                
                Section {
                    Stepper(numberOfCups == 1 ? "1 cup" : "\(numberOfCups) cups", value: $numberOfCups, in: 1...20)
                } header: {
                    Text("Daily coffee intake")
                }
                
                HStack {
                    Spacer()
                    Button("Bed Time", action: calculateSleepTime)
                        .font(.headline)
                        .buttonStyle(.borderedProminent)
                        .alert("Error", isPresented: $showError) {
                            Button("OK") { }
                        } message: {
                            Text("Sorry, there was a problem calculating your bedtime.")
                        }
                    Spacer()
                }
                
                if showSleepTime {
                    Section {
                        HStack {
                            Text("Your bed time is:")
                            Text("\(sleepTime.formatted(date: .omitted, time: .shortened))")
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Sleep Time")
        }
    }
    
    func calculateSleepTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepTime(configuration: config)
            
            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: wakeTime)
            let hours = (dateComponents.hour ?? 0) * 60 * 60
            let minutes = (dateComponents.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hours + minutes), estimatedSleep: sleepingHours, coffee: Double(numberOfCups))
            
            sleepTime = wakeTime - prediction.actualSleep
            showSleepTime = true
        } catch {
            showError = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

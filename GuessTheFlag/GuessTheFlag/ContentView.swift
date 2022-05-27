//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Kamal Preet Singh on 2022-04-27.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Bangladesh", "Brazil", "China", "Colombia", "Congo Democratic Republic", "Egypt", "England", "Estonia", "Ethiopia", "France", "Germany", "India", "Indonesia", "Iran", "Ireland", "Italy", "Japan", "Mexico", "Monaco", "Myanmar", "Nigeria", "Pakistan", "Philippines", "Poland", "Russia", "South Africa", "South Korea", "Spain", "Tanzania", "Thailand", "Turkey", "UK", "US", "Vietnam"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionNumber = 1
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("GUESS THE FLAGS")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                .padding(50)
                
                VStack(spacing: 50) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .font(.headline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .resizable()
                                .renderingMode(.original)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                        .frame(width: 200, height: 100)
                    }
                    
                    VStack {
                        Text("Your Score: \(score)")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your Score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
        questionNumber += 1
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

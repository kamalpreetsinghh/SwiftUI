//
//  AstronautView.swift
//  Moonshot
//
//  Created by Kamal Preet Singh on 2022-05-15.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
        AstronautView(astronaut: astronauts[0])
    }
}

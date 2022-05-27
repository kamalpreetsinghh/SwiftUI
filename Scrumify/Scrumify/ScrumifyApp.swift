//
//  ScrumifyApp.swift
//  Scrumify
//
//  Created by Kamal Preet Singh on 2022-03-23.
//

import SwiftUI

@main
struct ScrumifyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}

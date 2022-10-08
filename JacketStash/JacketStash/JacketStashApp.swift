//
//  JacketStashApp.swift
//  JacketStash
//
//  Created by Adam Yao on 10/7/22.
//

import SwiftUI
import Firebase

@main
struct JacketStash: App {
  // register app delegate for Firebase setup
    
    @StateObject var dataManager = DataManager()
  
    init() {
        FirebaseApp.configure()
    }

  var body: some Scene {
    WindowGroup {
        ListView()
            .environmentObject(dataManager)
    }
  }
}

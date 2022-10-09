//
//  JacketStashApp.swift
//  JacketStash
//
//  Created by Adam Yao on 10/7/22.
//

import SwiftUI
import Firebase
import FirebaseStorage





@main
struct JacketStash: App {
  // register app delegate for Firebase setup
    init() {
        
        FirebaseApp.configure()
    }

  var body: some Scene {
    WindowGroup {
        let _ = print("App Launching")
        //ContentView(userIsLoggedIn: .constant(false))
        ContentView()
    }
  }
}

//class FirebaseManager: NSObject {
//    let auth = Auth.self
//    let storage = FirebaseStorage
//
//    static let shared = FirebaseManager()
//
//    override init() {
//        FirebaseApp.configure()
//
//        self.auth = Auth.auth()
//        self.storage = Storage.storage()
//
//        super.init()
//
//    }
//}

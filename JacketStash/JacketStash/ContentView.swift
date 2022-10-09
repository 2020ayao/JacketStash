//
//  ContentView.swift
//  JacketStash
//
//  Created by Adam Yao on 10/7/22.
//

// NOW PARTNERING WITH OVER (SCROLLING) 600+ MEMBERS.

import SwiftUI
import FirebaseStorage
import FirebaseAuth
import Firebase
import FirebaseFirestore

import FirebaseFirestore
import FirebaseAnalytics
import SwiftUI
import Foundation

//class FirebaseManager: NSObject {
//
//    let auth: Auth
//    let storage: Storage
//    //let firestore: Firebase
//    static let shared = FirebaseManager()
//
//
//    override init() {
//        FirebaseApp.configure()
//
//        self.auth = Auth.auth()
//
//        super.init()
//    }
//
//}

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    @State var displayName = ""
    @State public var userIsLoggedIn = false
    //@Binding var userIsLoggedIn: Bool
    @StateObject var dataManager = DataManager()
    
    private var loginStatusMessage = ""
    var body: some View {
        
        if userIsLoggedIn {
            //HomeView(isLoggedIn: userIsLoggedIn)
            HomeView()
        }
        else{
            content
        }
//        NavigationStack {
//            if userIsLoggedIn {
//                //            ListView()
//                //                .environmentObject(dataManager)
//                NavigationLink(destination: HomeView(isLoggedIn: userIsLoggedIn)) {
//                    Text("Let's get started")
//                }
//                //NavigationLink("HomeView", destination: HomeView(isLoggedIn: userIsLoggedIn))
//            }
//            else{
//                content
//            }
//        }
        
        //        if userIsLoggedIn {
        //            //            ListView()
        //            //                .environmentObject(dataManager)
        //            HomeView()
        //        }
        //        else{
        //            content
        //        }
    }
    
    var content : some View {
        ZStack
        {
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundStyle(.linearGradient(colors: [.red,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
            //.frame(width: 1000, height: 400)
            //                .rotationEffect(.degrees(135))
            //                .offset(y:-350)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                Text("JacketStash")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x:-60, y:-100)
                
                
                TextField("Name", text:$displayName)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: displayName.isEmpty){
                        Text("Name")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width:350, height:1)
                    .foregroundColor(.white)
                
                TextField("Email", text:$email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty){
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width:350, height:1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width:350, height:1)
                    .foregroundColor(.white)
                
                Button {
                    register()
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width:200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style:.continuous).fill(.linearGradient(colors: [.blue,.teal], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 110)
                
                
            }
            .frame(width: 350)
            .offset(y: -10)
            .onAppear {
                Auth.auth().addStateDidChangeListener {auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                        print("User is logged in." )
                        
                        if let email = user?.email {
                            print(email)
                        }
                    }
                }
            }
            
        }
        .ignoresSafeArea()
    }
    //    private mutating func storeUserInformation(imageProfileUrl: URL) {
    //        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
    //        let userData = ["email": self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
    //        FirebaseManager.shared.firestore.collection("users")
    //            .document(uid).setData(userData) { err in
    //                if let err = err {
    //                    print(err)
    //                    self.loginStatusMessage = "\(err)"
    //                    return
    //                }
    //
    //                print("Success")
    //            }
    //    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            if let currentUser = Auth.auth().currentUser?.createProfileChangeRequest() {
                currentUser.displayName = self.displayName
                currentUser.commitChanges(completion: {error in
                    if let error = error {
                        print(error)
                    } else {
                        print(currentUser.displayName!)
                        print("DisplayName changed")
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

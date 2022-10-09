//
//  HomeView.swift
//  JacketStash
//
//  Created by Adam Yao on 10/8/22.
//

//----------NOTES-----------

// Checkout button should be held for 5 seconds to confirm(chipotle)
// Implement back button for new Views
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    @State private var name = ""
    @State var CheckIn = false
    @State var CheckOut = false
    
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5, style: .continuous).foregroundStyle(.linearGradient(colors: [.red,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
            //.frame(width: 1000, height: 400)
            //                .rotationEffect(.degrees(135))
                .offset(y:-350)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Hi, \(retrieveName())")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .offset(x:-100, y:100)
                HStack{
                    Button {
                        self.CheckIn.toggle()
                    } label: {
                        Text("Check in")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.indigo)
                            .cornerRadius(10)
                            .bold()
                    }
                    .sheet(isPresented: $CheckIn) {
                        CheckInView()
                    }
                    Button {
                        self.CheckOut.toggle()
                    } label: {
                        Text("Check out")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.indigo)
                            .cornerRadius(10)
                            .bold()
                    }
                    .sheet(isPresented: $CheckOut) {
                        CheckOutView()
                    }
                }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .offset(y:-25)
                
                Button{
                    logout()
                } label: {
                    Text("Logout")
                        .bold()
                        .foregroundColor(.black)
                        .padding(.bottom)
                }
            }.ignoresSafeArea()
        }
    }
    func logout() {
        try! Auth.auth().signOut()
        print("user is logged out")
    }
    
    func retrieveName() -> String {
//        let user = Auth.auth().currentUser
//        if let user = user {
////            if let displayName = user.displayName {
////                return displayName
//            print(user.email)
//            return user.displayName ?? "default"
//            }
//          // The user's ID, unique to the Firebase project.
//          // Do NOT use this value to authenticate with your backend server,
//          // if you have one. Use getTokenWithCompletion:completion: instead.
//          return ""
        
        if Auth.auth().currentUser != nil {
            if let name = Auth.auth().currentUser!.displayName{
                return name
            }
        } else {
          return "default"
        }
        return "default"
        }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

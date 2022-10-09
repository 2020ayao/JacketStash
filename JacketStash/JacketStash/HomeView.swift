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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5, style: .continuous).foregroundStyle(.linearGradient(colors: [.red,.indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
            //.frame(width: 1000, height: 400)
            //                .rotationEffect(.degrees(135))
                .offset(y:-350)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Hi, Adam")
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

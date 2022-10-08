//
//  ListView.swift
//  JacketStash
//
//  Created by Adam Yao on 10/8/22.
//

import SwiftUI
import Firebase

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    
    var body: some View {
        NavigationView {
            List(dataManager.dogs, id: \.id) { dog in
                Text(dog.breed)
            }
            .navigationTitle("Dogs")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label:  {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup) {
                NewDogView()
            }
            
        }
        Button{
            logout()
        } label: {
            Text("Logout")
                .bold()
                .foregroundColor(.black)
        }
    }
    
    func logout() {
        try! Auth.auth().signOut()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}

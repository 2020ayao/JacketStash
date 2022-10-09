//
//  CheckInView.swift
//  JacketStash
//
//  Created by Adam Yao on 10/8/22.
//

import SwiftUI

struct CheckInView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        Text("Let's get started...")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundColor(.black)
            .offset(x:-50, y:-300)
        
        
       // UIImage()
        // QR CODE IMAGE
        
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}

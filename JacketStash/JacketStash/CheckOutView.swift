//
//  CheckOutView.swift
//  JacketStash
//
//  Created by Adam Yao on 10/8/22.
//

import SwiftUI

struct CheckOutView: View {
    @State private var colorScheme = 0
    var body: some View {
        
        // -------- COAT SCAN PICKER SELECTION -------
        
        Picker("Color Scheme", selection: $colorScheme) {
            Text("Scan Me").tag(0)
            Text("Scan Coat").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .foregroundColor(.black)
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView()
    }
}

//
//  AddButton.swift
//  Contacts
//
//  Created by Swope, Thomas on 12/9/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct ListingsButton: View {
    
    var body: some View {
        NavigationLink(destination: ListingsView()) {
            Text("Listings Page")
            .frame(width: 180)
            .padding(.vertical, 15)
            .background(Color.blue)
            .cornerRadius(8)
            .foregroundColor(.white)
        }
    }
}

struct ListingsButton_Previews: PreviewProvider {
    static var previews: some View {
        ListingsButton()
    }
}

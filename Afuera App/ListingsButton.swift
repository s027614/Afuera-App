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
            Image(systemName: "plus")
            .foregroundColor(.black)
            Text("Listings Page")
            .foregroundColor(.black)
        }
    }
}

struct ListingsButton_Previews: PreviewProvider {
    static var previews: some View {
        ListingsButton()
    }
}

//
//  AddButtonView.swift
//  Contacts
//
//  Created by Jacob Lowry (student LM) on 12/9/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI

struct AddButtonView: View {
    
    @Binding var listings : [Listing]
    
    var body: some View {
        
        Button(action: {
            self.listings.append(Listing(image: "joe mama", name: "Tyler", email: "Tyler@NewWaveComputers.com"))
        }){
            Image(systemName: "plus.square.fill")
                .foregroundColor(.orange)
                .scaleEffect(3)
                .padding(.all, 20)
                .padding(.trailing)
        
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(listings: Binding.constant([Listing(image: "joe mama", name: "Tyler", email: "Tyler@newwavecomputers.com")]))
    }
}
}

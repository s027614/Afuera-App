//
//  AddButtonView.swift
//  Contacts
//
//  Created by Jacob Lowry (student LM) on 12/9/20.
//  Copyright © 2020 Swope, Thomas. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


struct AddButtonView: View {
    
    @Binding var listings : [Listing]
   // @State var listing: ListingViewModel = ListingViewModel()
    
    var body: some View {
        
        Button(action: {
            self.listings.append(Listing(image: "joe mama", name: "Tyler", email: "Tyler@NewWaveComputers.com"))
            
            guard let uid = Auth.auth().currentUser?.uid else {return}
                       let database = Database.database().reference()
                       
                 //      database.child("listings/\(uid)/listings").setValue(self.user.fullname)
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

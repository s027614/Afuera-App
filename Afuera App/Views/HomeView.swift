//
//  HomeView.swift
//  FireDrill
//
//  Created by Elliot Ginzburg (student LM) on 2/10/21.
//  Copyright © 2021 Elliot Ginzburg (student LM). All rights reserved.
//

import FirebaseStorage
import FirebaseDatabase
import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State private var image: Image = Image("user")
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    func saveImage(){
    guard let input = inputImage else {return}
    image = Image(uiImage: input)
    
    //get reference to current user
    guard let uid = Auth.auth().currentUser?.uid else {return}
    
    //get reference to the storage
    let storage = Storage.storage().reference().child("user/\(uid)")
    
    //images have to be saved as data objects to convert and compress
    
    guard let imageData = input.jpegData(compressionQuality: 0.75) else {return}
    
    storage.putData(imageData, metadata: StorageMetadata()){
        (metadata, error)
        in
        if let _ = metadata {
            storage.downloadURL { (url, error) in
                guard let imageURL = url else { return }
                
                let database = Database.database().reference().child("users/\(uid)")
                
                let userObject: [String: Any] = ["photoURL": imageURL.absoluteString]
                
                database.setValue(userObject)
            }
        }
    }
    }
    var body: some View {
        VStack{
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .clipped()
            Button(action: {
                self.showingImagePicker = true
            }) {
                Text("Change LImage")
                    .frame(width: 200)
                    .padding(.vertical, 15)
                    .background(Color.green)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }.padding()
            
            Button(action: {
                try! Auth.auth().signOut()
                self.userInfo.configureFirebaseStateDidChange()
            }) {
                Text("Log Out")
                    .frame(width: 200)
                    .padding(.vertical, 15)
                    .background(Color.green)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
        }.sheet(isPresented: $showingImagePicker, onDismiss: saveImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

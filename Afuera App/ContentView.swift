//
//  ContentView.swift
//  FireDrill
//
//  Created by Elliot Ginzburg (student LM) on 2/3/21.
//  Copyright © 2021 Elliot Ginzburg (student LM). All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
struct ContentView: View {
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        
        VStack{
            
            Group{
                if userInfo.isUserAuthenticated == .undefined{
                    Text("Loading")
                }
                else if userInfo.isUserAuthenticated == .signedOut{
                    LoginView()
                }
                else {
                    HomeView()
                }
            }.onAppear(){
                self.userInfo.configureFirebaseStateDidChange()
            }
        }.padding(.top, 250).padding(.bottom, 300)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

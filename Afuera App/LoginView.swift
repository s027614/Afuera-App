//
//  LoginView.swift
//  FireDrill
//
//  Created by Elliot Ginzburg (student LM) on 2/10/21.
//  Copyright © 2021 Elliot Ginzburg (student LM). All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

struct LoginView: View {
    
    enum Action{
        case signUp, resetPW
    }
    
    @State var showSheet = false
    @State var action: Action?
    @EnvironmentObject var userInfo: UserInfo
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        SignInWithEmailView(showSheet: $showSheet, action: $action)
            .sheet(isPresented: $showSheet) {
                if self.action == .signUp{
                    SignUpView().environmentObject(self.userInfo).environmentObject(self.user)
                }
                else {
                    ForgotPasswordView()
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


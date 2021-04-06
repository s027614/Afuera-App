//
//  ProfileView.swift
//  Afuera App
//
//  Created by Elliot Ginzburg (student LM) on 4/6/21.
//  Copyright © 2021 Jacob Lowry (student LM). All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
        //background
        Image("back").resizable().edgesIgnoringSafeArea(.all).aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .bottom)
        
        VStack {
            //name
            Text("Elliot Ginzburg").foregroundColor(Color.white).position(x: 210, y: 155)
            Text("First SwiftUI Project").foregroundColor(Color.white).position(x: 210, y: 5)
            Spacer()
            //game title
            Text("SUS OR NOT SUS GAME").fontWeight(.heavy).foregroundColor(Color.red)
                .font(.largeTitle).position(x: 210, y: 230)
            Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

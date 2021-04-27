//
//  LoadImage.swift
//  FireDrill
//
//  Created by Swope, Thomas on 2/24/21.
//  Copyright © 2021 Swope, Thomas. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class LoadImage{
    class func loadImage(_ urlString: String?) -> UIImage{
        do{
            guard var unWrappedString = urlString else { return UIImage(named: "default") ?? UIImage() }
            guard let url = URL(string: unWrappedString) else { return UIImage(named: "default") ?? UIImage()}
            
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
            
        } catch{
            return UIImage(named: "default") ?? UIImage()
        }
    }
}


struct LoadImage_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

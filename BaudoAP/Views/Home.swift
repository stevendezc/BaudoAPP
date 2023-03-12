//
//  Home.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
//import SDWebImageSwiftUI

struct Home: View {
    @ObservedObject var contentImage = ContentImage()
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                ForEach(contentImage.posts) {post in
                    PostCardImage(model: post)
                }
                
                
                //.navigationTitle("Home")
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

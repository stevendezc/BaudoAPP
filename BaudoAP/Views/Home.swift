//
//  Home.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    @ObservedObject var contentImage = ContentImage()
    @State var selectedTab = 0
    var body: some View {
       
        
        NavigationView{
               ScrollView {
//                    Images()
                    Spacer()
                    Picker("", selection: $selectedTab) {
                                    Text("First").tag(0)
                                    Text("Second").tag(1)
                                    Text("Third").tag(2)
                                }.padding()
                                .pickerStyle(SegmentedPickerStyle())

                                switch(selectedTab) {
                                    case 0: Images()
                                    case 1: Navegantes()
                                    case 2: Tienda()
                                
                                default:
                                    Images()
                                }

                }
               .refreshable {
                   contentImage.fetchposts()
                   }
        }
    }
}


    struct Images: View {
        @ObservedObject var contentImage = ContentImage()
        var body: some View {
                    ForEach(contentImage.posts) {post in
                        PostCardImage(model: post)
                        
            }
        }
    }



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            
    }
}

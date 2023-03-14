//
//  Home.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct Home: View {
    
    @ObservedObject var contentImage = ContentImage()
    
    
    
    @State var selectedTab = 0
    var body: some View {
       
        
        NavigationView{
               ScrollView {
                    Picker("", selection: $selectedTab) {
                                    Text("Imagen").tag(0)
                                    Text("Video").tag(1)
                                    Text("Podcast").tag(2)
                                }.padding()
                                 .pickerStyle(SegmentedPickerStyle())
                                 

                                switch(selectedTab) {
                                    case 0: Images()
                                    case 1: videosContent()
                                    case 2: Images()
                                     
                                
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


struct videosContent: View{
    @State var player = AVPlayer(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FCopia%20de%20CHAGRA%201.mp4?alt=media&token=fc041a3d-8c5b-4fcc-86ad-954b4df28ee1")!) // 1
    var body: some View {
            NavigationLink(destination: VideoPlayer(player: player)
                .frame(width: 400, height: 700, alignment: .center), label: { Text("OpenVideo");  }
    
            )
        .ignoresSafeArea()
        .onAppear() {
            player.play()
        }
    }
        
}

struct Images: View {
    @ObservedObject var contentImage = ContentImage()
    var body: some View {
        LazyVStack{
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                ForEach(contentImage.posts) { post in
                    NavigationLink(destination: PostCardImageDetailView(model: post) , label: {
                        PostCardImage(model: post) } )
                    
                }
            }
        }
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            
    }
}

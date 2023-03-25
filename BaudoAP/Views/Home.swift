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
    
    @ObservedObject var contentImage = ContentViewModel()
    @ObservedObject var contentVideo = ContentViewModelVideo()
    @ObservedObject var contentPodcast = ContentViewModelPodcast()
    
    
    @State var selectedTab = 0
    var body: some View {
       
        
        NavigationView{
               ScrollView {
                    Picker("", selection: $selectedTab) {
                                    Text("Imagen").tag(0)
                                    Text("Video").tag(1)
                                    Text("Podcast").tag(2)
                    }
                    .padding()
                                 .pickerStyle(SegmentedPickerStyle())
                                 

                                switch(selectedTab) {
                                    case 0: Images()
                                    case 1: Videos()
                                    case 2: Podcasts()
                                     
                                
                                default:
                                    Images()
                                }

                }
               .refreshable {
                   contentImage.fetchposts()
                   contentVideo.fetchpostsVideos()
                   }
        }
    }
}


struct Images: View {
    @ObservedObject var contentImage = ContentViewModel()
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

struct Videos: View {
    @ObservedObject var contentVideo = ContentViewModelVideo()
    let Columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            LazyVGrid(columns: Columns, spacing: 10){
                ForEach(contentVideo.postsVideos) { post in
                    NavigationLink(destination: PostCardVideoDetailView(model: post, isPresentedVideo: .constant(false)), label: {
                        PostCardVideo(model: post) } )
                }
            }
        }.padding(.horizontal,20)
    }
}

struct Podcasts: View {
    @ObservedObject var contentPodcast = ContentViewModelPodcast()

    var body: some View {
        ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in

                ForEach(contentPodcast.postsPodcast) { post in
                    NavigationLink(destination:
                                    PostCardPodcastDetail(model: post) , label: {
                        PostCardPodcast(model: post) } )
                }

        }
    }
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            
    }
}

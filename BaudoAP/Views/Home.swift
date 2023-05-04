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
    
    @ObservedObject var contentImage = ContentViewModelImage()
    @ObservedObject var contentVideo = ContentViewModelVideo()
    @ObservedObject var contentPodcast = ContentViewModelPodcast()
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    @State var selectedTab = 0
    var body: some View {
        
                VStack {
                    HStack{
                        Picker("", selection: $selectedTab) {
                            Text("Imagen").tag(0)
                            Text("Video").tag(1)
                            Text("Podcast").tag(2)
                        }
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 25,height: 25, alignment: .trailing)
                    }
                    
                    
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color("PickerBackground"))
//                    .cornerRadius(10)
                    .padding(.horizontal,10)
//                    .padding(.top,5)
                    
                    
                    switch(selectedTab) {
                    case 0: Images()
                    case 1: Videos()
                    case 2: Podcasts()
                        
                        
                    default:
                        Images()
                    }
                    
                    
                    
            
        }.onAppear(){
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.accentColor)
            let font = UIFont(name: "SofiaSans-Medium", size: 15.0)!          // Compute the right size
            UISegmentedControl.appearance().setTitleTextAttributes([.font: font], for: .normal)
            //            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
            //            //UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        }
        .refreshable {
            //                contentImage.fetchpostsImages()
            print("REFRESHED nothing fetched")
        }
    }
    
    
    struct Images: View {
        @ObservedObject var contentImage = ContentViewModelImage()
        var body: some View {
            ScrollView{
//                LazyVStack{
                    ForEach(contentImage.postsImages) { post in
                        NavigationLink(destination: PostCardImageDetailView(model: post) , label: {
                            PostCardImage(model: post) } )
                    }
//                }
            }.padding(.top,5)
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
            
                ScrollView{
//                    ForEach(0 ..< 2) { item in
                        LazyVGrid(columns: Columns, spacing: 15){
                            ForEach(contentVideo.postsVideos) { post in
                                NavigationLink(destination: PostCardVideoDetailView(model: post), label: {
                                    PostCardVideo(model: post) } )
                            }
                        }.padding(.horizontal,15)
//                    }
                }
                .padding(.top,5)
//                .padding(.bottom,50)
//               .border(Color.red, width: 3)
            
        }
    }
    
    struct Podcasts: View {
        @ObservedObject var contentPodcast = ContentViewModelPodcast()
        
        var body: some View {
            //ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            ScrollView{
                LazyVStack{
                    ForEach(contentPodcast.postsPodcast) { post in
                        NavigationLink(destination:
                                PostCardPodcastDetail(model: post), label: {
                            PostCardPodcast(model: post) } )
                    }
                }
                .padding(.horizontal,15)
            }
            .padding(.top,5)
        }
    }
    
} // FIN STRUCT




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        
        Home()
//            .previewDisplayName("Light")
       
    }
}

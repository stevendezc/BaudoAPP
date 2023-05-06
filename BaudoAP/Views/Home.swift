//
//  Home.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct ModalColorView: UIViewRepresentable {
    
    let color: UIColor
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = color
        }
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct ModalColorViewModifier: ViewModifier {
    
    let color: UIColor
    
    func body(content: Content) -> some View {
        content
            .background(ModalColorView(color: color))
    }
}

extension View {
    /// Set transparent or custom color for a modal background (.screen, .fullScreenCover)
    func modalColor(_ color: UIColor = .clear) -> some View {
        self.modifier(ModalColorViewModifier(color: color))
    }
}

// NEW finish


struct Home: View {
    
    @ObservedObject var contentImage = ContentViewModelImage()
    @ObservedObject var contentVideo = ContentViewModelVideo()
    @ObservedObject var contentPodcast = ContentViewModelPodcast()
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    @State private var isPresentedInfo = false
    
    @State var selectedTab = 0
    var body: some View {
        
        VStack {
            HStack{
                Picker("", selection: $selectedTab) {
                    Text("Imagen").tag(0)
                    Text("Video").tag(1)
                    Text("Podcast").tag(2)
                }
                
                Button{
                    isPresentedInfo.toggle()
                } label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 25,height: 25, alignment: .trailing)
                }
                
                
                
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
        .sheet(isPresented: $isPresentedInfo) {
            InfoView()
                .presentationDetents([.fraction(0.5)])
                .modalColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.9))
        }
    }
    
    
    struct InfoView: View {
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            
            VStack {
                
                
            
                HStack{
                    Text("Navega por contenidos exclusivos creados y ajustados a tu perfil e intereses junto a BaudoAP. Revisa tus reacciones y tipo de contenidos que más visitas y compartes. ")
                        
                        .font(.custom("SofiaSans-Medium",size: 18,relativeTo: .title2))
                        .padding(.bottom,20)
                    
                        .overlay(Rectangle().frame(maxWidth: .infinity,maxHeight: 1, alignment: .bottom).foregroundColor(Color("AccentColor")), alignment: .bottom)
                    
                    
                }
                .padding(.horizontal,40)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 40,height: 40, alignment: .trailing)
                        .foregroundColor(Color("Buttons"))
                }.padding(.top, 30)
                
                
            }
             
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

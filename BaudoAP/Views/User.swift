//
//  User.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import SwiftUI
import Firebase
import AVKit

struct User: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) var colorScheme
    @Binding var userIsLogged : Bool
    
    @State private var lastPost: Post?
    
    @Binding var UserName: String
    
    @ObservedObject var contentImage = ContentViewModelImage()
    //    @ObservedObject var contentVideo = ContentViewModelVideo()
    //    @ObservedObject var contentPodcast = ContentViewModelPodcast()
    
    var body: some View{
        
        ScrollView{
            
            //            let URLS: String = "https://baudoap.com/wp-content/uploads/2023/04/4.-Teka-s.mp4"
            //
            //              let player = AVPlayer(url: URL(string: URLS)!)
            //            VideoPlayer(player: player)
            //                .aspectRatio(9/16, contentMode: .fit)
            //                .onAppear(){
            //                    player.play()
            //                    print("onAppear")
            //                }.onDisappear(){
            //                    player.pause()
            //                    print("onDisappear")
            //                }
            //
            
            HStack{
                
                
                Image(systemName: "person.circle")
                    .resizable()
                //                            .border(Color.accentColor, width: 4)
                    .frame(width: 70,height: 70,alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .foregroundColor(Color("Buttons"))
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color("Buttons"), lineWidth: 1)
                    )
                
                
                //                  .border(Color.red, width: 3)
                
                
                //                \(UserName)
                Text("Hola,\n Steven Hernandez")
                    .font(.custom("SofiaSans-Bold",size: 18,relativeTo: .title3))
                
                Spacer()
                
                
                VStack{
                    NavigationLink(destination: Settings(userIsLogged: $userIsLogged, UserName: .constant("None"))) {
                        
                        
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 30,height: 30, alignment: .trailing)
                    }
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 30,height: 30, alignment: .trailing)
                }
                
                
            }
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(Color("Buttons")), alignment: .bottom)
            
            HStack{
                Text("Lo que te interesa")
                    .font(.custom("SofiaSans-Bold",size: 25,relativeTo: .title))
                Spacer()
            }.padding()
            
            
            Image("Metrics")
            Spacer()
            Text("Lo Ultimo en fotografias").font(.custom("SofiaSans-Bold",size: 20,relativeTo: .title))
            ScrollView(.horizontal){
                HStack{
                    
                    ForEach(contentImage.postsImages) { post in
                        NavigationLink(destination: PostCardImageDetailView(model: post) , label: {
                            PostCardImage(model: post)
                                .frame(width: 300)
                        } )
                    }
                }
            }
            
        }
        
    }
    
}

struct User_Previews: PreviewProvider {
    static var previews: some View {
        User(userIsLogged: .constant(false), UserName: .constant("None"))
    }
}

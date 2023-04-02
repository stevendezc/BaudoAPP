//
//  User.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import SwiftUI
import Firebase

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
            HStack{
                Image(systemName: "person.circle")
                    .resizable()
                //                            .border(Color.accentColor, width: 4)
                    .frame(width: 100,height: 100,alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .foregroundColor(Color("Buttons"))
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color("Buttons"), lineWidth: 1)
                    )
                
                
                //                  .border(Color.red, width: 3)
                
                
                
                Text("Hola,\n\(UserName)").font(.custom("SofiaSans-Bold",size: 18,relativeTo: .title3))
                
                Spacer()
                
                NavigationLink(destination: Settings(userIsLogged: .constant(false), UserName: .constant("None"))) {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30,height: 30, alignment: .trailing)
                }
            }
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(Color("Buttons")), alignment: .bottom)
            
            Image("Metricas")
            
            VStack{
                Text("Lo Ultimo en fotografias").font(.custom("SofiaSans-Bold",size: 20,relativeTo: .title))
                ForEach(contentImage.postsImages) { post in
                    NavigationLink(destination: PostCardImageDetailView(model: post, isPresentedImage1: .constant(false)) , label: {
                        PostCardImage(model: post) } )
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

//
//  PostCardVideoDetailView.swift
//  BaudoAP
//
//  Created by Codez on 22/03/23.
//

import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct PostCardVideoDetailView: View {
    
    @ObservedObject var contentVideo = ContentViewModelVideo()
    
    var model: Post
    @Binding var isPresentedVideo: Bool
    
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading){
                let player = AVPlayer(url:  URL(string:model.MainMediaUrl)!)
                
                VideoPlayer(player: player).frame(width:UIScreen.main.bounds.width,
                                                  height:UIScreen.main.bounds.height).onAppear() {
                    player.play()
                }
                
                Button("X"){
                    
                    isPresentedVideo = false
                    player.pause()
                }
                .padding(.horizontal,10)
                .padding(.vertical,4)
                .foregroundColor(.white)
                .background(Color.yellow)
                .cornerRadius(30)
                .font(.system(size: 25))
                .padding(40)
                
                //  .border(Color.red, width: 3)
                //  .aspectRatio(contentMode: .fill)
                
                
            }
            
            VStack(alignment: .leading,spacing: 5){
                                HStack{
                                    Spacer()
                                }
                
                Text(model.Location).font(.custom("SofiaSans-Bold",size: 22,relativeTo: .title3))
                Text(model.Description)
                    .font(.custom("SofiaSans-Regular",size: 15,relativeTo: .body))
                    .multilineTextAlignment(.leading)
                Text("Author: \(model.Author)")
                    .padding(.top,3)
                    .font(.custom("SofiaSans-Bold",size: 13,relativeTo: .caption))
                
                Image("Lines")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                
                Spacer()
                Spacer()
                
                Text("Comentarios").font(.custom("SofiaSans-Bold",size: 24,relativeTo: .title))
                VStack(alignment: .leading){
                    HStack{
                        Spacer()
                    }
                    VStack(alignment: .leading){

                        ForEach(contentVideo.comments){ comment in
                            HStack{
                                Image("Mambo")
                                    .resizable()
                                //                            .border(Color.accentColor, width: 4)
                                    .frame(width: 40,height: 40,alignment: .center)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .padding(2)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color("Buttons"), lineWidth: 1)
                                    )
                                Text(comment.commentText)
                        }

                        }
                        .padding(10)
                        .background(Color("BackgroundCardsPodcast").opacity(0.5))
                        .cornerRadius(20)

                    }

                }.padding(20)
                .background(Color("BackgroundCards").opacity(0.5))
                .foregroundColor(Color("Text"))
                .cornerRadius(20)
                
                
               
            }
            //.border(Color.red, width: 3)
            .padding(.horizontal,20)
        }

        
                   
    }
    
}

struct PostCardVideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardVideo(model: Post(Thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FScreenshot%202023-03-23%20at%2011.33.20%20PM.png?alt=media&token=3e857497-6146-46c5-889d-fa55a44abc05",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FCopia%20de%20CHAGRA%201.mp4?alt=media&token=fc041a3d-8c5b-4fcc-86ad-954b4df28ee1", Typo: "Video", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title Video Prueba",CreationDate: "23/Marzo/2023"))
    }
}

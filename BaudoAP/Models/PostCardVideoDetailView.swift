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
            Text(model.Location)
            Text(model.Description)
            Text("Foto por: \(model.Author)")
        }

        
                   
    }
    
}

struct PostCardVideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardVideo(model: Post(id: "10",Thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FScreenshot%202023-03-23%20at%2011.33.20%20PM.png?alt=media&token=3e857497-6146-46c5-889d-fa55a44abc05",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FCopia%20de%20CHAGRA%201.mp4?alt=media&token=fc041a3d-8c5b-4fcc-86ad-954b4df28ee1", Typo: "Video", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title Video Prueba",CreationDate: "23/Marzo/2023"))
    }
}

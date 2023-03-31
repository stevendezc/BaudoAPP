//
//  PostCardVideo.swift
//  BaudoAP
//
//  Created by Codez on 20/03/23.
//


import SwiftUI
import SDWebImageSwiftUI

struct PostCardVideo: View {
    
    var model: Post
    
    @State var isPresentedVideo: Bool = false
    
    var body: some View {
        VStack{
            Button {
                isPresentedVideo = true
            } label: {
                VStack(alignment: .leading, spacing: 15){
                    WebImage(url: URL(string: model.Thumbnail))
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(contentMode: .fit)
        //                .border(Color.red, width: 3)
                        
                }
            }
            
            
            
    //        .padding(.leading,40).padding(.trailing,40).padding(.bottom,30)
            
        }.fullScreenCover (isPresented: $isPresentedVideo,
                           onDismiss: { isPresentedVideo = false },
                           content: { PostCardVideoDetailView(model: model, isPresentedVideo: $isPresentedVideo).ignoresSafeArea()})

    }
        
}

struct PostCardVideo_Previews: PreviewProvider {
    static var previews: some View {
        PostCardVideo(model: Post(Thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FScreenshot%202023-03-23%20at%2011.33.20%20PM.png?alt=media&token=3e857497-6146-46c5-889d-fa55a44abc05",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Videos%2FCopia%20de%20CHAGRA%201.mp4?alt=media&token=fc041a3d-8c5b-4fcc-86ad-954b4df28ee1", Typo: "Video", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title Video Prueba",CreationDate: "23/Marzo/2023"))
    }
}

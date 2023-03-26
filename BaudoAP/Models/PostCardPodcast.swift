//
//  PostCardPodcast.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardPodcast: View {
    
    var model: Post
    @State var isPresentedPodcast: Bool = false
    
    var body: some View {
        Button {
            isPresentedPodcast = true
        } label: {
            HStack{
                WebImage(url: URL(string: model.Thumbnail))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:130)
                //                .border(Color.red, width: 3)
                
                VStack(alignment: .leading,spacing: 5) {
                    Text(model.Title).font(.title3)
                    Text(model.CreationDate).font(.callout)
                    
                    Text(model.Description).font(.caption)
                }.foregroundColor(Color("Text"))
                
            }.fullScreenCover (isPresented: $isPresentedPodcast,
                               onDismiss: { isPresentedPodcast = false },
                               content: { PostCardPodcastDetail(model: model, isPresentedPodcast: $isPresentedPodcast).ignoresSafeArea()})
            .padding(15)
            .background(Color("BackgroundCards"))
            .cornerRadius(20)
        }
    }
}

struct PostCardPodcast_Previews: PreviewProvider {
    static var previews: some View {
        
        PostCardPodcast(model: Post(id: "10",Thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Podcasts%2FRecurso%2027%402x-8%201.png?alt=media&token=ef46631c-aaee-42fb-8b3d-5213653fe7ba",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Podcasts%2FIr-y-venir-Los-rastros-del-cambi.mp3?alt=media&token=03f8aad6-6354-4e11-b9b7-9a33c4b8485a", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de Podcast para pruebas en el postCardPodcast y para solo visualizar como se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Los rastros del cambio climatico",CreationDate: "23/Marzo/2023"))
        
    }
}




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
                AsyncImage(url: URL(string: model.Thumbnail), scale: 1)
                    //.resizable()
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
        
        PostCardPodcast(model: Post(Thumbnail: "https://baudoap.com/wp-content/uploads/2023/01/GUERRILLERO-IMPASIBLE.jpg",Thumbnail2:  "https://baudoap.com/wp-content/uploads/2023/01/GUERRILLERO-IMPASIBLE.jpg", Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://baudoap.com/wp-content/uploads/2022/12/Audio-3.mp3", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de Podcast para pruebas en el postCardPodcast y para solo visualizar como se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Los rastros del cambio climatico",CreationDate: "23/Marzo/2023"))
        
    }
}




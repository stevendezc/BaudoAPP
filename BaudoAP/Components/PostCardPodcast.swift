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
    
    var body: some View {
       
            HStack{
                WebImage(url: URL(string: model.thumbnail))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:130)
                //                .border(Color.red, width: 3)
                
                VStack(alignment: .leading,spacing: 5) {
                    Text(model.title).font(.title3).multilineTextAlignment(.leading)
                    Text(model.creationDateString).font(.callout).multilineTextAlignment(.leading)
                    
                    Text(model.description).font(.caption).multilineTextAlignment(.leading)
                }.foregroundColor(Color("Text"))
                
            }
            .padding(15)
            .background(Color("BackgroundCards"))
            .cornerRadius(20)
        
    }
}

struct PostCardPodcast_Previews: PreviewProvider {
    static var previews: some View {
        
        PostCardPodcast(model: Post(thumbnail: "https://baudoap.com/wp-content/uploads/2023/01/GUERRILLERO-IMPASIBLE.jpg",thumbnail2:  "https://baudoap.com/wp-content/uploads/2023/01/GUERRILLERO-IMPASIBLE.jpg", author: "BaudoAP", location: "Triguba,Choco", main_media: "https://baudoap.com/wp-content/uploads/2022/12/Audio-3.mp3", type: "Imagen", description: "Esta es una breve descripcion de contenido de Podcast para pruebas en el postCardPodcast y para solo visualizar como se veria el texto en las cartas del home", category: "Medio Ambiente",title: "Los rastros del cambio climatico",creation_date: Date()))
        
    }
}




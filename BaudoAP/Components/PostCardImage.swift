//
//  SwiftUIView.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardImage: View {
    
    var model: Post
    
    @State var isPresentedImage1: Bool = false
    
    var body: some View {
      
            VStack(alignment: .leading){
                WebImage(url: URL(string: model.Thumbnail))
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(19)
                
                //                .border(Color.red, width: 3)
                
                //WebImage(url: URL(string: model.MainMediaUrl))

//                HStack(alignment: .center){
//                    Spacer()
//                    Image("Reactions")
//                        .padding(.vertical,-40)
//                    Spacer()
//                }
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Spacer()
                    }
                    Text(model.Location)
                        .font(.custom("SofiaSans-Bold",size: 18,relativeTo: .title))
                    Text(model.Description)
                        .font(.custom(
                            "SofiaSans-Regular",
                            size: 13,
                            relativeTo: .body))
                        .lineLimit(3)
                    Text("Foto por: \(model.Author)")
                        .font(.caption)
                        .font(.custom(
                            "SofiaSans-Medium",
                            size: 12,
                            relativeTo: .caption))
                        .padding(.bottom,10)
                }.padding(EdgeInsets(top: -10, leading: 20, bottom: 10, trailing: 20))
 
            }
            .background(Color("BackgroundCards"))
            .cornerRadius(19)
            .multilineTextAlignment(.leading)
            .foregroundColor(Color("Text"))
            .padding(.leading,20).padding(.trailing,20).padding(.bottom,20)
    }
}

struct PostCardImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImage(model: Post(Thumbnail:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FFoto5-50.jpg?alt=media&token=d045af3c-eb19-41fa-bd87-26053298f427",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Author: "BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FFoto5-50.jpg?alt=media&token=d045af3c-eb19-41fa-bd87-26053298f427", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title",CreationDate: "23/Marzo/2023"))
    }
}

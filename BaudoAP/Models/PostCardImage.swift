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
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            WebImage(url: URL(string: model.Url))
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(contentMode: .fit)
            
//                .border(Color.red, width: 3)
                .cornerRadius(19)
            Text(model.Lugar)
                .font(.custom(
                        "SofiaSans",
                        size: 18,
                        relativeTo: .title))
                .font(.title3)
                .bold()
                .padding(.top,0)
                .padding(.leading, 10)
            Text(model.Descripcion)
                .padding(.top,-5)
                .padding(.leading, 10)
                .font(.custom(
                        "SofiaSans",
                        size: 11,
                        relativeTo: .body))
                .lineLimit(3)
            Text(model.Autor).padding(.top,-5).padding(.leading, 10).font(.caption)
                .padding(10)
        }
        .background(.gray)
         .cornerRadius(19)
        .multilineTextAlignment(.leading)
        .foregroundColor(Color("Text"))
        .padding(.leading,40).padding(.trailing,40).padding(.bottom,30)
    }
}

struct PostCardImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImage(model: Post(id: "10",Thumb: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Autor: "Foto por: BaudoAP", Lugar: "Triguba,Choco", Url: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Tipo: "Imagen", Descripcion: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Categoria: "Medio Ambiente"))
    }
}

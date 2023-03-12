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
        
        VStack(alignment: .leading){
                WebImage(url: URL(string: model.Url))
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(contentMode: .fit)
                
    //                .border(Color.red, width: 3)
                    .cornerRadius(30)
                Text(model.Lugar).font(.title3).bold().padding(.leading, 10).foregroundColor(Color("Text"))
            Text(model.Descripcion).padding(.top,-10).padding(.leading, 10).font(.callout).lineLimit(2)
            Text(model.Autor).padding(.top,-10).padding(.leading, 10).font(.caption).padding(.top)
            }
    
        .padding(.leading,40).padding(.trailing,40).padding(.bottom,30)
    }
}

struct PostCardImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImage(model: Post(id: "10",Autor: "BaudoAP", Lugar: "Triguba,Choco", Url: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Tipo: "Imagen", Descripcion: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Categoria: "Medio Ambiente"))
    }
}

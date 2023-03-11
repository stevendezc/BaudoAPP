//
//  SwiftUIView.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase 

struct PostCard: View {
    
    var model: Post
    
    var body: some View {
        VStack (alignment: .leading){
            WebImage(url:URL(string: model.Url))
                .resizable()
                .aspectRatio(contentMode: .fill)
                //.border(Color.red, width: 3)
                .frame(maxWidth: .infinity, maxHeight: 300)
                .cornerRadius(30.0)
            Text(model.Name).font(.title).bold().padding(.leading, 10).foregroundColor(Color("Text"))
            Text(model.Descripcion).padding(.top,-10).padding(.leading, 10).font(.system(size:12))
            Text(model.Info).padding(.top,-10).padding(.leading, 10)
        }
        .padding(20)
        .foregroundColor(.yellow)
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard(model: Post(id: "10", Name: "Tribuga", Url: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Tipo: "Imagen", Info: "Esto es algo de info", Descripcion: "Esta es una breve descripcion de contenido de imagen", Categoria: "Medio Ambiente"))
    }
}

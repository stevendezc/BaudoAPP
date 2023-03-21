//
//  PostImageDetailViewImage.swift
//  BaudoAP
//
//  Created by Codez on 12/03/23.
//


import SwiftUI
import SDWebImageSwiftUI

struct PostCardImageDetailViewImage: View {
    
    var model: Post
    @Binding var isPresented: Bool
    
    var body: some View {

        ZStack(alignment: .topLeading){
                    
                    ScrollView(.horizontal){
                    WebImage(url: URL(string: model.Url))
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                    //                .border(Color.red, width: 3)
                        
                    }
                   
                    Button("X"){
                        isPresented = false
                    }
                    .padding(10)
                        .foregroundColor(.white)
                        .background(Color.yellow)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                        .padding(40)
                        
                   
                        
            }
        
        }
}

struct PostCardImageDetailViewImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImageDetailViewImage(model: Post(id: "10",Thumb: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1", Autor: "BaudoAP", Lugar: "Triguba,Choco", Url: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Tipo: "Imagen", Descripcion: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Categoria: "Medio Ambiente"), isPresented: .constant(false))
    }
}

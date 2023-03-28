//
//  PostCardImageDetailView.swift
//  BaudoAP
//
//  Created by Codez on 12/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardImageDetailView: View {
    @ObservedObject var contentImage = ContentViewModelImage()
    var model: Post
    
    @State var isPresented: Bool = false
    
    @Binding var isPresentedImage1: Bool
    
    var body: some View {
        
        VStack(alignment: .leading){
//            NavigationLink(destination: PostCardImageDetailViewImage(model: model, $isPresented: false), label: {
//
//                 }
//            )
            
            ZStack(alignment: .topLeading){
                
                
                WebImage(url: URL(string: model.MainMediaUrl)).resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(0)
                
                Button("X"){
                    isPresentedImage1 = false
                }
                .padding(.horizontal,10)
                .padding(.vertical,4)
                .foregroundColor(.white)
                .background(Color.yellow)
                .cornerRadius(30)
                .font(.system(size: 25))
                .padding(40)
                
               
                
                
                
            }
            Button {
                isPresented = true
            } label: {
                Image("Expand").resizable().frame(width: 25,height: 25)
                    
            }
            .foregroundColor(Color("Buttons"))
            
            .padding(.top,-60)
            .padding(.leading,20)
                
            Text(model.Location).font(.title3).bold().padding(.leading, 10)
            Text(model.Description).padding(.top,-10).padding(.leading, 10).font(.callout).lineLimit(2)
            Text(model.Author).padding(.top,-10).padding(.leading, 10).font(.caption).padding(.top)
            Spacer()
            }.ignoresSafeArea()
        
        .fullScreenCover(isPresented: $isPresented, onDismiss: {isPresented = false}, content: { PostCardImageDetailViewImage(model: model, isPresented: $isPresented).ignoresSafeArea()})
        .foregroundColor(Color("Text"))
    
        .padding(.horizontal,0)
        
    }
}

struct PostCardImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImageDetailView(model: Post(id: "13",Thumbnail:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Author: "Foto por: BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title",CreationDate: "23/Marzo/2023"), isPresentedImage1: .constant(true))
    }
}

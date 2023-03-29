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
    
    @State var Comment = ""
    
    @State var isPresented: Bool = false
    
    @Binding var isPresentedImage1: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button("←"){
                    isPresentedImage1 = false
                }
                .padding(.horizontal,5)
                .padding(.vertical,1)
                .foregroundColor(Color("Yellow"))
                .background(Color.black)
                .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("Buttons"),
                        lineWidth: 1))
                .cornerRadius(30)
                .font(.system(size: 30))
                .padding(.leading,10)
                
                Spacer()
            }.padding(.top,50)
            
            
            ScrollView{
                VStack(alignment: .leading){
                    //            NavigationLink(destination: PostCardImageDetailViewImage(model: model, $isPresented: false), label: {
                    //
                    //                 }
                    //            )
                    
                    VStack(alignment: .leading){
                        
                        
                        
                        WebImage(url: URL(string: model.MainMediaUrl)).resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(19)
                    }
                    
                    Button {
                        isPresented = true
                    } label: {
                        Image("Expand").resizable().frame(width: 25,height: 25)
                        
                    }
                    .foregroundColor(Color("Buttons"))
                    .padding(.top,-50)
                    .padding(.leading,17)
                    
                    VStack(alignment: .leading,spacing: 5){
                        //                HStack{
                        //                    Spacer()
                        //                }
                        HStack(alignment: .center){
                            Spacer()
                            Image("Reactions")
                                .padding(.top,-10)
                            Spacer()
                        }
                        Text(model.Location).font(.custom("SofiaSans-Bold",size: 22,relativeTo: .title3))
                        Text(model.Description).font(.custom("SofiaSans-Regular",size: 15,
                                                             relativeTo: .body))
                        Text(model.Author)
                            .padding(.top,3)
                            .font(.custom("SofiaSans-Bold",size: 13,relativeTo: .caption))
                        
                        Image("Lines")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        Spacer()
                        Spacer()
                        
                        Text("Comentarios").font(.custom("SofiaSans-Bold",size: 24,relativeTo: .title))
                        VStack(alignment: .leading){
                            HStack{
                                Spacer()
                            }
                            Text("Hola Mundo")
                            Text("Hola Mundo")
                            Text("Hola Mundo")
                            Text("Hola Mundo")
                            Text("Hola Mundo")
                            Text("Hola Mundo")
                            
                        }.padding(20)
                        .background(Color("BackgroundCards"))
                        .foregroundColor(Color("Text"))
                        .cornerRadius(20)
                        
                        
                        Spacer()
                    }
                    //.border(Color.red, width: 3)
                    .padding(.horizontal,30)
                }
                
                .padding(5)
                
                //.ignoresSafeArea()
                
                .fullScreenCover(isPresented: $isPresented, onDismiss: {isPresented = false}, content: { PostCardImageDetailViewImage(model: model, isPresented: $isPresented).ignoresSafeArea()})
                .foregroundColor(Color("Text"))
                .padding(.horizontal,0)
                
            }
            
           
            
            HStack{
                Image("Mambo")
                    .resizable()
//                            .border(Color.accentColor, width: 4)
                    .frame(width: 50,height: 50,alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding(2)
                    .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("Buttons"), lineWidth: 1)
                        )
                
                TextField(
                  "Agregar comentario",
                  text: self.$Comment
                  
                )
                .foregroundColor(Color("Text"))
                .padding()
                .background(Color("BackgroundCards"))
                .cornerRadius(19)
                Button{
                    print($Comment)
                } label: {
                    Text("Enviar")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(5)
            Spacer()
            Spacer()
        }
        
       
    }
    
}

struct PostCardImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImageDetailView(model: Post(id: "13",Thumbnail:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Author: "Foto por: BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title",CreationDate: "23/Marzo/2023"), isPresentedImage1: .constant(true))
    }
}


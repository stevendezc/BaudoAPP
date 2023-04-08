//
//  PostCardImageDetailView.swift
//  BaudoAP
//
//  Created by Codez on 12/03/23.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct PostCardImageDetailView: View {
    @ObservedObject var contentImage = ContentViewModelImage()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var model: Post
    
    @State var isPresented: Bool = false
    
    
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                //            NavigationLink(destination: PostCardImageDetailViewImage(model: model, $isPresented: false), label: {
                //
                //                 }
                //            )
                
                VStack(alignment: .leading){
                    
                    WebImage(url: URL(string: model.thumbnail)).resizable().placeholder{ ProgressView() }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(19)
                }.padding(.top,90)
                
                Button {
                    isPresented = true
                } label: {
                    Image("Expand").resizable().frame(width: 25,height: 25)
                    
                }
                .foregroundColor(Color("Buttons"))
                .padding(.top,-50)
                .padding(.leading,17)
                
                
                HStack(alignment: .center){
                    Spacer()
                    Image("Reactions")
                        .padding(.top,-10)
                    Spacer()
                }
                
                VStack(alignment: .leading,spacing: 5){
                    Text(model.location).font(.custom("SofiaSans-Bold",size: 22,relativeTo: .title3))
                    Text(model.description).font(.custom("SofiaSans-Regular",size: 15,
                                                         relativeTo: .body))
                    Text(model.author)
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
                        VStack(alignment: .leading){
                            
                            ForEach(contentImage.comments){ comment in
                                
                                HStack{
                                    Image(systemName: "person.circle")
                                        .resizable()
                                    //                            .border(Color.accentColor, width: 4)
                                        .frame(width: 40,height: 40,alignment: .center)
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .padding(2)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color("Buttons"), lineWidth: 1)
                                        )
                                    VStack(alignment: .leading){
                                        Text(comment.userId).multilineTextAlignment(.leading)
                                        Text(comment.commentText).multilineTextAlignment(.leading)
                                    }
                                    .padding(10)
                                    .background(Color("BackgroundCardsPodcast").opacity(0.5))
                                    .cornerRadius(20)
                                }
                            }
                            .padding(10)
                        }
                    }.padding(20)
                        .background(Color("BackgroundCards").opacity(0.5))
                        .foregroundColor(Color("Text"))
                        .cornerRadius(20)
                }
                //.border(Color.red, width: 3)
                .padding(.horizontal,20)
            }
            
            .padding(5)
            
            //.ignoresSafeArea()
            
            .fullScreenCover(isPresented: $isPresented, onDismiss: {isPresented = false}, content: { PostCardImageDetailViewImage(model: model, isPresented: $isPresented).ignoresSafeArea()})
            .foregroundColor(Color("Text"))
            .padding(.horizontal,0)
            
        }.navigationBarBackButtonHidden(true)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("←")
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
                }).padding(.top,10) ,alignment: .topLeading
            )
        
        
        HStack{
            Image(systemName: "person.circle")
                .resizable()
            //                            .border(Color.accentColor, width: 4)
                .frame(width: 40,height: 40,alignment: .center)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("Buttons"), lineWidth: 1)
                )
            
            TextField(
                "Agregar comentario",
                text: $contentImage.commentText
            )
            .foregroundColor(Color("Text"))
            .padding(10)
            .background(Color("BackgroundCards"))
            .cornerRadius(19)
            Button{
                contentImage.pushComment(postId: model.id ?? "")
                
                print("Pusshed Comment YEYYYY",model.id ?? "")
            } label: {
                Text("Enviar")
            }
            .buttonStyle(.borderedProminent)
        }
        .onAppear(){
            contentImage.fetchNewComments(postId: model.id ?? "")
        }
        .onDisappear(){
            contentImage.stopListener()
        }
        
        .padding(5)
        Spacer()
        Spacer()
    }
}

struct PostCardImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostCardImageDetailView( model: Post(id: "13",thumbnail:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FComic.png?alt=media&token=ad334fda-d0f6-4806-9adf-98a595803117",thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",author: "Foto por: BaudoAP", location: "Triguba,Choco", main_media: "https://firebasestorage.googleapis.com/v0/b/baudoapswift.appspot.com/o/Pic2-50.jpg?alt=media&token=7ec8709e-9dc6-4ce3-af94-566d48251d60", type: "Imagen", description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", category: "Medio Ambiente",title: "title",creation_date: Date()))
        }
        
    }
}


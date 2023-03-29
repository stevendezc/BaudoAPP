//
//  Navegantes.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI

struct Navegantes: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                //FIRST CARD
                Spacer(minLength: 30)
                ZStack{
                    Image("Nav1")
                        .resizable()
                
//                        .aspectRatio( contentMode: .fill)
//                        .frame(width: .infinity, height: .infinity, alignment: .center)
                    VStack(alignment: .leading){
                        Text("Navega con fuerza").font(.custom("SofiaSans-Black",size: 25,relativeTo: .title))
                        Text("$50.000 o 20USD").font(.custom("SofiaSans-Bold",size: 15,relativeTo: .title2))
                        Text("● Recibes los beneficios de Navegantes.").font(.custom("SofiaSans-Medium",size: 15,relativeTo: .body))
                        Text("● No incluye la pieza editorial").font(.custom("SofiaSans-Medium",size: 15,relativeTo: .body))
                        Text("● Recibes los beneficios de Navegantes.").font(.custom("SofiaSans-Medium",size: 15,relativeTo: .body))
                        
                        
                        Button {
                            openURL(URL(string: "https://checkout.wompi.co/l/namKJh")!)
                        } label: {
                            Text("APORTAR").font(.custom("SofiaSans-Bold",size: 13,relativeTo: .body))
                        }
                        
                        .padding(12)
                        .background(Color("Buttons"))
                        .cornerRadius(10)
//                        .overlay( /// apply a rounded border
//                            RoundedRectangle(cornerRadius: 10).stroke(Color("Buttons"), lineWidth: 2)
//                        )
                    }.padding(20)
                    
                }
                /// apply a rounded border
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("Buttons"), lineWidth: 1))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,10)
                
                
                //SECOND CARD
                ZStack{
                    Image("Nav20")
                        .resizable()
                    //                            .aspectRatio( contentMode: .fit)
                    //                            .frame(width:.infinity,height: .infinity, alignment: .center)
                    VStack(alignment: .leading){
                        Text("Navega con pasión").font(.custom("SofiaSans-Black",size: 25,relativeTo: .title))
                        Text("$100.000 o 40USD").font(.custom("SofiaSans-Bold",size: 15,relativeTo: .title2))
                        Text("● Recibes los beneficios de Navegantes.").font(.custom("SofiaSans-Medium",size: 15,relativeTo: .body))
                        Text("● Incluye la pieza editorial y envio").font(.custom("SofiaSans-Medium",size: 15,relativeTo: .body))
                        Text("● No incluye envío fuera de Colombia.").font(.custom("SofiaSans-Medium",size: 15,relativeTo: .body))
                        Text("● Aporte único para Fábrica de Aguas parte II.").font(.custom("SofiaSans-Medium",size: 15,relativeTo: .body))
                        
                        Button {
                            openURL(URL(string: "https://checkout.wompi.co/l/FOrjzm")!)
                            
                        } label: {
                            Text("APORTAR").font(.custom("SofiaSans-Bold",size: 13,relativeTo: .body))
                        }
                        .padding(12)
                        .background(Color("Buttons"))
                        .cornerRadius(10)
                    }.padding(20)
                    
                }
                /// apply a rounded border
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color("Buttons"), lineWidth: 1))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,10)
                
                
                //THIRD CARD
                ZStack{
                    Image("Nav3")
                        .resizable()
                    //                            .aspectRatio( contentMode: .fit)
                    //                            .frame(width:.infinity,height: .infinity, alignment: .center)
                    VStack(alignment: .leading){
                        Text("Navega a tu ritmo").font(.custom("SofiaSans-Black",size: 25,relativeTo: .title))
                        Text("$150.000 o 50USD").font(.custom("SofiaSans-Bold",size: 15,relativeTo: .title2))
                        Text("● Dona esta cantidad o más y recibirás los beneficios de Navegantes + Certificado de donación de nuestra fundación").font(.custom("SofiaSans-Medium",size: 15,relativeTo: .body))
                        
                        Button {
                            openURL(URL(string: "https://checkout.wompi.co/l/QtV02j")!)
                            
                        } label: {
                            Text("APORTAR")
                                .font(.custom("SofiaSans-Bold",size: 13,relativeTo: .body))
                                
                        }
                        
                        .padding(12)
                        .background(Color("Buttons"))
                        .cornerRadius(10)
                    }.padding(20)
                    
                }
                /// apply a rounded border
                .overlay(RoundedRectangle(cornerRadius: 29).stroke(Color("Buttons"), lineWidth: 1))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,10)
                

//                .foregroundColor(Color("Text"))
                
                
                
                
            }
            
            
        }
        //        .frame(width:.infinity, alignment: .leading)
        //        .border(Color.red, width: 3)
    }
}

struct Navegantes_Previews: PreviewProvider {
    static var previews: some View {
        Navegantes()
    }
}

//
//  Navegantes.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI

struct Navegantes: View {
    @Environment(\.openURL) var openURL
    
    @State private var navegaElRio: Bool = false
    @State private var navegaElRiachuelo: Bool = false
    @State private var navegaLaQuebrada: Bool = false
    @State private var navegaLibre: Bool = false
    @State private var monto: String = ""
    @State private var showWebView = false
    var body: some View {
        
        
        
        NavigationView{
            ScrollView{
                //FIRST CARD
                Group{
                    Spacer(minLength: 20)
                    
                    Image("Navegantes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    
                    Spacer(minLength: 30)
                    
                    ZStack{
                        Image("Nav1")
                            .resizable()
                            .cornerRadius(20)
                        
                        //                        .aspectRatio( contentMode: .fill)
                        //                        .frame(width: .infinity, height: .infinity, alignment: .center)
                        VStack(alignment: .leading){
                            HStack{
                                Spacer()
                            }
                            Text("Navega el río").font(.custom("SofiaSans-Medium",size: 25,relativeTo: .title))
                            HStack{
                                Button {
                                    openURL(URL(string: "https://checkout.wompi.co/l/namKJh")!)
                                } label: {
                                    HStack{
                                        Text("$30.000").font(.custom("SofiaSans-Bold",size: 12,relativeTo: .body)).foregroundColor(.black)
                                        VStack{
                                            Text("Pago mensual").font(.custom("SofiaSans-Medium",size: 9,relativeTo: .caption)).foregroundColor(.black)
                                            Text("12 pagos durante el año").font(.custom("SofiaSans-Light",size: 8,relativeTo: .caption2)).foregroundColor(.black)
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                                .background(Color("NavBlue"))
                                .cornerRadius(70)
                                
                                Button {
                                    openURL(URL(string: "https://checkout.wompi.co/l/namKJh")!)
                                } label: {
                                    HStack{
                                        Text("$320.000").font(.custom("SofiaSans-Bold",size: 12,relativeTo: .body)).foregroundColor(.black)
                                        VStack{
                                            Text("Pago mensual").font(.custom("SofiaSans-Medium",size: 9,relativeTo: .body)).foregroundColor(.black)
                                            Text("1 pago durante el año").font(.custom("SofiaSans-Light",size: 8,relativeTo: .body)).foregroundColor(.black)
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                                .background(Color("NavBlue"))
                                .cornerRadius(70)
                            }
                            
                            
                        }.padding(10)
                        
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Apoya nuestro trabajo y aparecerás en los créditos como financiador oficial de BaudoAp.")
                        .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                        .foregroundColor(Color("Text"))
                    
                    Button{
                        navegaElRio.toggle()
                    }label: {
                        Text("*Más información")
                            .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                            .foregroundColor(Color("Yellow"))
                            
                            
                    }
                    
                    if navegaElRio {
                        Text("*Recibe nuestro newsletter, una pieza digital de una ilustración baudoseña que podrás utilizar como fondo de pantalla para tu computador o dispositivo móvil  y participa de espacios exclusivos de nuestra agencia conversación interna con nuestro equipo de trabajo, charlas, consejos editoriales y otros\n\n*Cuando cumplas seis meses de pago o hagas el pago anual recibirás el 15% de descuento en cualquier artículo de nuestra tienda (aplica para un artículo).\n\n *Recibirás la serigrafía que más te guste de nuestra tienda.\n\n *Aplica términos y condiciones")
                            .padding(.top,5)
                            .padding(.horizontal,20)
                            .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                            .foregroundColor(Color("Text"))
                    }
                    
                    Spacer(minLength: 40)
                    
                }
                
                //SECOND CARD
                Group{
                    Spacer(minLength: 0)
                    
                    ZStack{
                        Image("Nav2")
                            .resizable()
                            .cornerRadius(20)
                    
    //                        .aspectRatio( contentMode: .fill)
    //                        .frame(width: .infinity, height: .infinity, alignment: .center)
                        VStack(alignment: .leading){
                            HStack{
                                Spacer()
                            }
                            Text("Navega el riachuelo").font(.custom("SofiaSans-Medium",size: 25,relativeTo: .title))
                            HStack{
                                Button {
                                    openURL(URL(string: "https://checkout.wompi.co/l/namKJh")!)
                                } label: {
                                    HStack{
                                        Text("$20.000").font(.custom("SofiaSans-Bold",size: 12,relativeTo: .body)).foregroundColor(.black)
                                        VStack{
                                            Text("Pago mensual").font(.custom("SofiaSans-Medium",size: 9,relativeTo: .caption)).foregroundColor(.black)
                                            Text("12 pagos durante el año").font(.custom("SofiaSans-Light",size: 8,relativeTo: .caption2)).foregroundColor(.black)
                                        }
                                       
                                    }
                                   
                                }
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                                .background(.white)
                                .cornerRadius(70)
                                
                                Button {
                                    openURL(URL(string: "https://checkout.wompi.co/l/namKJh")!)
                                } label: {
                                    HStack{
                                        Text("$200.000").font(.custom("SofiaSans-Bold",size: 12,relativeTo: .body)).foregroundColor(.black)
                                        VStack{
                                            Text("Pago mensual").font(.custom("SofiaSans-Medium",size: 9,relativeTo: .body)).foregroundColor(.black)
                                            Text("1 pago durante el año").font(.custom("SofiaSans-Light",size: 8,relativeTo: .body)).foregroundColor(.black)
                                        }
                                       
                                    }
                                   
                                }
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                                .background(.white)
                                .cornerRadius(70)
                            }

                            
                        }.padding(10)
                        
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Apoya nuestro trabajo y sé parte de nuestros financiadores.")
                        .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                        .foregroundColor(Color("Text"))
                    
                    Button{
                        navegaElRiachuelo.toggle()
                    }label: {
                        Text("*Más información")
                            .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                            .foregroundColor(Color("Yellow"))
                            
                    }
                    
                    if navegaElRiachuelo {
                        Text("*Recibe nuestro newsletter, una pieza digital de una ilustración baudoseña que podrás utilizar como fondo de pantalla para tu computador o dispositivo móvil  y participa de espacios exclusivos de nuestra agencia (conversación interna con nuestro equipo de trabajo, charlas, consejos editoriales y otros).\n\n *Cuando cumplas seis meses de pago o hagas el pago anual recibirás el 15% de descuento en cualquier artículo de nuestra tienda (aplica para un artículo).\n\n*Aplica términos y condiciones")
                            .padding(.top,5)
                            .padding(.horizontal,20)
                            .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                            .foregroundColor(Color("Text"))
                    }
                    
                    
                    Spacer(minLength: 30)
                }
        
                //THIRD CARD
                Group{
                    Spacer(minLength: 0)
                    
                    ZStack{
                        Image("Nav3")
                            .resizable()
                            .cornerRadius(20)
                    
    //                        .aspectRatio( contentMode: .fill)
    //                        .frame(width: .infinity, height: .infinity, alignment: .center)
                        VStack(alignment: .leading){
                            HStack{
                                Spacer()
                            }
                            Text("Navega la quebrada").font(.custom("SofiaSans-Medium",size: 25,relativeTo: .title))
                            HStack{
                                Button {
                                    openURL(URL(string: "https://checkout.wompi.co/l/namKJh")!)
                                } label: {
                                    HStack{
                                        Text("$10.000").font(.custom("SofiaSans-Bold",size: 12,relativeTo: .body)).foregroundColor(.black)
                                        VStack{
                                            Text("Pago mensual").font(.custom("SofiaSans-Medium",size: 9,relativeTo: .caption)).foregroundColor(.black)
                                            Text("12 pagos durante el año").font(.custom("SofiaSans-Light",size: 8,relativeTo: .caption2)).foregroundColor(.black)
                                        }
                                       
                                    }
                                   
                                }
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                                .background(Color("Yellow"))
                                .cornerRadius(70)
                                
                                Button {
                                    openURL(URL(string: "https://checkout.wompi.co/l/namKJh")!)
                                } label: {
                                    HStack{
                                        Text("$100.000").font(.custom("SofiaSans-Bold",size: 12,relativeTo: .body)).foregroundColor(.black)
                                        VStack{
                                            Text("Pago mensual").font(.custom("SofiaSans-Medium",size: 9,relativeTo: .body)).foregroundColor(.black)
                                            Text("1 pago durante el año").font(.custom("SofiaSans-Light",size: 8,relativeTo: .body)).foregroundColor(.black)
                                        }
                                    }
                                }
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                                .background(Color("Yellow"))
                                .cornerRadius(70)
                            }

                            
                        }.padding(10)
                        
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Apoya nuestro trabajo y sé parte de nuestros financiadores.")
                        .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                        .foregroundColor(Color("Text"))
                    
                    Button{
                        navegaLaQuebrada.toggle()
                    }label: {
                        Text("*Más información")
                            .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                            .foregroundColor(Color("Yellow"))
                            
                    }
                    
                    if navegaLaQuebrada {
                        Text("*Recibe nuestro newsletter, una pieza digital de una ilustración baudoseña que podrás utilizar como fondo de pantalla para tu computador o dispositivo móvil y participa de espacios exclusivos de nuestra agencia (conversación interna con nuestro equipo de trabajo, charlas, consejos editoriales y otros).\n\n *Aplica términos y condiciones")
                            .padding(.top,5)
                            .padding(.horizontal,20)
                            .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                            .foregroundColor(Color("Text"))
                    }
                    
                    
                    Spacer(minLength: 40)
                }
                
                //FOUR CARD
                Group{
                    
                    ZStack{
                        Image("Nav4")
                            .resizable()
                            .cornerRadius(20)
                    
    //                        .aspectRatio( contentMode: .fill)
    //                        .frame(width: .infinity, height: .infinity, alignment: .center)
                        VStack(alignment: .leading){
                            HStack{
                                Spacer()
                            }
                            Text("Navega libre").font(.custom("SofiaSans-Medium",size: 25,relativeTo: .title))
                            HStack{
                                Button {
                                    
//                                    openURL(URL(string: )!)
                                } label: {
                                    HStack{
                                        TextField(
                                          "Introduce el monto",
                                          text: $monto
                                        )
                                        .font(.custom("SofiaSans-Bold",size: 12,relativeTo: .body)).foregroundColor(.black)
                                        .padding(.horizontal,10)
                                        .padding(.vertical,10)

                                    }
                                   
                                }
                                .padding(.horizontal,10)
                                .padding(.vertical,0)
                                .background(Color("ComuPro"))
                                .cornerRadius(70)
                                
                                Button {
                                    showWebView.toggle()
//                                    NavegadorWeb(url: "https://checkout.wompi.co/l/namKJh")
                                } label: {
                                    HStack{
                                        Text("Click para el pago de monto libre").font(.custom("SofiaSans-Bold",size: 12,relativeTo: .body)).foregroundColor(.black)
                                        
                                       
                                    }
                                   
                                }
                                .padding(.horizontal,10)
                                .padding(.vertical,5)
                                .background(Color("ComuPro"))
                                .cornerRadius(70)
                            }

                            
                        }.padding(10)
                        
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("Apoya nuestro trabajo y sé parte de nuestros financiadores.")
                        .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                        .foregroundColor(Color("Text"))
                    
                    Button{
                        navegaLibre.toggle()
                    }label: {
                        Text("*Más información")
                            .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                            .foregroundColor(Color("Yellow"))
                            
                    }
                    
                    if navegaLibre {
                        Text("*Recibe nuestro newsletter, una pieza digital de una ilustración baudoseña que podrás utilizar como fondo de pantalla para tu computador o dispositivo móvil  y participa de espacios exclusivos de nuestra agencia (conversación interna con nuestro equipo de trabajo, charlas, consejos editoriales y otros).\n\n *Cuando cumplas seis meses de pago o hagas el pago anual recibirás el 15% de descuento en cualquier artículo de nuestra tienda (aplica para un artículo).\n\n*Aplica términos y condiciones")
                            .padding(.top,5)
                            .padding(.horizontal,20)
                            .font(.custom("SofiaSans-Light",size: 15,relativeTo: .body))
                            .foregroundColor(Color("Text"))
                    }
                    
                    
                    Spacer(minLength: 0)
                }
                
            }
        }
        .sheet(isPresented: $showWebView){
            NavegadorWeb(url: "https://checkout.wompi.co/l/namKJh")
        }
    }
        
}

struct Navegantes_Previews: PreviewProvider {
    static var previews: some View {
        Navegantes()
    }
}

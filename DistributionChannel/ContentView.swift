//
//  ContentView.swift
//  DistributionChannel
//
//  Created by Irfandio Daffa A on 10/09/20.
//  Copyright © 2020 Irfandio Daffa A. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userAuth: AuthUser
    var body: some View {
        if(!userAuth.isLoggedIn){
            return AnyView(Login())
        }else{
            return AnyView(Home())
        }
    }
}

struct Home: View{
    @EnvironmentObject var userAuth: AuthUser
    var body: some View{
        NavigationView{
            ZStack{
                Color.white
                Text("This is home").foregroundColor(Color("mainColor"))
                
                    .navigationBarTitle("Home", displayMode: .inline)
                .navigationBarItems(
                    trailing:
                    Button(action: {self.userAuth.isLoggedIn=false}){
                        Image(systemName: "heart.fill")
                    }
                )
            }
        }
    }
}

struct Login: View{
    
    @EnvironmentObject var userAuth: AuthUser
    
    @State var username: String = ""
    @State var password: String = ""
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    func loginCheck(){
        if(username == "Daffa" && password == "Daffa20"){
            userAuth.isLoggedIn = true
        }else{
            userAuth.isLoggedIn = false
            userAuth.isCorrect = false
        }
    }
    
    var body: some View{
        ZStack(alignment: .bottom){
            Color("mainColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                HStack{
                    HStack{
                        Image("top_login")
                        .resizable()
                            
                    }
                    
                }.frame(height:250).clipShape(CustomShape(corner: .bottomRight, radii: 50))
                
                //Form uname and password
                VStack(alignment: .leading ){
                    Text("Username")
                    TextField("Username", text: $username)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                    
                    Text("Password")
                    SecureField("Password", text: $password)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                    
                    //show warning
                    if(!userAuth.isCorrect){
                        Text("Username dan Password salah :)").foregroundColor(.red)
                    }
                    
                    HStack{
                        Button(action: {print()}){
                            Text("Forgot password").font(.callout)
                        }
                        Spacer()
                    }.padding(.top, 10).padding(.bottom,20)
                    
                    //Login button
                    
                    HStack{
                        Spacer()
                        Button(action: {self.loginCheck()}){
                            Text("Login").bold().font(.callout).foregroundColor(.white)
                        }
                        Spacer()
                        }.padding().background(Color("mainColor")).cornerRadius(15)
                    
                    HStack{
                        Spacer()
                        Text("Belum memiliki akun? ").font(.callout)
                        Spacer()
                        Button(action: {print()}){
                            Text("Daftar disini").bold().font(.callout).foregroundColor(Color("mainColor"))
                        }
                        Spacer()
                    }.padding()
                    
                }.padding(30)
                
                Spacer()
            }.background(Color.white).edgesIgnoringSafeArea(.bottom)
            
            VStack{
                Spacer()
                HStack{
                    Text("copyright 2020").font(.callout)
                    Text("Cerdas Solusi Indonesia").bold().font(.callout).foregroundColor(Color("mainColor"))
                }
            }
            }
    }
}

//Custom Shape

struct CustomShape: Shape {
    var corner: UIRectCorner
    var radii: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

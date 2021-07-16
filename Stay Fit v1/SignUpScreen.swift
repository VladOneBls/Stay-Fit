//
//  SignUpScreen.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 06/04/2021.
//

import SwiftUI

struct SignUpScreen: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        ZStack {
            
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10.0)
                .padding(.all, 50)
            
            Circle()
                .foregroundColor(.white)
                .offset(y: -331)
                .frame(width: 35, height: 35, alignment: .center)
            
            Image(systemName: "key.fill")
                .foregroundColor(Color(red: 243/255, green: 189/255, blue: 126/255))
                .offset(y: -321)
                .font(.largeTitle)
            
            VStack {
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100.0, height: 100.0)
                    .cornerRadius(150)
                    .shadow(radius: 15)
                    .offset(y: 20)
                
                Spacer()
                
                Text("Create account,              Sign Up to get started")
                    .foregroundColor(Color(red: 161/255, green: 99/255, blue: 68/255))
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                
                Spacer()
                
                Group {
                    
                    TextField("Username", text: $username)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                    
                    SecureField("Password", text: $password)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                    
                }
                
                Group {
                    
                    // SIGN UP BUTTON
                    Button(action: {
                        
                        //TODO
                        
                    }, label: {
                        Text("Sign Up")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    })
                    
                    Spacer()
                    
                    Text("Already a member?")
                        .foregroundColor(Color(red: 161/255, green: 99/255, blue: 68/255))
                        .font(.caption)
                    
                    // LOGIN BUTTON
                    Button(action: {
                        
                        //TODO
                        
                    }, label: {
                        Text("Sign In")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 110, height: 20, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    }).offset(y: 5)   
                }
                
                Spacer()
                
            }
        }
        
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}

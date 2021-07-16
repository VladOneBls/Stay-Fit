//
//  ContentView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 31/03/2021.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                //HomeView()
                VStack {
                    Text("You are signed in")

                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("Sign Out")
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .foregroundColor(Color.blue)
                            .padding()
                    }
                }
            }
            else {
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
            
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
                
                Text("Welcome,                              Sign in to continue")
                    .foregroundColor(Color(red: 161/255, green: 99/255, blue: 68/255))
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                
                Spacer()
                
                Group {
                    
                    TextField("Email", text: $email)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                }
                
                Group {
                    
                    // SIGN IN BUTTON
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    })
                    
                    Spacer()
                    
                    Text("Not a member?")
                        .foregroundColor(Color(red: 161/255, green: 99/255, blue: 68/255))
                        .font(.caption)
                    
                    // CREATE ACCOUNT BUTTON
                    NavigationLink(destination: SignUpView()) {
                        Text("Create account")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 110, height: 20, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    }.offset(y: 5)
                    
                    // FORGOT YOUR PASSWORD BUTTON
                    Button(action: {
                        
                        //TODO
                        
                    }, label: {
                        Text("Forgot your password?")
                            .foregroundColor(.white)
                            .font(.caption)
                            .underline()
                    }).offset(y: 45)
                    
                }
                
                Spacer()
                
            }
        }
    }
}

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
            
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
                    
                    TextField("Email", text: $email)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                }
                
                Group {
                    
                    // SIGN UP BUTTON
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                    }, label: {
                        Text("Create Account")
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
                    
                    // SIGN IN BUTTON
                    NavigationLink(destination: SignInView()) {
                        Text("Sign In")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 110, height: 20, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                    }.offset(y: 5)
                }
                
                Spacer()
                
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .edgesIgnoringSafeArea(.all)
                    .navigationTitle("")
                //.navigationBarHidden(true)
                
                VStack {
                    // QUOTE
                    Text("Our bodies communicate to us clearly and specifically, if we are willing to listen to them")
                        .foregroundColor(.black)
                        .font(.title2)
                        .padding(.horizontal, 30)
                        .padding(.top, 40)
                    
                    // AUTHOR
                    Text("- Shakti Gawain")
                        .foregroundColor(.black)
                        .font(.title2).bold()
                        .padding()
                        .padding(.leading, 200)
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: WorkoutsView(), label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width: 170, height: 170, alignment: .center)
                                    .cornerRadius(10)
                                Text("Workouts")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                        })
                        
                        NavigationLink(destination: ExercisesView(), label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width: 170, height: 170, alignment: .center)
                                    .cornerRadius(10)
                                Text("Exercises")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                        })
                    }
                    
                    Spacer()
                }
            }
        }.onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 161/255, green: 99/255, blue: 68/255))]
        }
    }
}


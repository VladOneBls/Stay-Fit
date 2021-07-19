import SwiftUI
import FirebaseAuth

// VIEWS
struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                HomeView()
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

struct SignInView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var email = ""
    @State var password = ""
    
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
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var email = ""
    @State var password = ""
    
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
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("")
            
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
                
                // SIGN OUT BUTTON
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Sign Out")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 35, alignment: .center)
                        .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                        .cornerRadius(5)
                        .padding(.top, 30)
                }
                
                Spacer()
            }
        }.onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(red: 161/255, green: 99/255, blue: 68/255))]
        }
    }
}

// Workouts
struct WorkoutsView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var currentTab = 0
    
    @State private var cardioWorkouts = ["WARM UP", "LEGS ON FIRE", "STRONGER MUSCLES", "TONING", "BUTT & THIGHS", "1", "2", "3"]
    @State private var absWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    @State private var legsWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    @State private var armsWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Workouts")
            
            ScrollView {
                switch currentTab {
                case 0: // CARDIO TAB
                    ForEach(cardioWorkouts.indices, id: \.self) { index in
                        NavigationLink(destination: DetailedWorkoutView(), label: {
                            Text(self.cardioWorkouts[index])
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 100, alignment: .center)
                                .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                .cornerRadius(8)
                        }).padding(1)
                    }
                    
                case 1: // ABS TAB
                    ForEach(absWorkouts.indices, id: \.self) { index in
                        NavigationLink(destination: DetailedWorkoutView(), label: {
                            Text(self.absWorkouts[index])
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 100, alignment: .center)
                                .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                .cornerRadius(8)
                        }).padding(1)
                    }
                    
                case 2: // LEGS TAB
                    ForEach(legsWorkouts.indices, id: \.self) { index in
                        NavigationLink(destination: DetailedWorkoutView(), label: {
                            Text(self.legsWorkouts[index])
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 100, alignment: .center)
                                .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                .cornerRadius(8)
                        }).padding(1)
                    }
                    
                case 3: // ARMS TAB
                    ForEach(armsWorkouts.indices, id: \.self) { index in
                        NavigationLink(destination: DetailedWorkoutView(), label: {
                            Text(self.armsWorkouts[index])
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 100, alignment: .center)
                                .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                .cornerRadius(8)
                        }).padding(1)
                    }
                    
                default:
                    Text("ERROR")
                } // closing switch
            }.offset(y: 150) // closing ScrollView
            
            Picker(selection: $currentTab, label: Text("")) {
                Text("Cardio").tag(0)
                Text("Abs").tag(1)
                Text("Legs").tag(2)
                Text("Arms").tag(3)
            }.pickerStyle(SegmentedPickerStyle())
            .padding(.top, -340)
            .padding(.horizontal, 20)
        } // closing first ZStack
    }
}

struct DetailedWorkoutView: View {
    
    @State var currentTab = 0
    
    @State private var workoutExercises = ["LUNGES", "SQUATS", "BIKE CRUNCHES", "LEG RAISES"]
    
    var body: some View {
        ZStack {
            Image("background")
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 390, height: 150, alignment: .center)
                        .foregroundColor(.white)
                    
                    Text("Workout Name")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(width: 360, height: 30, alignment: .leading)
                        .offset(y: 50)
                }
                
                Spacer()
                
                // CATEGORY PICKER
                Picker(selection: $currentTab, label: Text("")) {
                    Text("Beginner").tag(0)
                    Text("Intermediate").tag(1)
                    Text("Advanced").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.top, -365)
                .padding(.horizontal, 20)
                .offset(y: 365)
                
                ScrollView {
                    switch currentTab {
                    case 0:
                        ForEach(workoutExercises.indices, id: \.self) { index in
                            HStack {
                                Image("logo")
                                    .resizable()
                                    .frame(width: 100.0, height: 100.0)
                                    .cornerRadius(5)
                                    .padding(.leading, -122)
                                Text("Exercise name")
                                    .fontWeight(.bold)
                            }
                        }.offset(y: 33)
                    case 1:
                        ForEach(workoutExercises.indices, id: \.self) { index in
                            HStack {
                                Image("logo")
                                    .resizable()
                                    .frame(width: 100.0, height: 100.0)
                                    .cornerRadius(5)
                                    .padding(.leading, -122)
                                Text("Exercise name")
                                    .fontWeight(.bold)
                            }
                        }.offset(y: -110)
                    case 2:
                        ForEach(workoutExercises.indices, id: \.self) { index in
                            HStack {
                                Image("logo")
                                    .resizable()
                                    .frame(width: 100.0, height: 100.0)
                                    .cornerRadius(5)
                                    .padding(.leading, -122)
                                Text("Exercise name")
                                    .fontWeight(.bold)
                            }
                        }.offset(y: -110)
                    default:
                        Text("ERROR")
                    } // closing switch
                    
                    NavigationLink(
                        destination: WorkingOutSessionView(),
                        label: {
                            Text("START")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 370, height: 50, alignment: .center)
                                .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                                .cornerRadius(5)
                                .padding(.top, 50)
                        }).padding(1)
                } // closing ScrollView
            } // closing first VStack
        } // closing first ZStack
    }
}

struct WorkingOutSessionView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    var exerciseTime = 20
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                .frame(width: 380, height: 200)
                .cornerRadius(20)
            
            Text("ExerciseName")
                .font(.largeTitle).bold()
                .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
            
            ZStack {
                Circle()
                    .stroke(Color(red: 243/255, green: 189/255, blue: 126/255), lineWidth: 12)
                    .frame(width: 230, height: 230)
                
                Text("\(timerManager.secondsLeft)")
                    .font(.system(size: 150))
                    .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                    .padding(.vertical, 60)
            }
            
            HStack {
                // BACK BUTTON
                Button(action: {
                    // code
                }, label: {
                    Image(systemName: "lessthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                        .padding()
                })
                
                // PLAY/PAUSE BUTTON
                Button(action: {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.setTimerLength(seconds: exerciseTime)
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                }, label: {
                    Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                        .padding()
                })
                
                // FORWARD BUTTON
                Button(action: {
                    // code
                }, label: {
                    Image(systemName: "greaterthan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                        .padding()
                })
            }
            
            // RESTART BUTTON
            Button(action: {
                self.timerManager.reset()
            }, label: {
                HStack(spacing: 15) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                    Text("Restart")
                        .foregroundColor(.white).bold()
                }
                .padding()
                .background((Color(red: 243/255, green: 189/255, blue: 126/255)))
                .cornerRadius(50)
            })
            
            Spacer()
        }
        .offset(y: 50)
        .edgesIgnoringSafeArea(.all)
    }
}

// Exercises
struct ExercisesView: View {
    
    @State private var exercises = ["Exercise 1", "Exercise 2", "Exercise 3", "Exercise 4", "Exercise 5", "Exercise 6", "Exercise 7", "Exercise 8", "Exercise 9"]
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Exercises")
            
            ScrollView {
                ForEach(exercises.indices, id: \.self) { index in
                    NavigationLink(destination: DetailedWorkoutView(), label: {
                        Text(self.exercises[index])
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 100, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                            .cornerRadius(8)
                    }).padding(1)
                }
            }.offset(y: 110) // closing ScrollView
        } // close first ZStack
    }
}

struct DetailedExerciseView: View {
    var body: some View {
        Text("Detailed Exercise")
    }
}

// Activity/Profile
struct ActivityView: View {
    var body: some View {
        Text("Activity")
    }
}



// CLASSES
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

struct ContentView_Previews: PreviewProvider {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    static var previews: some View {
        ContentView().environmentObject(AppViewModel())
        
    }
}

import SwiftUI

struct ExercisesView: View {
    
    @State private var exercises = ["Exercise 1", "Exercise 2", "Exercise 3", "Exercise 4", "Exercise 5", "Exercise 6", "Exercise 7", "Exercise 8", "Exercise 9"]
    
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Exercises")
            
            ScrollView {
                ForEach(exercises.indices, id: \.self) { index in
                    NavigationLink(destination: WorkoutDetailedView(), label: {
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

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}

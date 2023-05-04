import SwiftUI

struct ContentView: View {
    struct Person {
        let name: String
        let age: Int
    }
    
    let people = [
        Person(name: "John", age: 25),
        Person(name: "Jane", age: 30),
        Person(name: "Mike", age: 35),
        Person(name: "Emily", age: 28),
        Person(name: "David", age: 40)
    ]
    
    @State private var showFilteredResults = false
    
    var filteredPeople: [Person] {
        if showFilteredResults {
            return people.filter { $0.age > 30 }
        } else {
            return people
        }
    }
    
    var body: some View {
        VStack {
            Text("Original Array:")
                .font(.headline)
            
            ForEach(people, id: \.name) { person in
                Text("\(person.name), \(person.age)")
            }
            
            Button(action: {
                showFilteredResults.toggle()
            }) {
                Text(showFilteredResults ? "Show All" : "Filter Age > 30")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text(showFilteredResults ? "Filtered Array (Age > 30):" : "Array (No Filter):")
                .font(.headline)
            
            ForEach(filteredPeople, id: \.name) { person in
                Text("\(person.name), \(person.age)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

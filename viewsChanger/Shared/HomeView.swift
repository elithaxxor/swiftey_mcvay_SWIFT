//
//  ContentView.swift
//  Shared
//
//  Created by a-robota on 4/4/22.
//



/*
    Created Navigation object in contentView.
    call reference at the botom of body content
 */
import SwiftUI
import CoreData

struct HomeView: View {
    @State private var setColor = ""
    @State private var getColor: getColor = setColor.chosenColor("blue")

    private var items: FetchedResults<Item>

    var body: some View {
       
        ZStack {
            selectedColor.color
                .ignoreSafeArea()
            VStack {
                
                VStack(alignment.leading){
                    TextField("[change color] to view color UI")
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .onSubmit{
                            
                        }
                    Text("[change color] to view color UI")
                        .font(.captain)
                }.padding()
                Button("Sheet Picker"){
                    
                }
                Button("Overlay Picker")
                NavigationLink {
                    PushedView(selectedColor: $sele)
                }
            }
        }
        
        
        
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

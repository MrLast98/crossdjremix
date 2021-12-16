//
//  ContentView.swift
//  Shared
//
//  Created by Emanuele Giunta on 08/12/21.
//

import SwiftUI
import CoreData
//import AlertToast

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Song.title, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Song>
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach((1...10).reversed(), id: \.self) {
                    Text("Ciaone \($0)")
                }
            }
            DecksView()
        }
        .toolbar {
#if os(iOS)
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
#endif
            ToolbarItem {
                Button("Add Item \(Image(systemName: "plus"))") {
                    showAlert.toggle()
                }
                //                .toast(isPresenting: $showAlert){
                //                    AlertToast(type: .regular, title: "Message Sent!")
                //                }
            }
        }
    }
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).previewInterfaceOrientation(.landscapeLeft)
    }
}

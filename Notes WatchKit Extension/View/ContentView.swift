//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Seunghun Yang on 2021/06/29.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - Functions
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // do nothing
            }
        }
    }
    
    func delete(offset: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                Button {
                    guard text.isEmpty == false else { return }
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                    save()
                } label : {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
            }
            Spacer()
            
            if notes.isEmpty {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            } else {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        HStack {
                            Capsule()
                                .frame(width: 4)
                                .foregroundColor(.accentColor)
                            Text(notes[i].text)
                                .lineLimit(1)
                                .padding(.leading, 5)
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
        }
        .navigationTitle("Notes")
        .onAppear{
            load()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

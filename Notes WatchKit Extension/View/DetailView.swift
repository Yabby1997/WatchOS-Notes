//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Seunghun Yang on 2021/06/29.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Properties
    
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 3, content: {
            HeaderView()
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            HStack(alignment: .center, content: {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingsView()
                    })
                Spacer()
                
                Text("\(count) / \(index + 1)")
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            })
            .foregroundColor(.secondary)
        })
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(id: UUID(), text: "테스트용 텍스트."), count: 5, index: 1)
    }
}

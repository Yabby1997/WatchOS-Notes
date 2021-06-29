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
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 3, content: {
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
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
                Spacer()
                
                Text("\(count) / \(index + 1)")
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
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

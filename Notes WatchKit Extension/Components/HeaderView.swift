//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Seunghun Yang on 2021/06/29.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - Properties
    
    var title: String = ""
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }
            .foregroundColor(.accentColor)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView()
            HeaderView(title: "Credits")
        }
    }
}

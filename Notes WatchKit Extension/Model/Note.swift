//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Seunghun Yang on 2021/06/29.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}

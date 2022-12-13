//
//  Card.swift
//  TrelloClone
//
//  Created by tommyhan on 13/12/2022.
//

import Foundation

class Card: ObservableObject, Identifiable {
    private(set) var id = UUID()
    var boardListId: UUID
    
    @Published var content: String
    
    init(content: String, boardListId: UUID) {
        self.content = content
        self.boardListId = boardListId
    }
    
    
}

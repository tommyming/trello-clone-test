//
//  BoardList.swift
//  TrelloClone
//
//  Created by tommyhan on 13/12/2022.
//

import Foundation

class BoardList: ObservableObject, Identifiable {
    
    private(set) var id = UUID()
    var boardId: UUID
    
    @Published var name: String
    @Published var cards: [Card]
    
    init(name: String, cards: [Card] = [], boardId: UUID) {
        self.name = name
        self.cards = cards
        self.boardId = boardId
    }
}

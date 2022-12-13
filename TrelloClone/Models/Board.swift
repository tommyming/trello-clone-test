//
//  Board.swift
//  TrelloClone
//
//  Created by tommyhan on 13/12/2022.
//

import Foundation

class Board: ObservableObject, Identifiable {
    
    private(set) var id = UUID()
    @Published var name: String
    @Published var lists: [BoardList]
    
    init(name: String, lists: [BoardList] = []) {
        self.name = name
        self.lists = lists
    }
}

//
//  Board+Stub.swift
//  TrelloClone
//
//  Created by tommyhan on 14/12/2022.
//

import Foundation

extension Board {
    
    static var stub: Board {
        let board = Board(name: "Testing Board")
        let backlogBoardList = BoardList(name: "Backlog", boardId: board.id)
        let backlogCards = [
            "Cloud Service",
            "Ingestion Service",
            "Compression Engine"
        ].map { Card(content: $0, boardListId: backlogBoardList.id) }
        backlogBoardList.cards = backlogCards
        
        let todoBoardList = BoardList(name: "Todo", boardId: board.id)
        let todoCards = [
            "Error Handling",
            "Text Search"
        ].map { Card(content: $0, boardListId: todoBoardList.id) }
        todoBoardList.cards = todoCards
        
        let inProgressBoardList = BoardList(name: "In Progress", boardId: board.id)
        let inProgressCards = ["File Storage"].map { Card(content: $0, boardListId: inProgressBoardList.id) }
        
        inProgressBoardList.cards = inProgressCards
        
        let doneBoardList = BoardList(name: "Done", boardId: board.id)
        board.lists = [
            backlogBoardList,
            todoBoardList,
            inProgressBoardList,
            doneBoardList
        ]
        
        return board
    }
}

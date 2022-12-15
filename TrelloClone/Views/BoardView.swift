//
//  BoardView.swift
//  TrelloClone
//
//  Created by tommyhan on 14/12/2022.
//

import SwiftUI

let boardListBackgroundColor = Color(uiColor: UIColor(red: 0.92, green: 0.92, blue: 0.94, alpha: 1))
let trelloBlueBackgroundColor = Color(uiColor: UIColor(red: 0.2, green: 0.47, blue: 0.73, alpha: 1))

struct BoardView: View {
    
    @StateObject private var board: Board = Board.stub
    
    var body: some View {
        /**
         Suppose we should use `NavigationView` here
         But since the style method is deprecating, therefore we will use the new View Class
         `NavigationStack`, which represents Stack Style Navigation View.  ( iOS 16+ available )
         */
        
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 24) {
                    ForEach(board.lists) { boardList in
                        BoardListView(board: board, boardList: boardList)
                    }
                    
                    Button("+ Addlist") {
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(boardListBackgroundColor.opacity(0.8))
                    .frame(width: 300)
                    .cornerRadius(8)
                    .foregroundColor(.black)
                }
                .padding()
            }
            .background(Image("Image").resizable())
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle(board.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

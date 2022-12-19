//
//  BoardListView.swift
//  TrelloClone
//
//  Created by tommyhan on 15/12/2022.
//

import SwiftUI
import Introspect

struct BoardListView: View {
    
    @ObservedObject var board: Board
    @StateObject var boardList: BoardList
    
    @State var listHeight: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            headerView
            listView
                .listStyle(.plain)
                .frame(maxHeight: listHeight)
            
            Button("+ Add card") {
                handleAddCard()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.vertical)
        .background(boardListBackgroundColor)
        .frame(width: 300)
        .cornerRadius(8)
        .foregroundColor(.black)
    }
    
    private var headerView: some View {
        HStack(alignment: .top) {
            Text(boardList.name)
                .font(.headline)
                .lineLimit(2)
            
            Spacer()
            
            Menu {
                Button("Rename") {
                }
                
                Button("Delete", role: .destructive) {
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
            }

        }
        .padding(.horizontal)
    }
    
    private var listView: some View {
        List {
            ForEach(boardList.cards) { card in
                CardView(boardList: boardList, card: card)
            }
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
            .listRowBackground(Color.clear)
            /// This does not work in iOS 16, but worked on iOS 15 or before, please be aware.
            /// Maybe is due to `List` type remapping from UITableView
            .introspectTableView {
                listHeight = $0.contentSize.height
            }
        }
    }
    
    private func handleAddCard() {
        presentAlertTextField(
            title: "Add card to \(boardList.name)") { text in
                guard let text, !text.isEmpty else { return }
                
                boardList.addNewCardWithContent(text)
            }
    }
}

struct BoardListView_Previews: PreviewProvider {
    
    @StateObject static var board = Board.stub
    
    static var previews: some View {
        BoardListView(board: board, boardList: board.lists[0], listHeight: 512)
            .previewLayout(.sizeThatFits)
            .frame(width: 300, height: 512)
    }
}

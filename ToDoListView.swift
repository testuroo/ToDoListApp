//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Tetsurou Morishita on 2023/09/12.
//

//どこかしらエラーしててpreviewができない状態＋saveButtonを押下した後に画面が遷移しないのはここに問題ありそう
    //Firebaceのuser情報みたかぎりsaveできてた。
//userIdが足りなくて　ToDoListView(userId: "")　に追記したーーー×
//bodyの中が怪しい３１行〜３９行
//問題は保存してあるデータがpreviewに表示されないということ

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    //private let userId: String
    
    
    init(userId: String) {
        //self.userId = userId
        ///userid <id>/todo/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
    }
    var body: some View {
        NavigationView{
            VStack {
                List(items) { item in
                    //Text(item.title)
                    ToDoListItemView(item: item)
                        .swipeActions {
                                 Button ("Delete") {
                                viewModel.delete(id: item.id)
                                
                            }
                                    .background(Color.red)
                            }

                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "6dUZHqhtXObFskIrMmf1KanqmRi1")
    }
}

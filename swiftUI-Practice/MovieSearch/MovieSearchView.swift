//
//  MovieSearchView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/7/24.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let count: Int
}

struct MovieSearchView: View {
    
    let genre = [
        "SF", "가족", "스릴러", "애니메이션"
    ]
    
    @State private var text = ""
    @State private var list: [Category] = []
    
    var filteredList: [Category] {
        return text.isEmpty ? list : list.filter{ $0.name.contains(text) }
    }
    
    var body: some View {
        NavigationView {
            
            //            makeList()
            //            makeList2
            MakeList(list: filteredList)
                .navigationTitle("영화 검색")
                .toolbar {
                    Image(systemName: "plus")
                        .wrapToButton {
                            list.append(Category(name: genre.randomElement()!,
                                                 count: .random(in: 1...100)))
                        }
                }
        }
        .searchable(text: $text, placement: .navigationBarDrawer, prompt: "영화를 검색해보세요.")
        .onAppear {
            print("onAppear")
        }
    }
    
    // 3가지 방법
    func makeList() -> some View {
        List {
            ForEach(filteredList) { item in
                HStack {
                    Text("\(item.name) (\(item.count))")
                }
            }
        }
    }
    
    var makeList2: some View {
        List {
            ForEach(filteredList) { item in
                HStack {
                    Text("\(item.name) (\(item.count))")
                }
            }
        }
    }
}

struct MakeList: View {
    
    var list: [Category]
    
    var body: some View {
        List {
            ForEach(list) { item in
                
                NavigationLink {
                    DetailView()
                } label: {
                    Text("\(item.name) (\(item.count))")
                }
            }
        }
        .disclosureGroupStyle(.automatic)
    }
}

#Preview {
    MovieSearchView()
}

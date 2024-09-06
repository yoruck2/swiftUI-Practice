//
//  RandomImageView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/5/24.
//

import SwiftUI

struct Section: Identifiable, Hashable {
    let id = UUID()
    var name: String
    let imageCount: Int = 10
}

struct RandomImageView: View {
    
    init(sectionList: [Section] = [
        Section(name: "첫번째 섹션"),
        Section(name: "두번째 섹션"),
        Section(name: "세번째 섹션"),
        Section(name: "네번쨰 섹션")
    ]) {
        self.sectionList = sectionList
        print("✨ RandomImageView")
    }
    
    @State var sectionList = [
        Section(name: "첫번째 섹션"),
        Section(name: "두번째 섹션"),
        Section(name: "세번째 섹션"),
        Section(name: "네번쨰 섹션")
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($sectionList) { item in
                    HorizontalSelectionView(section: item)
                }
            }
            .navigationTitle("My Random Image")
        }
    }
}


#Preview {
    RandomImageView()
}

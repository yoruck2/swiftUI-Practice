//
//  HorizontalSelectionView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/5/24.
//

import SwiftUI

struct HorizontalSelectionView: View {
    
    @Binding var section: Section
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.name)
                .font(.system(size: 25, weight: .medium))
                .padding(.horizontal)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<section.imageCount, id: \.self) { item in
                        ImageView(section: $section)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    RandomImageView()
}

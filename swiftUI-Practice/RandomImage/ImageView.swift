//
//  PosterView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/5/24.
//

import SwiftUI

struct ImageView: View {
    
    @State private var number = Int.random(in: 1...100)
    @Binding var section: Section
    var imageUrl: URL? {
        URL(string: "https://picsum.photos/id/\(number)/200/300")
    }
    
    var body: some View {
        AsyncImage(url: imageUrl, scale: 1.0) { data in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: 200, height: 300)
            case .success(let image):
                NavigationLink {
                    ImageDetailView(image: image, sectionName: $section.name)
                } label: {
                    image
                        .frame(width: 160, height: 220)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: -10))
                }
            case .failure(_):
                Image(systemName:  "photo.fill")
                    .frame(width: 200, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                // apple이 만든 타입일 경우 자기내들이 더 추가할수도 있어서 default를 써야댐, 커스텀은 내가 결정하는것이니 반대
            @unknown default:
                Image(systemName:  "photo.fill")
                    .frame(width: 200, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}

#Preview {
    RandomImageView()
}

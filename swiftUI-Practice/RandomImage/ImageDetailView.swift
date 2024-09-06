//
//  ImageDetailView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/5/24.
//

import SwiftUI

struct ImageDetailView: View {
    
    @State var image: Image
    @Binding var sectionName: String
    
    var body: some View {
        image
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .frame(width: 300, height: 400)
        
        TextField("섹션 이름을 입력해주세요", text: $sectionName)
            .padding()
    }
}

#Preview {
    RandomImageView()
}

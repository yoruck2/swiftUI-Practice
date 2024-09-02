//
//  CapsuleButtonWrapper.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/2/24.
//

import SwiftUI

struct CapsuleButtonWrapper: ViewModifier {
    
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(
            action: action,
            label: { content })
    }
}

extension View {
    func wrapToButton(action: @escaping () -> Void) -> some View {
        modifier(CapsuleButtonWrapper(action: action))
//            .padding(.horizontal)
    }
}

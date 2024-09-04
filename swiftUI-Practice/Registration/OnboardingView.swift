//
//  ContentView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/2/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("launch")
                Image("launchImage")
                    .padding(40)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                // 터치 영역 작음
//                NavigationLink("시작하기") {
//                    ProfileSettingView()
//                }
//                .frame(maxWidth: .infinity)
//                .font(.system(size: 20,weight: .bold))
//                .padding(15)
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(25)
//                .padding(.horizontal)
                
                NavigationLink(destination: ProfileSettingView()) {
                    Text("시작하기")
                        .font(.system(size: 20,weight: .bold))
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}

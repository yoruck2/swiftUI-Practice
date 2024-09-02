//
//  ProfileSettingView.swift
//  swiftUI-Practice
//
//  Created by dopamint on 9/3/24.
//

import SwiftUI

struct ProfileSettingView: View {
    @State private var nickname = ""
    @State private var selectedMBTI: [String: String] = [:]
    
    let mbtiOptions = [["E", "I"], ["S", "N"], ["T", "F"], ["J", "P"]]
    
    var body: some View {
        VStack(spacing: 20) {
            ProfilePictureView()
                .padding()
                .navigationTitle("PROFILE SETTING")
                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarItems(leading: BackButton())
            
            TextField("닉네임을 입력해주세요 :)", text: $nickname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 50, trailing: 20))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("MBTI")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal)
                
                
                ForEach(0..<2) { row in
                    HStack(spacing: 20) {
                        ForEach(0..<4) { col in
                            MBTIButton(option: mbtiOptions[col][row], isSelected: isSelected(mbtiOptions[col][row])) {
                                toggleMBTI(mbtiOptions[col][row])
                            }
                        }
                    }
                }
                
                .padding(.horizontal)
            }
        }.padding(EdgeInsets())
        
        Spacer()
        
        NavigationLink(destination: SwiftUIView()) {
            Text("완료")
                .font(.system(size: 20,weight: .bold))
                .padding(15)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(25)
                .padding(.horizontal)
        }
    }
    
    private func toggleMBTI(_ option: String) {
        for pair in mbtiOptions {
            if pair.contains(option) {
                if let selected = selectedMBTI[String(pair[0])] {
                    if selected == option {
                        selectedMBTI.removeValue(forKey: String(pair[0]))
                    } else {
                        selectedMBTI[String(pair[0])] = option
                    }
                } else {
                    selectedMBTI[String(pair[0])] = option
                }
                break
            }
        }
    }
    
    private func isSelected(_ option: String) -> Bool {
        return selectedMBTI.values.contains(option)
    }
}

struct MBTIButton: View {
    let option: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(isSelected ? Color.blue : Color.white)
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                    )
                Text(option)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(isSelected ? .white : .blue)
            }
            .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    ProfileSettingView()
}
struct ProfilePictureView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.blue, lineWidth: 11)
                .fill(Color.white)
            VStack(spacing: 5) {
                Image("profile_0")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
            }
            Image(systemName: "camera.fill")
                .foregroundColor(.white)
                .padding(8)
                .background(Color.blue)
                .clipShape(Circle())
                .offset(x: 40, y: 40)
        }
        .frame(width: 100, height: 100)
    }
}

//struct BackButton: View {
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        Button(action: {
//            self.presentationMode.wrappedValue.dismiss()
//        }) {
//            Image(systemName: "chevron.left")
//                .foregroundColor(.black)
//        }
//    }
//}
//struct ProfilePictureView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePictureView()
//    }
//}


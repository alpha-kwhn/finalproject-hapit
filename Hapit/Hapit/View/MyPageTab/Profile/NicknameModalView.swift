//
//  NicknameModalView.swift
//  Hapit
//
//  Created by 이주희 on 2023/01/18.
//

import SwiftUI

struct NicknameModalView: View {
    @Binding var showModal: Bool
    @Binding var userNickname: String
    @State private var nickname = ""
    @State private var isValidated = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    showModal = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding()
            }
            
            Spacer()
            
            Text("닉네임 수정")
                .font(.custom("IMHyemin-Bold", size: 22))

            TextField("닉네임을 입력하세요.", text: $nickname)
                .autocorrectionDisabled()
                .font(.custom("IMHyemin-Regular", size: 17))
                .padding()
                .frame(width: 350, height: 65)
                .border(Color.accentColor)
                .padding(.bottom, 10)
            
            // TODO: 공백 입력, 글자수 제한
            Button {
                userNickname = nickname
                showModal = false
            } label: {
                Text("저장")
                    .font(.custom("IMHyemin-Bold", size: 17))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.accentColor))
            }
            
            Spacer()

        }
    }
}

struct NicknameModalView_Previews: PreviewProvider {
    static var previews: some View {
        NicknameModalView(showModal: .constant(false), userNickname: .constant(""))
    }
}

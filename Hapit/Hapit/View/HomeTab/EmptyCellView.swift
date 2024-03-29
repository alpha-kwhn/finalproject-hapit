//
//  EmptyCellView.swift
//  Hapit
//
//  Created by 박진형 on 2023/01/20.
//

import SwiftUI

enum ContentsType: String {
    case challenge
    case habit
    case post
}
struct EmptyCellView: View {
    var currentContentsType: ContentsType
    
    var body: some View {
        VStack{
            Spacer()
            //TODO: 트레이에 곰 들어간 사진 만들어보기
            Image(systemName: "tray")
                .font(.system(size: 72))
                .padding()
            
            Text("텅")
                .font(.custom("IMHyemin-Bold", size: 34))
            
            switch currentContentsType {
                
            case .challenge:
                Text("아직 진행중인 챌린지가 없습니다!")
                    .font(.custom("IMHyemin-Regular", size: 17))
                
            case .habit:
                Text("아직 완성된 습관이 없습니다!")
                    .font(.custom("IMHyemin-Regular", size: 17))
                
            case .post:
                Text("아직 작성한 일기가 없습니다!")
                    .font(.custom("IMHyemin-Regular", size: 17))
            }
                
            Spacer()
        }
    }
}

struct EmptyCellView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCellView(currentContentsType: .challenge)
    }
}

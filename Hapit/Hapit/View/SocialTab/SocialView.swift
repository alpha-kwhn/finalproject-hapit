//
//  SocialView.swift
//  Hapit
//
//  Created by 김예원 on 2023/01/17.
//

import SwiftUI
import FirebaseAuth

struct SocialView: View {
    @EnvironmentObject var userInfoManager: UserInfoManager
    @EnvironmentObject var authManager: AuthManager
    @State private var friends: [User] = [User]()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Text("친구 수: \(friends.count - 1)")
                            .font(.custom("IMHyemin-Bold", size: 15))
                    }.padding(.trailing, 20)
                    
                    ScrollView {
                        // TODO: 본인 표시 해줘야함 -> 셀 색깔로?
                        ForEach(Array(friends.enumerated()), id: \.1) { (index, friend) in
                            NavigationLink {
                                FriendChallengeView()
                            } label: {
                                FriendsRow(friend: friend, index: index + 1)
                            }
                        }
                    }
                }
                .navigationTitle("랭킹")
                .toolbar {
                    HStack {
                        NavigationLink {
                            EditFriendView(friends: $friends)
                        } label: {
                            Image(systemName: "person.2.badge.gearshape")
                        }
                        
                        NavigationLink {
                            MessageFullscreenView()
                        } label: {
                            // TODO: 나중에 메세지 오면 색깔, 심볼 삼항연산자로 변경
//                            Image(systemName: "envelope")
//                                .foregroundColor(.gray)
                            Image(systemName: "envelope.badge")
                                .foregroundColor(Color("AccentColor"))
                        }
                    }
                }
            }.background(Color("BackgroundColor"))
        }
        .task {
            do {
                let current = authManager.firebaseAuth
                try await userInfoManager.getCurrentUserInfo(currentUserUid: current.currentUser?.uid ?? "")
                try await userInfoManager.getFriendArray(currentUserUid: current.currentUser?.uid ?? "")
                self.friends = userInfoManager.friendArray
                self.friends.insert(userInfoManager.currentUserInfo ?? User(id: "", name: "", email: "", pw: "", proImage: "", badge: [""], friends: [""]), at: 0)
            } catch {
            }
        }
    }
}
struct FriendsRow: View {
    let friend: User
    var index: Int
    
    var body: some View {
        HStack {
            // TODO: 노션에 적어놓은 랭킹대로 정렬
            Text("\(index)")
                .font(.largeTitle)
                .foregroundColor(Color("AccentColor"))
            
            Image(friend.proImage)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(10)
            
            // TODO: 진행중인 챌린지 개수 가져오기
            VStack(alignment: .leading, spacing: 3) {
                if index == 0 {
                    Text("(나) ")
                        .foregroundColor(.black)
                        .bold()
                }
                Text(friend.name)
                    .foregroundColor(.black)
                    .bold()
                Text("현재 챌린지 개수: 2")
                    .font(.subheadline)
                    .foregroundColor(Color(.systemGray))
            }
            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct SocialView_Previews: PreviewProvider {
    static var previews: some View {
        SocialView()
    }
}

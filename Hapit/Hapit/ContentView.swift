//
//  ContentView.swift
//  Hapit
//
//  Created by 김응관 on 2023/01/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    VStack{
                        Image(systemName: "teddybear.fill")
                        Text("홈")
                    }
                   
                }
            SocialView()
               .tabItem {
                   VStack{
                       Image(systemName: "globe.europe.africa.fill")
                       Text("챌린지")
                   }
                }
             MyPageView()
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle.fill")
                        Text("마이페이지")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

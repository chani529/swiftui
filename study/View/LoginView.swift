//
//  ContentView.swift
//  study
//
//  Created by 손찬희 on 2023/04/16.
//

import SwiftUI

struct LoginView: View {
    @State private var id = ""
    @State var isVaildId: Bool = true
    @State private var pass = ""
    @State var isVaildPassId: Bool = false
    @State private var selection: Int? = nil
    
    var body: some View {
        
        NavigationView{
            VStack {
                VStack(spacing: 10)  {
                    ZenLogo()
                    Text("Energy in your hand")
                        .padding(.bottom, 30)
                    LeftText("아이디(이메일)")
                    CustomTextField(placeholder: "이메일을 입력해주세요.", text: $id, isValid: $isVaildId, notValidText: .constant("아이디(이메일)는 이메일 형식으로 입력해주세요."))
                    LeftText("비밀번호")
                    SecurityTextField(placeholder: "비밀번호를 입력해주세요.", text: $pass)
                }.padding(.bottom, 60)
                
                VStack {
                    CustomButton(title: "로그인", backgroundColor: .black, foregroundColor: .white) {
                        // 버튼이 눌렸을 때 실행될 코드
                    }
                    CustomButton(title: "카카오 로그인", backgroundColor: .yellow, foregroundColor: .white) {
                        // 버튼이 눌렸을 때 실행될 코드
                    }
                    CustomButton(title: "네이버 로그인", backgroundColor: .green, foregroundColor: .white) {
                        // 버튼이 눌렸을 때 실행될 코드
                    }
                    CustomButton(title: "Apple 로그인", backgroundColor: .black, foregroundColor: .white) {
                        // 버튼이 눌렸을 때 실행될 코드
                    }
                }
                HStack {
                    Spacer()
                    NavigationLink(
                        destination: JoinNameView(),
                        tag: 1,
                        selection: $selection,
                        label: { Text("회원 가입").foregroundColor(.black)}
                    )
                    
                    NavigationLink(destination: JoinTermView()) {
                        Text("회원 가입").foregroundColor(.black)
                    }
                    
                    Spacer()
                    Text("계정 찾기 - 비밀번호")
                }
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct ZenLogo :View {
    var body: some View {
        Image("zentropy_text_logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.8)
    }
}

//
//  JoinName.swift
//  study
//
//  Created by 손찬희 on 2023/05/05.
//

import SwiftUI

struct JoinSnsPhoneView: View {
    @State private var phone = ""
    @State private var authCode = ""
    @State private var isValidPhone:Bool = false
    var body: some View {
        VStack{
            PageTitle(title:"회원 가입")
            VStack(spacing:10) {
                LeftText("휴대폰번호")
                HStack(alignment: .top){
                    CustomTextField(placeholder: "휴대폰 번호를 입력해주세요.", text: $phone, isValid: $isValidPhone, notValidText: .constant("번호 형식이 틀립니다."))
                 
                    CustomButton(title: "인증요청", backgroundColor: .black, foregroundColor: .white,isRound: true,isFitText: true) {
                        // 버튼이 눌렸을 때 실행될 코드
                    }
                    .padding(.top, 1)
                    
                }
                LeftText("인증번호")
                CustomTextField(placeholder: "인증번호를 입력해주세요.", text: $authCode, isValid: $isValidPhone, notValidText: .constant("인증 번호가 틀렸습니다."))
             
            }.padding(.bottom, 120)
            Spacer()
          
            
            CustomButton(title: "다음", backgroundColor: .black, foregroundColor: .white) {
                // 버튼이 눌렸을 때 실행될 코드
            }
        }.padding()
    }
}

struct JoinSnsPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        JoinSnsPhoneView()
    }
}

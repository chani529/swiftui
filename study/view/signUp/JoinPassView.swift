//
//  JoinPassView.swift
//  study
//
//  Created by 손찬희 on 2023/05/07.
//

import SwiftUI

struct JoinPassView: View {
    @EnvironmentObject var router: Router
    @State private var pass = ""
    @State private var passCheck = ""
    @State private var isValidPass:Bool = false
    @State private var isLinkActive:Bool = false
    
    var body: some View {
        VStack(spacing: 10){
            PageTitle(title:"회원 가입",subTitle: "4 / 4")
            LeftText("비밀번호")
            SecurityTextField(placeholder: "영어+숫자 10자리 이상", text: $pass, isValid: $isValidPass, notValidText: .constant("비밀번호 틀렸습니다."))

            LeftText("비밀번호 확인")
            SecurityTextField(placeholder: "비밀번호 한 번 더 입력해주세요.", text: $passCheck, isValid: $isValidPass, notValidText: .constant("비밀번호 확인이 틀렸습니다."))
            
            Spacer()
            CustomButton(title: "확인", backgroundColor: .black, foregroundColor: .white) {
                router.clear()
            }
        }
        .padding()
        
    }
}

struct JoinPassView_Previews: PreviewProvider {
    static var previews: some View {
        JoinPassView()
    }
}

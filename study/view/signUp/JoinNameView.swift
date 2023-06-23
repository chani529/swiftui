//
//  JoinNameView.swift
//  study
//
//  Created by 손찬희 on 2023/05/06.
//

import SwiftUI

struct JoinNameView: View {
    @EnvironmentObject var router: Router
    @State private var name = ""
    @State private var isValidName :Bool = false
    @State var isLinkActive: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                PageTitle(title:"회원 가입",subTitle: "1 / 4")
            }
            VStack(spacing: 20){
                LeftText("이름")
                CustomTextField(placeholder: "이름을 입력해주세요.", text: $name, isValid: $isValidName, notValidText:.constant("인증 번호가 틀렸습니다."))
                Spacer()
                
                CustomButton(title: "동의하고 가입하기", backgroundColor: .black, foregroundColor: .white) {
                    router.gotoJoinView(joinViews: JoinViews.JoinSnsPhoneView)
                }
            }
        }
        .padding()
    }
}

struct JoinNameView_Previews: PreviewProvider {
    static var previews: some View {
        JoinNameView()
    }
}

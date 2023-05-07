//
//  JoinIdView.swift
//  study
//
//  Created by 손찬희 on 2023/05/07.
//

import SwiftUI

struct JoinIdView: View {
    @EnvironmentObject var router: Router
    @State private var id = ""
    @State private var isValidId:Bool = false
    @State var isLinkActive: Bool = false
    var body: some View {
        VStack{
            PageTitle(title:"회원 가입",subTitle: "3 / 4")
            LeftText("아이디 (이메일)")
            CustomTextField(placeholder: "example@gmail.com", text: $id, isValid: $isValidId, notValidText: .constant("이메일 양식이 틀렸습니다."))
            
            Spacer()
            CustomButton(title: "다음", backgroundColor: .black, foregroundColor: .white) {
                router.gotoView(views: Views.JoinPassView)
            }
        }.padding()
    }
}

struct JoinIdView_Previews: PreviewProvider {
    static var previews: some View {
        JoinIdView()
    }
}

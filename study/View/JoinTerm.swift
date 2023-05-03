//
//  JoinTerm.swift
//  study
//
//  Created by 손찬희 on 2023/05/04.
//

import SwiftUI

struct JoinTerm: View {
    @State var isChecked: Bool = false
    var body: some View {
       
        VStack (alignment: .leading){
            Text("약관 동의")
                .bold()
                .font(.system(size: 30))
                .padding(.bottom, 30)
            VStack {
                Checkbox(title: "전체 약관에 동의합니다.", isChecked: $isChecked, isExistAction: false)
                Divider()
                Checkbox(title: "개인정보 취급방침 (필수)", isChecked: $isChecked){}
                Checkbox(title: "서비스 이용약관 (필수)", isChecked: $isChecked){}
                Checkbox(title: "위치정보 서비스 이용약관 (필수)", isChecked: $isChecked){}
                Checkbox(title: "마케팅 수집 동의 (선택)", isChecked: $isChecked){}
            }.padding(.bottom, 120)
                
          
            
            CustomButton(title: "동의하고 가입하기", backgroundColor: .black, foregroundColor: .white) {
                // 버튼이 눌렸을 때 실행될 코드
            }
        }
        .padding()
    }
      
}

struct JoinTerm_Previews: PreviewProvider {
    static var previews: some View {
        JoinTerm()
    }
}

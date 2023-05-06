//
//  JoinTerm.swift
//  study
//
//  Created by 손찬희 on 2023/05/04.
//

import SwiftUI

struct JoinTermView: View {
    @State var isChecked: Bool = false
    @State private var selection: Int? = nil
    var body: some View {
       
        VStack (alignment: .leading){
            PageTitle(title:"약관 동의")
            VStack {
                Checkbox(title: "전체 약관에 동의합니다.", isChecked: $isChecked, isExistAction: false)
                Divider()
                Checkbox(title: "개인정보 취급방침 (필수)", isChecked: $isChecked){}
                Checkbox(title: "서비스 이용약관 (필수)", isChecked: $isChecked){}
                Checkbox(title: "위치정보 서비스 이용약관 (필수)", isChecked: $isChecked){}
                Checkbox(title: "마케팅 수집 동의 (선택)", isChecked: $isChecked){}
            }.padding(.bottom, 120)
            Spacer()
            NavigationLink(
                destination: JoinNameView(),
                tag: 2,
                selection: $selection,
                label: { EmptyView() }
            )
            CustomButton(title: "동의하고 가입하기", backgroundColor: .black, foregroundColor: .white) {self.selection = 2}
          
            Spacer()
        }
        .padding()
        
        .navigationBarItems(trailing:
            Button(action: {
                print("Edipt button tapped")
            }) {
                Image(systemName: "xmark")
            }
        )
    }
      
}

struct JoinTermView_Previews: PreviewProvider {
    static var previews: some View {
        JoinTermView()
    }
}

//
//  CheckBox.swift
//  study
//
//  Created by 손찬희 on 2023/05/04.
//

import SwiftUI

struct Checkbox: View {
    let title: String
     @Binding var isChecked: Bool
     let action: (() -> Void)?
     let isExistAction: Bool
     
     init(title: String, isChecked: Binding<Bool>, action: (() -> Void)? = nil, isExistAction: Bool = true) {
         self.title = title
         self._isChecked = isChecked
         self.action = action
         self.isExistAction = isExistAction
     }
    
    var body: some View {
        HStack{
           Toggle(title, isOn: $isChecked)
               .toggleStyle(CheckboxToggleStyle())
           Spacer()
           if(isExistAction){
               Button(action: action ?? {}) {
                   Text("보기")
               }
           }
       }
    }
}


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(configuration.isOn ? "icn_checkbox_on" : "icn_checkbox_off")
                .resizable()
                .frame(width: 24, height: 24)
            configuration.label
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(title: "전체 약관에 동의합니다.", isChecked: .constant(false))
    }
}

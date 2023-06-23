//
//  SecurityTextField.swift
//  study
//
//  Created by 손찬희 on 2023/05/05.
//

import SwiftUI

struct SecurityTextField: View {
    let placeholder: String
    var text: Binding<String>
    var isValid: Binding<Bool>
    var notValidText: Binding<String>
    
    init(placeholder: String, text: Binding<String>, isValid: Binding<Bool> = .constant(true), notValidText: Binding<String> = .constant("")) {
        self.placeholder = placeholder
        self.text = text
        self.isValid = isValid
        self.notValidText = notValidText
    }
    
    var body: some View {
        VStack{
            SecureField(placeholder, text: text)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(isValid.wrappedValue ? Color.black : Color.red, lineWidth: 1))
                if !isValid.wrappedValue {
                    Text(notValidText.wrappedValue)
                        .font(.caption)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
        }
     
    }
}

struct SecurityTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecurityTextField(placeholder: "이메일을 입력해주세요.", text: .constant("TEST"), isValid: .constant(false),notValidText: .constant("실패 문구"))
    }
}

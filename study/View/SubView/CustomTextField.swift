//
//  CustomTextField.swift
//  study
//
//  Created by 손찬희 on 2023/05/04.
//
import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    let text: Binding<String>
    
    var body: some View {
        TextField(placeholder, text: text)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

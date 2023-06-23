//
//  LeftText.swift
//  study
//
//  Created by 손찬희 on 2023/05/04.
//
import SwiftUI

struct LeftText: View {
    let text: String
    let fontSize: CGFloat
    
    init(_ text: String, fontSize: CGFloat = 20) {
        self.text = text
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct LeftText_Previews: PreviewProvider {
    static var previews: some View {
        LeftText("아이디(이메일)")
    }
}

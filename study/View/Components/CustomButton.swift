//
//  CustomButton.swift
//  study
//
//  Created by 손찬희 on 2023/05/03.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void
    let isRound: Bool
    let isFitText: Bool
    
    init(title: String, backgroundColor: Color, foregroundColor: Color, isRound: Bool = false, isFitText: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.action = action
        self.isRound = isRound
        self.isFitText = isFitText
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .modifier(CustomFrameModifier(active: isFitText))
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(isRound ? 25 : 10)
        }
    }
}

struct CustomFrameModifier : ViewModifier {
    var active : Bool
    
    @ViewBuilder func body(content: Content) -> some View {
        if active {
            content
        } else {
            content.frame(maxWidth: .infinity)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "버튼 텍스트", backgroundColor: .black, foregroundColor: .white) {
            print("123")
            // 버튼이 눌렸을 때 실행될 코드
        }
    }
}

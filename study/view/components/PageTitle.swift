//
//  PageTitle.swift
//  study
//
//  Created by 손찬희 on 2023/05/05.
//

import SwiftUI

struct PageTitle: View {
    let title: String
    var subTitle: String?
    var body: some View {
        HStack(alignment: .center){
            Text(title)
                .bold()
                .font(.system(size: 30))
            if let subTitle = subTitle {
                  Text(subTitle)
                      .foregroundColor(Color.black)
              }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 60)
        .padding(.top, 20)

    }
}

struct PageTitle_Previews: PreviewProvider {
    static var previews: some View {
        PageTitle(title: "TEST",subTitle: "123")
    }
}


//
//  PageTitle.swift
//  study
//
//  Created by 손찬희 on 2023/05/05.
//

import SwiftUI

struct PageTitle: View {
    let title: String
    var body: some View {
        
        Text(title)
            .bold()
            .font(.system(size: 30))
            .padding(.bottom, 60)
            .padding(.top, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct PageTitle_Previews: PreviewProvider {
    static var previews: some View {
        PageTitle(title: "TEST")
    }
}


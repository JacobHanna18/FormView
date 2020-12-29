//
//  StringSub1.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct AbstractSub: View {
    var title : String?
    var subtitle : String
    var tap : (() -> ())?
    var body: some View {
        HStack{
            CellTitleView(title: title)
            Text(subtitle)
        }.onTapGesture(perform: {
            tap?()
        })
    }
}

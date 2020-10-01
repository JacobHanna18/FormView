//
//  StringTitle.swift
//  FormView
//
//  Created by Jacob Hanna on 29/09/2020.
//

import SwiftUI

struct StringTitle: View {
    let cell : FormCell
    var body: some View {
        
        HStack {
            Text(cell.title ?? "error")
                .multilineTextAlignment(.center)
                .padding(.trailing)
            Spacer()
        }
    }
}

struct StringTitle_Previews: PreviewProvider {
    static var previews: some View {
        StringTitle(cell: FormCell(type: .StringTitle, title: "DemoTitle"))
    }
}

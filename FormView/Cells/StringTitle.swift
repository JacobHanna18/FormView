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
        
        CellTitleView(title: cell.title)
    }
}

struct StringTitle_Previews: PreviewProvider {
    static var previews: some View {
        StringTitle(cell: FormCell(type: .StringTitle, title: "DemoTitle"))
    }
}

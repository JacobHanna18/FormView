//
//  ImageCell.swift
//  MusicInfo
//
//  Created by Jacob Hanna on 07/12/2020.
//

import SwiftUI

struct ImageCell: View {
    let cell : FormCell
    var img : UIImage {
        switch cell.type {
        case let .Image(image: img_):
            return img_
        default:
            return UIImage(systemName: "xmark.octagon.fill")!
        }
    }
    var body: some View {
        Image(uiImage: img).resizable()
            .aspectRatio(contentMode: .fit).cornerRadius(8)
    }
}

//
//  QuizViewControllerPreview.swift
//  MovieQuizSE
//
//  Created by Roman Yaschenkov on 27.04.2026.
//

import Foundation

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct QuizViewControllerPreview: PreviewProvider {
    static var devices = ["iPhone SE", "iPhone 11 Pro Max"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { deviceName in
            QuizViewController().toPreview().previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
#endif

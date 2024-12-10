//
//  ProgressBar.swift
//  MiniBanco
//
//  Created by ArcaneHollow on 12/11/24.
//

import SwiftUI

struct ProgressBar: View {
    var progress: [Double]
    var body: some View {
        HStack {
            ProgressView(value: progress[0])
                .progressViewStyle(LinearProgressViewStyle(tint: Color.popLightBlue))
                .frame(height: 4)
            ProgressView(value: progress[1])
                .progressViewStyle(LinearProgressViewStyle(tint: Color.popLightBlue))
                .frame(height: 4)
            ProgressView(value: progress[2])
                .progressViewStyle(LinearProgressViewStyle(tint: Color.popLightBlue))
                .frame(height: 4)
            ProgressView(value: progress[3])
                .progressViewStyle(LinearProgressViewStyle(tint: Color.popLightBlue))
                .frame(height: 4)
            Image(systemName: "questionmark.circle.fill")
                .foregroundColor(Color.popLightBlue)
        }
        .padding(.horizontal)
        .padding(.leading, 3)
    }
}

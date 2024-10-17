//
//  String+Ext.swift
//  TripManager
//
//  Created by olivier geiger on 02/10/2024.
//

import Foundation
import SwiftUI

extension String {
  func textView(style: AppStyles.TextStyles, overrideColor: Color? = nil, multiligneAligment: TextAlignment = .leading, lineLimit: Int? = nil) -> some View {
    Text(self)
      .foregroundColor(overrideColor ?? style.defaultColor)
      .font(style.font)
      .lineLimit(lineLimit)
      .multilineTextAlignment(multiligneAligment)
  }
}


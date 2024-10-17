//
//  AppStyle.swift
//  TripManager
//
//  Created by olivier geiger on 02/10/2024.
//

import SwiftUI

struct AppStyles {
    enum Padding: CGFloat {
        case verySmall8 = 8
        case small16 = 16
        case medium24 = 24
        case large32 = 32
    }

    enum TextStyles {
        case title, sectionTile, buttonCTA, description, navigationTitle, navigationAction

        var size: CGFloat {
            switch self {
            case .title: return 37
            case .sectionTile: return 22
            case .buttonCTA: return 16
            case .description: return 20
            case .navigationTitle: return 28
            case .navigationAction: return 18
            }
        }

        var font: Font {
            switch self {
            case .title, .sectionTile, .navigationTitle: return Font.custom(R.font.avenirNextBold, size: size)
            case .buttonCTA, .navigationAction: return Font.custom(R.font.avenirNextDemiBold, size: size)
            case .description: return Font.custom(R.font.avenirNextRegular, size: size)
            }
        }

        var defaultColor: Color {
            switch self {
            case .title, .sectionTile, .navigationTitle: return Color(R.color.primaryText)
            case .buttonCTA: return .white
            case .description: return Color(R.color.secondaryText)
            case .navigationAction: return Color(R.color.primaryBlue)
            }
        }
    }
}

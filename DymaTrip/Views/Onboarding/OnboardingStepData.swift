//
//  OnboardingStepData.swift
//  TripManager
//
//  Created by olivier geiger on 16/10/2024.
//

import Foundation
import SwiftUI

struct OnboardingStepData: Identifiable {
    let id: Int
    let title: String
    let description: String
    let image: Image
    
    static func allValues() -> [OnboardingStepData] {
        [
            OnboardingStepData(
                id: 0,
                title: NSLocalizedString("onboarding.step1.title", comment: "Titre de l'étape 1"),
                description: NSLocalizedString("onboarding.step1.description", comment: "Description de l'étape 1"),
                image: Image(.onboarding1)),
            OnboardingStepData(
                id: 1,
                title: NSLocalizedString("onboarding.step2.title", comment: "Titre de l'étape 2"),
                description: NSLocalizedString("onboarding.step2.description", comment: "Description de l'étape 2"),
                image: Image(.onboarding2)),
            OnboardingStepData(
                id: 2,
                title: NSLocalizedString("onboarding.step3.title", comment: "Titre de l'étape 3"),
                description: NSLocalizedString("onboarding.step3.description", comment: "Description de l'étape 3"),
                image: Image(.onboarding3))
        ]
    }
}

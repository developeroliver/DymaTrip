//
//  OnboardingView.swift
//  TripManager
//
//  Created by olivier geiger on 16/10/2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage(UserDefaultKeys.onboardingCompleted.rawValue)
    var onboardingCompleted = false
    @State private var index = 0
    private let stepsData = OnboardingStepData.allValues()
    private let stepImageBottomSpacing: CGFloat = 80
    private let pageControlSelectedSize: CGFloat = 10
    private let pageControlNotSelectedSize: CGFloat = 8
    private let pageControlStokeWidth: CGFloat = 1
    private let tabViewBottomSpacing: CGFloat = 80

    var body: some View {
        ZStack {
            Color(R.color.mainBackground.name)
                .ignoresSafeArea()
            ZStack(alignment: .bottom) {
                TabView(selection: $index) {
                    ForEach(stepsData) { stepData in
                        stepView(data: stepData)
                            .ignoresSafeArea(edges: .top)
                            .tag(stepData.id)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea(edges: .top)
                .padding(.bottom, tabViewBottomSpacing)
                VStack(spacing: AppStyles.Padding.small16.rawValue) {
                    pageControl()
                    buttonsView()
                }
                .padding(.bottom, AppStyles.Padding.verySmall8.rawValue)
            }
        }
    }
    
    @ViewBuilder
    func pageControl() -> some View {
        HStack(spacing: AppStyles.Padding.verySmall8.rawValue) {
            ForEach(0..<stepsData.count, id: \.self) { pageIndex in
                Circle()
                    .stroke(Color.accentColor, lineWidth: pageControlStokeWidth)
                    .fill(index == pageIndex ? Color.accentColor : Color.white)
                    .frame(width: index == pageIndex ? pageControlSelectedSize : pageControlNotSelectedSize,
                           height: index == pageIndex ? pageControlSelectedSize : pageControlNotSelectedSize)
            }
        }
    }
    
    @ViewBuilder
    func buttonsView() -> some View {
        HStack {
            switch index {
            case stepsData.count - 1:
                Button(action: {
                    onboardingCompleted = true
                }, label: {
                    Text(NSLocalizedString("onboarding.button.start", comment: "Button Start"))
                }).buttonStyle(PrimaryButton())
            default:
                Button(action: {
                    withAnimation {
                        onboardingCompleted = true
                    }
                }, label: {
                    Text(NSLocalizedString("onboarding.button.skip", comment: "Button Skip"))
                }).buttonStyle(SecondaryButton())
                Button(action: {
                    withAnimation {
                        if index < stepsData.count - 1 {
                            index += 1
                        }
                    }
                }, label: {
                    Text(NSLocalizedString("onboarding.button.next", comment: "Button Next"))
                }).buttonStyle(PrimaryButton())
            }
        }
    }

    @ViewBuilder
    func stepView(data: OnboardingStepData) -> some View {
        ZStack(alignment: .bottom) {
            GeometryReader { geometry in
                data.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width)
                    .frame(maxHeight: geometry.size.height - stepImageBottomSpacing)
            }
            VStack {
                data.title.textView(style: .title, multiligneAligment: .center)
                data.description.textView(style: .description, multiligneAligment: .center)
                    .padding(.bottom, AppStyles.Padding.small16.rawValue)
            }.padding(.horizontal, AppStyles.Padding.medium24.rawValue)
        }
    }
}

#Preview {
    OnboardingView()
}

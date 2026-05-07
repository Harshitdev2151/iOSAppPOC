//
//  JailbreakBlockedView.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 07/05/26.
//

import SwiftUI

struct JailbreakBlockedView: View {

    var body: some View {

        VStack(spacing: 24) {

            Image(systemName: SystemImages.lockShield)
                .font(.system(size: 70))
                .foregroundColor(.red)

            Text(AppStrings.securityRiskTitle)
                .font(.title)
                .fontWeight(.bold)
                .accessibilityIdentifier("securityTitle")

            Text(AppStrings.jailbreakMessage)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text(AppStrings.secureDeviceMessage)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

//
//  AppRootView.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 07/05/26.
//

import SwiftUI

var isUITestJailbroken: Bool {
    ProcessInfo.processInfo.arguments.contains("-jailbroken")
}
struct AppRootView: View {

    private let security: DeviceSecurity

    init(
        security: DeviceSecurity = JailbreakService()
    ) {
        self.security = security
    }

    var body: some View {

        if isUITestJailbroken ||
            security.isJailbroken() {

            JailbreakBlockedView()

        } else {

            let network = NetworkMonitor()
            let api = APIService()

            let repo = PostRepositoryImpl(
                api: api,
                network: network
            )

            let useCase = FetchPostsUseCaseImpl(
                repository: repo
            )

            ContentView(
                vm: PostViewModel(
                    useCase: useCase
                )
            )
        }
    }}

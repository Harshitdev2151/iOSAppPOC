//
//  LBGSystemiOSTestApp.swift
//  LBGSystemiOSTest
//
//  Created by Harshit Kumar on 05/05/26.
//

import SwiftUI

@main
struct LBGSystemiOSTestApp: App {
    var body: some Scene {
            WindowGroup {

                let api = APIService()
                let repo = PostRepositoryImpl(api: api)
                let useCase = FetchPostsUseCaseImpl(repository: repo)
                let network = NetworkMonitor()

                ContentView(
                    vm: PostViewModel(
                        useCase: useCase,
                        network: network
                    )
                )
            }
        }
}

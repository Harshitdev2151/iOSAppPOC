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

                let network = NetworkMonitor()
                let api = APIService()
                let repo = PostRepositoryImpl(api: api, network: network)
                let useCase = FetchPostsUseCaseImpl(repository: repo)

                ContentView(vm: PostViewModel(useCase: useCase))
            }
        }
}

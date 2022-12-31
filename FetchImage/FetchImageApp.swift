//
//  FetchImageApp.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/14/22.
//

import SwiftUI

@main
struct FetchImageApp: App {

    var body: some Scene {
        WindowGroup {
#if MOCK
            ImageView(viewModel: FetchImageViewModel(imageAction: MockImageActionImplementation()))
#else
            ImageView(viewModel: FetchImageViewModel(imageAction: ImageActionImplementation()))
#endif
        }
    }
}

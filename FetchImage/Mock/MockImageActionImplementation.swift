//
//  MockImageActionImplementation.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/16/22.
//

import Combine

class MockImageActionImplementation: ImageAction {
    func getImages() -> AnyPublisher<[ImageInfo], Error> {
        let ImageInfos = [
            ImageInfo(urls: Urls(regular: "https://images.unsplash.com/photo-1668570000683-aa421ea758a2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA2ODl8MHwxfGFsbHwyOHx8fHx8fHx8MTY2ODY1NDk1MQ&ixlib=rb-4.0.3&q=80&w=1080")),
            ImageInfo(urls: Urls(regular: "https://images.unsplash.com/photo-1668556102531-2521a0de30e4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA2ODl8MHwxfGFsbHwyOXx8fHx8fHx8MTY2ODY1NDk1MQ&ixlib=rb-4.0.3&q=80&w=1080"))
        ]
        
        return Just(ImageInfos)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

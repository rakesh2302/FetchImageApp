//
//  BaseAPI.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/14/22.
//

import Foundation
import Combine

class BaseAPI {

    // MARK: Public static Property

    public static var imageURL = "https://api.unsplash.com/photos/?client_id=CtLCzp0idg2iYpl3TGfcZC1lHkJGGq5Nxyk4VN_VZRM&order_by=ORDER&per_page=100"

    class func getImages() -> AnyPublisher<[ImageInfo], Error> {
        guard let url = URL(string: imageURL) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                
                return data
            }
            .decode(type: [ImageInfo].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

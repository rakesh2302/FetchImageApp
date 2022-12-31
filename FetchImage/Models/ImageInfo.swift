//
//  ImageInfo.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/14/22.
//

import Foundation

struct ImageInfo: Codable, Identifiable, Hashable {
    public var id = UUID()
    public var urls: Urls
    
    private enum CodingKeys: String, CodingKey {
        case urls
    }
}

struct Urls: Codable, Identifiable, Hashable {
    public var id = UUID()

    var regular: String
//    var regularUrl: URL {
//        return URL(string: regular)!
//    }
    
    private enum CodingKeys: String, CodingKey {
        case regular
    }
}

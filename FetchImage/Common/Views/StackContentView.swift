//
//  StackContentView.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/17/22.
//

import SwiftUI

struct StackContentView< Content: View>: View {
    var state = false
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        if state {
            HStack(
                content: content
            )
        } else {
            VStack(
                content: content
            )
        }
    }
}

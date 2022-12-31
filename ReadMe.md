# FetchImage


## Introduction

This app shows a list of images. Image list are available in vertical and horizontal alignment.

 
 ## Architecture:

● Clean approach / loosely coupled architecture
● MVVM design pattern
● Combine FrameWork - Reactive programming
● Code is separated into three layers
        ○ Presentation layer - Model, View, ViewModel
        ○ Action layer - Interface and Service
        ○ Network layer - APIs
● Added SwiftLint script in build phases
        ○ Using this Project will always follow the clean code standard 

## Unit tests / Mock Tests

There is Mock Interface under Mock Group Project structure. These provides test inputs used to test.
● Here Code is separated into three layers
        ○ Presentation layer - Model, Screen, Data binding
        ○ Mock Action layer - Interface and Service
        ○ Mock layer
        
Mock data does not use services so there is no Network layer. 
There is unit test as well in order to test API response.

## API:
● Display a list of Images using https://api.unsplash.com/photos/?client_id=CtLCzp0idg2iYpl3TGfcZC1lHkJGGq5Nxyk4VN_VZRM&order_by=ORDER&per_page=100

## Programming Language/SDK Usage:
● Swift Language
● Native iOS SWiftUI
● Xcode tool - 14
● iOS 16

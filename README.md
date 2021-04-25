# EventGroup

EventGroup is an amazing app that can get you the latest events happening in the states!

## API usage

https://platform.seatgeek.com/#events

## Description

This app is written in Swift (UIKit)

There are three main controllers.
1. NavigationController (MainVC). It is mostly empty
2. TableViewController (TVC). 
3. ViewController (detailVC). A detail view for each table cell

We also have a UISearchController in code embedded in TableViewController (TVC), it gives us the searchBar on the top of the tableView cells. 

## Library
1. [SwiftyJSON](https://cocoapods.org/pods/SwiftyJSON#initialization):
    The usual Codable protocol has proven to be rather complicated. SwiftyJSON has provided me with great visibility
    to get me the values I want.

2. [Realm](https://realm.io/):
    This database is powerful and easy to pick up compared to CoreData. It provides me with the persistence I want across the app launches.
    I also use Realm studio to actually look at the database itself.
    
**NOTE:** I use cocoapods for third-party libraries. Therefore, you would see podfile and xcworkspace file. It would also take
longer to compile for the first time.

## Animation

When you scroll down, the table view cells will appear gradually

## Build and Deployment target

This project is built in Xcode 12.4, Tested on iPhone 12 simulator

Deployment target : iOS 12.1 (By implementing  @available(iOS 13.0, *) to AppDelegate and SceneDelegate)



## Branches

Main:           The branch that I'm currently working on. This branch has incorporated CoreData model, but I've met a lot of difficulties when using CoreData and Codable together. For example, when setting event entity to be transformable, I met issue with NSSecureCoding because I use NSSecureUnarchieveFromData transformer, an area that I'm not familiar with

Production: Fully runnable. However, it does not have persistance across app launches. 

**NOTE**: When testing, please use production branch. I will continue to debug and push to the main branch.  


## Current Issues

The current build will pop up error message

```swift
EventGroup[21343:1321333] [] nw_protocol_get_quic_image_block_invoke dlopen libquic failed
```

I suspect it is a error when getting an image from URL in "TVC.swift"

## Conclusion

It has been an amazing coding challenge and an awesome learning opportunity. There are still a lot of areas that I'm not familiar with, but I'm catching up to my best ability!

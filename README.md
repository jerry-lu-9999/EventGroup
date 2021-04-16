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

The app also uses Core Data to persist between app launches. 

## Build and Deployment target

This project is built in Xcode 12.4
Deployment target : iOS 12.1




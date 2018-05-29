//
//  AppDelegate.swift
//  Swift4
//
//  Created by Anurag Gusain on 22/05/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

@UIApplicationMain


class AppDelegate: UIResponder, UIApplicationDelegate {

    enum device
    {
        case iphone
        case ipad
        case iwatch
        case ipod
    }
    
    enum iOSDeviceType {
        case iPhone(String)
        case iPad(String)
        case iWatch
    }
    
    enum Direction: Int {
        case up = 1
        case down // will have the raw value 2
        case left // will have the raw value 3
        case right // will have the raw value 4
    }
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let team = "red pepper"
        switch team{
        case "nothing":
            print("this is wrong")
        case let x where x.hasSuffix("red"):
            print("correct")
        default:
            print("default")
        }
        
        let quote = """
        there is a king name "aurthur" he lives
        in a small village with all the people
        around him loves him
        """
        print(quote)
        
        var shoppingList = ["catfish", "water", "tulips", "blue paint"]
        shoppingList[1] = "bottle of water"
        print(shoppingList)
        
        let nickName: String? = nil
        let fullName: String = "John Appleseed"
        let informalGreeting = "Hi \(nickName ?? fullName)"
        print(informalGreeting)
        
        for i in stride(from: 1, to: 10, by: 3) {
            print(i)
        }
        
        for i in stride(from: 3, to: 0, by: -1) {
            print(i)
        }
        
        print("BAT", terminator: "") // prints BAT
        print("MAN", terminator: "") // prints MAN
        print("")
        
        var numbers: [Int] = [1, 2, 3, 4, 5, 6,200,900,12,4,0]
        numbers[4...5] = [0, 0]
        numbers += [7]
        print(numbers)
        
        numbers.sort(by: <)
        print("sorted by <  \(numbers)")
        
        numbers.sort(by: >)
        print("sorted by > \(numbers)")
        
        numbers.sort(by: { x, y in
            return x < y
        })
        
        print("sorted by x,y \(numbers)")
        printNumber(not: 4);
        
        let strings = numbers.map { "\($0)" }
        print(strings)
        
        let evenNumbers = numbers.filter { $0 % 2 == 0 }
        print(evenNumbers)
        
        let oddNumbers = numbers.filter { $0 % 2 != 0 }
        print(oddNumbers)
        
        var sum = numbers.reduce(0, +)
        sum = numbers.reduce(0){$0+$1}
        
        print(sum)
        //enums
        
        let myDevice: device = .iphone
        
        // in this case the type can be inferred
        if myDevice == .iphone {
            print("I have an iPhone!")
        }
        
        var myDevice2: iOSDeviceType = iOSDeviceType.iPhone("6")
        if(2>3){
           myDevice2 = .iWatch
        }
        switch myDevice2 {
        case .iPhone(let model):
            print("iPhone \(model)")
        case .iPad(let model):
            print("iPad \(model)")
        case .iWatch:
            print("iWatch")
        default:
            print("not an iOS device")
        }
        
        let direction = Direction(rawValue: 4)
        print(direction ?? 3)
        
        print(hasAnyMatches(list: numbers, condition: greaterThan100))
        
        return true
    }

    
    func printNumber(not number: Int) {
        var number = number
        number += 1
        print(number)
    }
    
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    func greaterThan100(number: Int) -> Bool {
        return number > 100
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


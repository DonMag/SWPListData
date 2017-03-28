//
//  AppDelegate.swift
//  SWPListData
//
//  Created by Don Mag on 3/28/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

struct EmployeeDetails {
	let functionary: String
	let imageFace: String
	let phone: String
	
	init(dictionary: [String: Any]) {
		self.functionary = (dictionary["Functionary"] as? String) ?? ""
		self.imageFace = (dictionary["ImageFace"] as? String) ?? ""
		self.phone = (dictionary["Phone"] as? String) ?? ""
	}
}
struct Employee {
	let position: String
	let name: String
	let details: [EmployeeDetails] // [String:Any]
	
	init(dictionary: [String: Any]) {
		self.position = (dictionary["Position"] as? String) ?? ""
		self.name = (dictionary["Name"] as? String) ?? ""
		
		let t = (dictionary["Details"] as? [Any]) ?? []
		self.details = t.map({EmployeeDetails(dictionary: $0 as! [String : Any])})
	}
}

struct Shared {
	static var instance = Shared()
	var employees: [Employee] = []
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		// UIApplication didFinishLaunchingWithOptions is a bad place for this, but here it is...
		
		if let url = Bundle.main.url(forResource: "directory", withExtension: "plist"), let array = NSArray(contentsOf: url) as? [[String:Any]] {
			
			Shared.instance.employees = array.map{Employee(dictionary: $0)}

		}
		
		return true
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


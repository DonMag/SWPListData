//
//  Page2.swift
//  SWPListData
//
//  Created by Don Mag on 3/28/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class Page2: UITableViewController {

	var newPage: Employee?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let theEmployee = newPage {
			self.title = theEmployee.name
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let theEmployee = newPage {
			return theEmployee.details.count
		}
		return 0
		
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // as! TableViewCell2
		
		cell.textLabel?.text = "A"
		
		if let theEmployee = newPage {
			cell.textLabel?.text = theEmployee.details[indexPath.row].functionary
			cell.detailTextLabel?.text = theEmployee.details[indexPath.row].phone + "  (" + theEmployee.details[indexPath.row].imageFace + ")"
		}
		
		//		cell.faceImage.image = (Shared.instance.employees[indexPath.row].details[indexPath.row]["ImageFace"] as! UIImage)
		//		cell.functionary.text = (Shared.instance.employees[indexPath.row].details[indexPath.row]["Functionary"] as! String)
		//		cell.phoneLabel.text = (Shared.instance.employees[indexPath.row].details[indexPath.row]["Phone"] as! String)
		
		return cell
	}
	
}

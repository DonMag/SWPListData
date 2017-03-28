//
//  Page1.swift
//  SWPListData
//
//  Created by Don Mag on 3/28/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class Page1: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Employees"
		
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
		return Shared.instance.employees.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //  as! TableViewCell1
		
		cell.textLabel?.text = Shared.instance.employees[indexPath.row].name
		cell.detailTextLabel?.text = Shared.instance.employees[indexPath.row].position
		
		//		cell.nameLabel.text = Shared.instance.employees[indexPath.row].name
		//		cell.positionLabel.text = Shared.instance.employees[indexPath.row].position

		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destination = segue.destination as? Page2,
			let indexPath = tableView.indexPathForSelectedRow {
			destination.newPage = Shared.instance.employees[indexPath.row]
			tableView .deselectRow(at: indexPath, animated: true)
		}
	}


}

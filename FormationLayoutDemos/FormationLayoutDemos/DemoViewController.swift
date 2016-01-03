//
//  ViewController.swift
//  FormationLayoutDemos
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit

class DemoViewController: UITableViewController {

    struct DemoItem {
        let label: String
        let factory: () -> UIViewController
    }
    
    let demoItems = [
        DemoItem(label: "Stack View") { StackViewDemo() }
    ];
    
    override func viewDidLoad() {
        title = "Demos"
        showDemoAt(0)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = demoItems[indexPath.row].label
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        showDemoAt(indexPath.row)
    }
    
    private func showDemoAt(index: Int) {
        let item = demoItems[index]
        let controller = item.factory()
        controller.title = item.label
        navigationController?.pushViewController(controller, animated: true)
    }
    
}


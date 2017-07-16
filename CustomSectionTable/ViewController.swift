//
//  ViewController.swift
//  CustomSectionTable
//
//  Created by Enamul Haque on 7/16/17.
//  Copyright © 2017 erainfoTectLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
 
    
    var arraytable = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
                
        arraytable = [
             ["title":"About Us","detail":"RA-InfoTech Ltd -A Joint Venture IT Company formed by Bank Asia Ltd, Ranks ITT Ltd of Bangladesh and ETA InfoTech LLC, Dubai, a concern of ETA Ascon Group - a Dubai based conglomerate with global presence."],
             ["title":"Contact","detail":"Bengal Center (4th & 6th Floor), 28, Topkhana Road, Dhaka - 1000, Bangladesh"]
        ]
        
        
       
    
        

        tableView.delegate = self
        tableView.dataSource = self
     
         //For Auto Resize Table View Cell;
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Detault Background clear
        tableView.backgroundColor = UIColor.clear
    }
    
  
   
  
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arraytable.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
  
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! CustomCell
   
        cell.tv_title.text = arraytable[indexPath.section]["title"] as! String?
         cell.tv_details.text = arraytable[indexPath.section]["detail"] as! String?
        
        //label height dynamically increase
        cell.tv_details.numberOfLines = 0
        
        
        
        
         //For bottom border to tv_title;
        let frame =  cell.tv_title.frame
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1)
         bottomLayer.backgroundColor = UIColor.black.cgColor
         cell.tv_title.layer.addSublayer(bottomLayer)

        //borderColor,borderWidth, cornerRadius
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
    }

}


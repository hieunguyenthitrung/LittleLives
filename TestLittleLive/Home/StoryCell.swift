//
//  StoryCell.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 23/08/2022.
//

import Foundation
import UIKit


class StoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    var pdfURL = ""
    
    static let identifier = "StoryTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "StoryCell", bundle: nil)
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        
    }
    
    func setContentsForCell(userEvent : UserEvent){
        self.contentLbl.text =  "You has a Story PDF to download " + (userEvent.eventSnapshot as! EventStoryPublishedExported).url
        pdfURL = (userEvent.eventSnapshot as! EventStoryPublishedExported).url
        
    }
    @IBAction func downloadTouchUp(_ sender: Any) {
        Connection.loadFileAsync(url: URL(string: pdfURL)!, completion: {_,_ in
           
        })
    }
}

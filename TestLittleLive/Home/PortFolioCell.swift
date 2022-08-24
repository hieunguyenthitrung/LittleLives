//
//  PortFolioCell.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 22/08/2022.
//

import Foundation
import UIKit
class PortFolioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentLbl: UILabel!
    
    @IBOutlet weak var portfolioImageView: UIImageView!
    
    static let identifier = "PortFolioTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "PortfolioCell", bundle: nil)
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        
    }
    
    func setContentsForCell(userEvent : UserEvent){
        self.contentLbl.attributedText =  NSMutableAttributedString().boldText(userEvent.eventDescription, boldTexts: [(userEvent.eventSnapshot as! EventPortfolio).childName])
        self.portfolioImageView.load(url:  URL(string: (userEvent.eventSnapshot as! EventPortfolio).imageUrl)!)
    }
    
    
}

//
//  ChatRoomTableViewCell.swift
//  ChatApp WithFirebase
//
//  Created by 近江伸一 on 2022/05/19.
//

import UIKit
class ChatRoomTableViewCell:UITableViewCell{
    func tappedSendButton(text: String) {
        
    }
    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = 30
        messageText.layer.cornerRadius = 15
        dateLabel.layer.cornerRadius = 6
        backgroundColor = .clear
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


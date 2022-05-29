
//  ChatRoomViewController.swift
//  ChatApp WithFirebase
//  Created by on 2022/05/19.

//チャットルームのViewを表示させる為のコード

import UIKit
class ChatRoomViewController: UIViewController{
    
    private let cellID = "cellID"
    private var messages = [String]()
    //chatInputAcccessoryViewを下部に設定するコード
    private lazy var chatInputAccessoryView: ChatInputAccessoryView = {
        let view = ChatInputAccessoryView()
        view.frame = .init(x: 0,y: 0,width: view.frame.width,height: 100)
        view.delegate = self
      return view
        
    }()
    @IBOutlet weak var chatRoomTableView: UITableView!
   override func viewDidLoad() {
        super.viewDidLoad()
        chatRoomTableView.delegate = self
        chatRoomTableView.dataSource = self
        //chatRoomTableViewCellを登録して使えるようにするコード（register+nibName,cell identifier）が必要
        chatRoomTableView.register(UINib(nibName: "ChatRoomTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
       chatRoomTableView.backgroundColor = .rgb(red: 118, green: 140, blue: 100, alpha: 1.0
       )
   }
    //accessoryViewをセットするコード（canBecomeFirstRespondor）
    override var inputAccessoryView: UIView?{
        get{
            return chatInputAccessoryView
        }
    }
    override var canBecomeFirstResponder: Bool{
    return true
}
}
extension ChatRoomViewController: ChatInputAccessoryViewDelegate{
    func tappedSendButton(text: String) {
        //message配列にmessageを格納する
        messages.append(text)
        chatInputAccessoryView.removeText()
        chatInputAccessoryView.textView.text = ""
        chatRoomTableView.reloadData()
    }
}
    extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //Cellの高さを高さ25で設定する
        chatRoomTableView.estimatedRowHeight = 25
        //自動的に高さを設定するコード
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatRoomTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ChatRoomTableViewCell
        cell.messageTextView.text = messages[indexPath.row]
        return cell
    }
}

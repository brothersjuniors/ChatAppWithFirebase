//  ChatListViewController.swift
//  ChatApp WithFirebase
//  Created by  on 2022/05/19.

//チャットメンバーリスト

import UIKit
class ChatListViewController:UIViewController{
    private let cellId = "cellId"
    @IBOutlet weak var chatListTableView: UITableView!
     override func viewDidLoad() {
        super.viewDidLoad()
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
   //ios15overのナビゲーションバー色を以前の方法で変更できる様にするコード
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            // NavigationBarの背景色の設定
            appearance.backgroundColor = UIColor.darkGray
            // NavigationBarのタイトルの文字色の設定
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
            let storyboard = UIStoryboard.init(name: "SiggnUp", bundle: nil)
            let signUpViewController = storyboard.instantiateViewController(withIdentifier: "signUpViewController") as! SignUpViewController
            self.present(signUpViewController, animated: true, completion: nil)
        }}}
extension ChatListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatListTableView.dequeueReusableCell(withIdentifier: cellId,for :indexPath)
     return cell
}
   //tapで画面遷移させるコード（storyboardを使って遷移させる）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
      //ChatListViewControllerからChatRoomViewControllerへ遷移する際、storyboardで遷移できるようにする用に遷移先のViewControllerをstoryboardをインスタンスで作成し、chatRoomViewControllerインスタンスを作成後ChatViewControllerに遷移する
        let storyboard = UIStoryboard.init(name: "ChatRoom", bundle: nil)
       //ChatRoomViewControllerをインスタンス化する
        let chatRoomViewController = storyboard.instantiateViewController(withIdentifier: "ChatRoomViewController") as! ChatRoomViewController
       //NavigationControllerからプッシュでChatRoomViewControllerへ遷移するコード
        navigationController?.pushViewController(chatRoomViewController, animated: true)
    }}

//ChatListを表示させるCellを作成
class ChatListTableViewCell:UITableViewCell{
 @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var latestMessage: UILabel!
    @IBOutlet weak var partnerILabel: UILabel!
   @IBOutlet weak var timeLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = 35
   }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }}

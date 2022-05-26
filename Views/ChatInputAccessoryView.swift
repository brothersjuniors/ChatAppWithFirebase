//
//  ChatInputAccessoryView.swift
//  ChatApp WithFirebase
//
//  Created by 近江伸一 on 2022/05/24.
//

import UIKit
// ChatInputAccessoryViewに値渡しするためのプロトコルを宣言

protocol ChatInputAccessoryViewDelegate: class{
    func tappedSendButton(text: String)
}
class ChatInputAccessoryView:UIView{
    
    //Custom Classの紐付けはFirst Ownerで
    //プロパティの紐付けはviewから繋げる
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func tappedSendButton(_ sender: Any) {
        guard let text = textView.text else { return }
        delegate?.tappedSendButton(text: text)

        
    }
    weak var delegate:ChatInputAccessoryViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nibInit()
        setUpView()
        autoresizingMask = .flexibleHeight
    }
    
    private func setUpView(){
        textView.layer.cornerRadius = 15
        textView.layer.backgroundColor = UIColor.rgb(red: 230,green: 230, blue: 230, alpha: 1.0
        ).cgColor
        textView.layer.borderWidth = 1
        sendButton.layer.cornerRadius = 15
        sendButton.imageView?.contentMode = .scaleAspectFill
        sendButton.contentHorizontalAlignment = .fill
        sendButton.contentVerticalAlignment = .fill
        sendButton.isEnabled = false
        textView.text = ""
        textView.delegate = self
    }
    //textViewの可変方法（下記のプロパティとtextViewのscrolling　Enableのチェックを外す）override にautoResisingMaskのコードを追記する
    
    //textViewの下部の高さ調整
    override var intrinsicContentSize: CGSize{
        return .zero
    }
    
    private func nibInit(){
        let nib = UINib(nibName: "ChatInputAccessoryView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        self.addSubview(view)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
        
    }
    //テキストを削除するコード
    func removeText(){
        textView.text = ""
        sendButton.isEnabled = false
        
    }
}
extension ChatInputAccessoryView:UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        print("textView.text:",textView.text as Any)
        if textView.text.isEmpty {
            sendButton.isEnabled = false
              }else{
            sendButton.isEnabled = true
        }
    }
}

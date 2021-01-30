//
//  CommentViewController.swift
//  Instagram
//
//  Created by 辻志保美 on 2021/01/29.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var postData :PostData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //決定ボタンがタップされた時の処理
    @IBAction func commitButton(_ sender: Any) {
        var updateValue: FieldValue
        
        if let comment = textField.text {
            //let commentValue = ["name": postData.name!, "comment": comment]
            //updateValue = FieldValue.arrayUnion([commentValue])
            updateValue = FieldValue.arrayUnion([comment])
            
            // commentに更新データを書き込む
            let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
            postRef.updateData(["comment": updateValue])
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  SlideshowApp
//
//  Created by  葛西 on 2024/08/05.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var susumuButton: UIButton!
    @IBOutlet weak var modoruButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    //　配列に指定するindex番号を宣言
    var nowIndex: Int = 0
    
    //　スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    //　スライドショーさせる画像の配列を宣言
    var imageArray: [UIImage] = [
        UIImage(named: "gazo1.jpg")!,
        UIImage(named: "gazo2.jpg")!,
        UIImage(named: "gazo3.jpg")!,
        UIImage(named: "gazo4.jpg")!,
        UIImage(named: "gazo5.jpg")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
        // タップアクションの有効化
        imageView.isUserInteractionEnabled = true
        
        // imageViewにタップアクションを追加と呼び出すメソッドの追加
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController : ResultViewController = segue.destination as! ResultViewController
        //遷移先のResultViewControllerで宣言しているimgに値を代入して渡す。
        resultViewController.img = imageArray[nowIndex]
    }
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        if (timer == nil) {
            // 次の画像へ
            changeImage()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if (timer == nil) {
            // 前の画像へ
            backImage()
        }
    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            
            // 進むボタンと戻るボタンを無効化
            susumuButton.isEnabled = false
            modoruButton.isEnabled = false
            
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            // タイマーを削除しておく（timer.invalidateだけだとtimerがnilにならないため）
            timer = nil
            
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            
            // 進むボタンと戻るボタンを有効化
            susumuButton.isEnabled = true
            modoruButton.isEnabled = true
        }
    }
    
    @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "toResultView", sender: self)
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @objc func backImage() {
        // indexを減らして表示する画像を切り替える
        nowIndex -= 1

        // indexが最初の数字になったら
        if (nowIndex == 0) {
            // indexを一番最後の数字に戻す
            nowIndex = imageArray.count
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    

}


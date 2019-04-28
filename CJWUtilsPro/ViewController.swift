//
//  ViewController.swift
//  CJWUtilsPro
//
//  Created by Frank on 07/04/2017.
//  Copyright © 2017 Frank. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: QPViewController {

    override func request() {
        print("request")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        
        self.showActionSheet(title: "ff", message: "23", buttons: ["1111","2222","3333","4444"]) { (index) in
            print("idx \(index)")
        }
        
        let img = UIImageView()
        img.image(name: "Guide1")
        view.addSubview(img)
        
        img.topAlign(view: view, predicate: "100")
        img.scaleAspectFit()
        img.centerX(view: view)
        img.width(view: view, predicate: "*0.6")
        img.aspectRatio()
//        QPHttpUtils.sharedInstance.newHttpRequest(url: "http://qp.cenjiawen.com:9090", param: ["abc":"123"], success: { (response) in
//            print("-hello\(response.intValue )")
//        }) {
//        }
        
        
        
        
//        DispatchQueue.main.excute(timeDelay: 1) {
//            print("ficl")
//        }
        
        //        let mgr = Alamofire.SessionManager.default
//        let parameters: Parameters = ["foo": "bar"]
//        mgr.request("http://app.cenjiawen.com", method: HTTPMethod.post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseString { (response) in
//            if let value = response.result.value {
//                print(value)
//            }
//        }
//        
//        let img = UIImage(color: UIColor.red, cornerRadius: 5)!
//        let data = UIImageJPEGRepresentation(img, 1.0)!
//        let url:String = "http://www.cenjiawen.com"
//        if let uuu = URL(string: url) {
//            let request = URLRequest(url: uuu)
//            mgr.upload(data, with: request)
//            
//            
//            mgr.upload(multipartFormData: { (multipartFormData) in
//                multipartFormData.append(data, withName: "image")
//            }, to: url, encodingCompletion: { (encodingResult) in
//                switch encodingResult {
//                case .success(let upload, _, _):
//                    upload.responseJSON { response in
//                        debugPrint(response)
//                    }
//                case .failure(let encodingError):
//                    print(encodingError)
//                }
//            })
//   
//            
//        }
        
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let actionSheet = UIAlertController(title: "title", message: "message", preferredStyle: UIAlertControllerStyle.alert)
//        
//        let comfirmAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default) { (action) -> Void in
//            //            confirm()
//        }
//        actionSheet.addAction(comfirmAction)
//        self.present(actionSheet, animated: true) {
//            //
//        }
        
        
//        let alert = UIAlertController.init(title: "提示", message: "我是弹框..", preferredStyle: .alert)
//        alert.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
//        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: {
//            //
//        })
        
        let actionSheetController: UIAlertController = UIAlertController(title: "Action Sheet", message: "Swiftly Now! Choose an option!", preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        self.present(actionSheetController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


class TV:QPTableViewController{
    override func request() {
        print("hello")
    }
    
    override func cellForRow(atIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let cell = QPTableViewCell()
//        return UITableViewCell()
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}


class CPShopStoryTableViewCell: QPTableViewCell {
    
    let indicateImage = UIImageView()
    let titleLabel = UILabel()
    let blackBackgroundView = UIImageView()
    let logoImage = UIImageView()
    let infoLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layer = logoImage.layer
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.masksToBounds = true
        
        blackBackgroundView.shadowEffect()
    }
    
    override func setupViews(_ view: UIView) {
        view.addSubview(blackBackgroundView)
        view.addSubview(logoImage)
        view.addSubview(titleLabel)
        view.addSubview(indicateImage)
        view.addSubview(infoLabel)
        
        infoLabel.numberOfLines = 0
        
        titleLabel.textColor = UIColor.white
        infoLabel.textColor = UIColor.white
        
        indicateImage.image = UIImage(named: "CP_arrow-forward")
        
        backgroundColor = UIColor.clear
        logoImage.scaleAspectFit()
        
//        titleLabel.font = CPFont.en[.l]
        titleLabel.numberOfLines = 0
//        infoLabel.font = CPFont.cn[.m]
        
    }
    
    override func setupConstrains(_ view: UIView) {
        
        let padding: CGFloat = 9
        
        let scale = Float(100) / Float(27)
        
        blackBackgroundView.leadingAlign(view, predicate: "16")
        blackBackgroundView.trailingAlign(view, predicate: "-16")
        //		blackBackgroundView.heightConstrain("130")
        blackBackgroundView.aspectRatio("*\(scale)")
        blackBackgroundView.topAlign(view, predicate: "8")
        blackBackgroundView.bottomAlign(view, predicate: "-8")
        blackBackgroundView.flk_nameTag = "blackBackgroundView3"
        
        logoImage.leadingAlign(blackBackgroundView, predicate: "8")
        logoImage.topAlign(blackBackgroundView, predicate: "\(padding)")
        logoImage.bottomAlign(blackBackgroundView, predicate: "-\(padding)")
        logoImage.aspectRatio("*\(3.0/4.0)")
        logoImage.flk_nameTag = "logoImage"
        
        indicateImage.topAlign(blackBackgroundView, predicate: "\(padding)")
        indicateImage.heightConstrain("20")
        indicateImage.aspectRatio()
        indicateImage.trailingAlign(blackBackgroundView, predicate: "-4")
        indicateImage.flk_nameTag = "indicateImage"
        
        
        
        infoLabel.topConstrain(titleLabel, predicate: "4")
        infoLabel.leadingAlign(titleLabel, predicate: "0")
        infoLabel.trailingAlign(blackBackgroundView, predicate: "-4")
        infoLabel.bottomAlign(blackBackgroundView, predicate: "-4@500")
        infoLabel.flk_nameTag = "infoLabel"
        
        titleLabel.topAlign(blackBackgroundView, predicate: "\(padding)")
        titleLabel.leadingConstrain(logoImage, predicate: "8")
        titleLabel.trailingConstrain(indicateImage, predicate: "-4")
        titleLabel.flk_nameTag = "titleLabel"
        
    }
    
//    override func setInfo(_ info: NSDictionary) {
//        super.setInfo(info)
//        if let image = info["image"] as? String {
//            self.logoImage.imageWith(image)
//        }
//        
//        if let story = info["brandStory"] as? String {
//            infoLabel.text = "\(story)"
//        } else {
//            if let name = info["name"] as? String {
//                infoLabel.text = "\(name)品牌故事"
//            }
//        }
//        
//        if let engName = info["engName"] as? String {
//            titleLabel.text = engName
//        }
//        
//    }
}


class CPHomeNewOnlineTableViewCell: QPTableViewCell {
    
    
    let lockImage1 = UIImageView()
    let lockImage2 = UIImageView()
    let lockImage3 = UIImageView()
    let lockImage4 = UIImageView()
    
    let reservationImage1 = UIImageView()
    let reservationImage2 = UIImageView()
    let reservationImage3 = UIImageView()
    let reservationImage4 = UIImageView()
    
    let contentInfoView1 = UIView()
    let contentInfoView2 = UIView()
    let contentInfoView3 = UIView()
    let contentInfoView4 = UIView()
    
    let image1 = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let image4 = UIImageView()
    
    let titleLabel1 = UILabel()
    let titleLabel2 = UILabel()
    let titleLabel3 = UILabel()
    let titleLabel4 = UILabel()
    
    let infoLabel1 = UILabel()
    let infoLabel2 = UILabel()
    let infoLabel3 = UILabel()
    let infoLabel4 = UILabel()
    
    let coverView1 = UIView()
    let coverView2 = UIView()
    let coverView3 = UIView()
    let coverView4 = UIView()
    
    let newImage = UIImageView()
    
    var images: [UIImageView] = []
    var titleLabels: [UILabel] = []
    var infoLabels: [UILabel] = []
    var coverViews: [UIView] = []
    
    var contentInfoViews: [UIView] = []
    var lockImages: [UIImageView] = []
    var reservationImages: [UIImageView] = []
    
    override func setupViews(_ view: UIView) {
        view.addSubview(image1)
        view.addSubview(image2)
        view.addSubview(image3)
        view.addSubview(image4)
        
        view.addSubview(coverView1)
        view.addSubview(coverView2)
        view.addSubview(coverView3)
        view.addSubview(coverView4)
        
        view.addSubview(titleLabel1)
        view.addSubview(titleLabel2)
        view.addSubview(titleLabel3)
        view.addSubview(titleLabel4)
        
        view.addSubview(infoLabel1)
        view.addSubview(infoLabel2)
        view.addSubview(infoLabel3)
        view.addSubview(infoLabel4)
        
        view.addSubview(contentInfoView1)
        view.addSubview(contentInfoView2)
        view.addSubview(contentInfoView3)
        view.addSubview(contentInfoView4)
        
        view.addSubview(lockImage1)
        view.addSubview(lockImage2)
        view.addSubview(lockImage3)
        view.addSubview(lockImage4)
        
        view.addSubview(reservationImage1)
        view.addSubview(reservationImage2)
        view.addSubview(reservationImage3)
        view.addSubview(reservationImage4)
        
        view.addSubview(newImage)
        
        images.append(image1)
        images.append(image2)
        images.append(image3)
        images.append(image4)
        
        titleLabels.append(titleLabel1)
        titleLabels.append(titleLabel2)
        titleLabels.append(titleLabel3)
        titleLabels.append(titleLabel4)
        
        infoLabels.append(infoLabel1)
        infoLabels.append(infoLabel2)
        infoLabels.append(infoLabel3)
        infoLabels.append(infoLabel4)
        
        coverViews.append(coverView1)
        coverViews.append(coverView2)
        coverViews.append(coverView3)
        coverViews.append(coverView4)
        
        lockImages.append(lockImage1)
        lockImages.append(lockImage2)
        lockImages.append(lockImage3)
        lockImages.append(lockImage4)
        
        reservationImages.append(reservationImage1)
        reservationImages.append(reservationImage2)
        reservationImages.append(reservationImage3)
        reservationImages.append(reservationImage4)
        
        contentInfoViews.append(contentInfoView1)
        contentInfoViews.append(contentInfoView2)
        contentInfoViews.append(contentInfoView3)
        contentInfoViews.append(contentInfoView4)
        
        newImage.image("new")
        
        for image in images {
            let index = images.index(of: image)!
            image.tag = index
            image.contentMode = UIViewContentMode.scaleAspectFill
            image.clipsToBounds = true
        }
        
        for label in titleLabels {
             label.textColor = UIColor.white
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.textAlignment = NSTextAlignment.center
        }
        
        for label in infoLabels {
             label.numberOfLines = 0
            label.textColor = UIColor.white
            label.textAlignment = NSTextAlignment.center
        }
        
        for coverView in coverViews {
            coverView.backgroundColor = UIColor.black
            coverView.alpha = 0
        }
        
        for img in reservationImages {
            img.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            img.cornorRadius(15)
            img.isHidden = true
            img.image("icon_booking")
        }
        
        for img in lockImages {
            img.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            img.cornorRadius(15)
            img.isHidden = true
            img.image("icon_lock")
        }
        
        view.debug(deepDebug: true)
        image1.backgroundColor = UIColor.yellow
        image2.backgroundColor = UIColor.blue
        image3.backgroundColor = UIColor.alizarin()
        image4.backgroundColor = UIColor.green
    }
    
    override func setupConstrains(_ view: UIView) {
        let gap: CGFloat = 4
        let leading: CGFloat = 16
        
        let topAsp = "*0.75"
        let ffff: CGFloat = CGFloat(4) / CGFloat(3)
        let bottomAsp = "*\(ffff)"
        let imageWidth = (SCREEN_WIDTH - (gap + leading * 2)) / 2
//        image1.widthConstrain("\(imageWidth)")
        image1.aspectRatio(topAsp)
        image1.leadingAlign(view, predicate: "\(gap)")
        image1.topAlign(view, predicate: "\(gap)")
        image1.flk_nameTag = "image1"
//        image1.bottomAlign(view, predicate: "<=-\(leading)")
        
//        image2.widthConstrain("\(imageWidth)")
        image2.topAlign(view, predicate: "\(gap)")
        image2.trailingAlign(view, predicate: "-\(gap)")
        image2.leadingConstrain(image1, predicate: "\(gap)")
        image2.aspectRatio(topAsp)
        image2.flk_nameTag = "image2"
        image2.width(image1)
//        image2.bottomAlign(view, predicate: "<=-\(leading)")

        image3.topConstrain(image1, predicate: "\(gap)")
        image3.leadingAlign(view, predicate: "\(gap)")
        image3.aspectRatio("*1.5")
 //        image3.bottomAlign(view, predicate: "-\(gap)")
        image3.flk_nameTag = "image3"
        image3.bottomAlign(view, predicate: "-\(gap)")

        image4.topConstrain(image1, predicate: "\(gap)")
        image4.trailingAlign(view, predicate: "-\(gap)")
        image4.leadingConstrain(image3, predicate: "\(gap)")
//        image4.aspectRatio(bottomAsp)
        image4.width(image3)
        image4.height(image3)
//        image4.bottomAlign(view, predicate: "-\(gap)")
        image4.flk_nameTag = "image4"
//        image4.bottomAlign(view, predicate: "<=-\(leading)")

        
        var flag = false
        if flag {
            for img in images {
                let index = images.index(of: img)!
                let titleLabel = titleLabels[index]
                let infoLabel = infoLabels[index]
                let coverView = coverViews[index]
                
                let reservationImage = reservationImages[index]
                let lockImage = lockImages[index]
                let contentInfoView = contentInfoViews[index]
                
                
                infoLabel.centerY(img)
                infoLabel.leadingAlign(img, predicate: "5")
                infoLabel.trailingAlign(img, predicate: "-5")
                
                titleLabel.bottomConstrain(infoLabel, predicate: "-8")
                titleLabel.leadingAlign(infoLabel, predicate: "0")
                titleLabel.trailingAlign(infoLabel, predicate: "0")
                
                contentInfoView.topConstrain(infoLabel, predicate: "8")
                contentInfoView.centerX(img)
                
                
                var info = NSDictionary()
                var isBook = 1
                var isReachLevel = 1
                
                var isHotel = false
                
                if isReachLevel == 1 {
                    if isBook == 1 && !isHotel {
                        reservationImage.topAlign(contentInfoView, predicate: "0")
                        reservationImage.trailingAlign(contentInfoView, predicate: "0")
                        reservationImage.leadingAlign(contentInfoView, predicate: "0")
                        reservationImage.bottomAlign(contentInfoView, predicate: "0")
                        reservationImage.heightConstrain("30")
                        reservationImage.aspectRatio()
                        reservationImages[index].isHidden = false
                    } else {
                        reservationImages[index].isHidden = true
                    }
                } else {
                    if isBook == 1 && !isHotel {
                        reservationImage.topAlign(contentInfoView, predicate: "0")
                        reservationImage.trailingAlign(contentInfoView, predicate: "0")
                        reservationImage.bottomAlign(contentInfoView, predicate: "0")
                        reservationImage.heightConstrain("30")
                        reservationImage.aspectRatio()
                        reservationImages[index].isHidden = false
                        
                        lockImage.topAlign(contentInfoView, predicate: "0")
                        lockImage.leadingAlign(contentInfoView, predicate: "0")
                        lockImage.trailingConstrain(reservationImage, predicate: "-8")
                        lockImage.heightConstrain("30")
                        lockImage.aspectRatio()
                        lockImages[index].isHidden = false
                    } else {
                        lockImage.topAlign(contentInfoView, predicate: "0")
                        lockImage.leadingAlign(contentInfoView, predicate: "0")
                        lockImage.trailingAlign(contentInfoView, predicate: "0")
                        lockImage.bottomAlign(contentInfoView, predicate: "0")
                        lockImage.heightConstrain("30")
                        lockImage.aspectRatio()
                        lockImages[index].isHidden = false
                    }
                }
                
                coverView.alignTop("0", leading: "0", bottom: "0", trailing: "0", toView: img)
            }
            
            
            newImage.topAlign(image3, predicate: "-25")
            newImage.centerX(view)
            newImage.widthConstrain("60")
            newImage.heightConstrain("40")
        }
        
        
    }
    
    var shops = NSArray()
    
    func seShops(_ array: NSArray) {
        self.shops = array
        for index in 0 ... 3 {
            if let info = array[index] as? NSDictionary {
                
                let json = info.toJSON()
                let cover = json["cover"].stringValue
                let desc = json["desc"].stringValue
                let title = json["title"].stringValue
                let img = images[index]
                
                let titleLabel = titleLabels[index]
                titleLabel.text = title
                let infoLabel = infoLabels[index]
                infoLabel.text = desc
                
                //                var isBook:Int!
                //                if let isBook1 = info["isBook"] as? Int {
                //                    isBook = isBook1
                //                }
                //                ///消费预订
                //                if let shopTypeId = info["shopTypeId"] as? Int {
                //                    if shopTypeId != 6 && isBook == 1 {
                //                        reservationImages[index].hidden = false
                //                    }
                //                }
                //                ///会员是否达到等级
                //                if let isReachLevel = info["isReachLevel"] as? Int {
                //                    if isReachLevel == 0 {
                //                        lockImages[index].hidden = false
                //                    }
                //                }
                
                let reservationImg = reservationImages[index]
                reservationImg.tag = 999
                
                let lockImg = lockImages[index]
                lockImg.tag = index
                
            }
        }
    }
    
    func onPrompt(_ sender: UIGestureRecognizer) {
        let i = sender.view?.tag
        var text: String = "该商家需要预订消费!"
        var sshopId = -1
        if i != 999 {
            let shopInfo = self.shops[i!] as! NSDictionary
            //			if let levelLimit = shopInfo["levelLimit"] as? NSDictionary {
            //				text = levelLimit["name"] as? String ?? ""
            //			}
            if let msg = shopInfo["levelLimitMsg"] as? String {
                text = msg
            }
            if let shopId = shopInfo["shopId"] as? Int {
                sshopId = shopId
            }
            
        }
     }
  }

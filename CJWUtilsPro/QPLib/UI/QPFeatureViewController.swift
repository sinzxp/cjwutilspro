//
//  QPFeatureViewController.swift
//  CJWUtilsS
//
//  Created by Frank on 01/03/2017.
//  Copyright © 2017 cen. All rights reserved.
//

import UIKit

public class QPFeatureViewController: UIViewController {

	public let CacheKey = "DiskVersion"

	public class func canShowNewFeature() -> Bool {
		// NSString *versionValueStringForSystemNow=[UIApplication sharedApplication].version;
		if let diskVersion = QPCacheUtils.getCacheBy(key: "DiskVersion") as? String {
			let version = AppInfoManager.getVersion()
			if diskVersion == version {
				return false
			}
		}
		return true
	}

	let scrollView = UIScrollView()
	public var images: [String] = []
    public var imageUrls: [String] = []
	let confirmButton = UIButton()
	var currentPage = 0
	let pageControl = UIPageControl()
	public typealias OnEndNewFeatureBlock = () -> ()
	var block: OnEndNewFeatureBlock?

	public var button = UIButton()
    
    ///隐藏按钮
    public var hiddenButton = false
    public var hiddenPageControl = false
    //边缘弹性效果
    public var isBounces = false

	public override func viewDidLoad() {
		super.viewDidLoad()
        scrollView.frame = CGRect(x:0, y:0, width:view.width, height:view.height)
		self.view.addSubview(scrollView)
		self.view.addSubview(pageControl)

		var index = 0
        if !imageUrls.isEmpty {
            images = imageUrls
        }
		for img in images {
			let xPos = NSNumber(value: index).cgFloatValue() * self.view.width
            let imgv = UIImageView(frame: CGRect(x : xPos, y : 0, width : view.width, height : view.height))
            if !imageUrls.isEmpty {
                imgv.image(url: img, placeholder: "Launch")
            } else {
                imgv.image(name: img)
            }
 			imgv.scaleAspectFill()
			scrollView.addSubview(imgv)

			if index == images.count - 1 {
				imgv.addSubview(button)
				button.centerX(view: imgv)
				button.bottomAlign(view: imgv, predicate: "-40")
			}
			index += 1
		}

		button.setTitle("立即体验", for: UIControlState.normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
		button.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
		button.layer.cornerRadius = 15
		button.layer.borderWidth = 2
		button.layer.masksToBounds = true
		button.layer.borderColor = UIColor.white.cgColor
        button.isHidden = hiddenButton

		scrollView.addTapGesture(target: self, action: #selector(QPFeatureViewController.onTap))
        scrollView.contentSize = CGSize(width:NSNumber(value: images.count).cgFloatValue() * self.view.width, height: self.view.width)
		scrollView.isPagingEnabled = true
		scrollView.delegate = self
		scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.white
        scrollView.bounces = isBounces

		pageControl.bottomAlign(view: view, predicate: "-44")
		pageControl.centerX(view: view)
		pageControl.numberOfPages = images.count
		pageControl.currentPageIndicatorTintColor = UIColor.white
		pageControl.pageIndicatorTintColor = UIColor.darkGray
        pageControl.isHidden = hiddenPageControl
	}

	public func setOnEndNewFeatureBlock(block: @escaping OnEndNewFeatureBlock) {
		self.block = block
	}

	private func saveVersion() {
		QPCacheUtils.cache(value: AppInfoManager.getVersion() as AnyObject, forKey: CacheKey, toDisk: true)
	}

	public class func clearNewFeatureStatus() {
		QPCacheUtils.cache(value: "" as AnyObject, forKey: "DiskVersion", toDisk: true)
	}

	func onTap() {
		if currentPage == images.count - 1 {
			saveVersion()
			block?()
			block = nil
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "OnEndNewFeature"), object: nil)
//			NSNotificationCenter.defaultCenter().postNotificationName("OnEndNewFeature", object: nil)
		}
	}

	public override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

}

extension QPFeatureViewController: UIScrollViewDelegate {
	public func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let page = scrollView.getCurrentPage()
		self.currentPage = page
		pageControl.currentPage = page
        if !hiddenPageControl {
            if page == images.count - 1 {
                pageControl.isHidden = true
            }else{
                pageControl.isHidden = false
            }
        }
	}
}

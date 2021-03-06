//
//  QPImageUtils.swift
//  CJWUtilsS
//
//  Created by Frank on 1/18/16.
//  Copyright © 2016 cen. All rights reserved.
//

import UIKit
import SDWebImage
//import SwiftRandom
import CGFloatType
import GPUImage
import PodAsset

public class QPImageUtils: NSObject {

	public class func saveToAlbum(image: UIImage) {
		UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
	}

//	public func saveToAlbum(image: UIImage) {
//		UIImageWriteToSavedPhotosAlbum(image, self, "onSaveSuccess", nil)
//	}
//
//	func onSaveSuccess() {
//		print("onSaveSuccess")
//	}
}

public extension UIImageView {
    
    public func imageUrl(_ url: String) {
        sd_setImage(with: URL(string: url))
    }

	public func imageUrl(url: String) {
          sd_setImage(with: URL(string: url))
	}

	public func image(url: String, placeholder: String, block: @escaping () -> ()) {
 		let placeholderImage = UIImage(named: placeholder)
        let uuu = URL(string: url)
//        sd_setImage(with: uuu, placeholderImage: placeholderImage, options: .delayPlaceholder) { (img, error, type, nsurl) in
//            block()
//        }
        sd_setImage(with: uuu, placeholderImage: placeholderImage, options: .delayPlaceholder) { (img, error, type, nsurl) in
            block()
        }
//        sd_setImage(with: uuu, placeholderImage: placeholderImage) { (img, error, type, nsurl) -> Void in
//            block()
//        }
	}

	public func image(url: String, placeholder: String) {
//		 image(url: url, placeholder: placeholder)
//        imageUrl(url: url)
        image(url: url, placeholder: placeholder) {}
	}

	public func image(name: String) {
		if let img = UIImage(named: name) {
			self.image = img
		}
	}
    
    public func image(_ name: String) {
        if let img = UIImage(named: name) {
            self.image = img
        }
    }

	public func imageInPod(name: String) {
		var bundle = Bundle(identifier: "com.cenjiawen.app.CJWUtilsS")
		if bundle == nil {
			bundle = PodAsset.bundle(forPod: "CJWUtilsS")
		}
        let img = UIImage(named: name, in: bundle, compatibleWith: nil)
//		let img = UIImage(named: name, inBundle: bundle, compatibleWithTraitCollection: nil)
		self.image = img
	}
}

public extension UIImage {
	func tinttt() {
//        self.t
            UIColor.red
	}
}

public extension UIImage {
	/**
	 通过uicolor生成uiimage

	 - parameter color: 颜色

	 - returns: 图片
	 */
//	public static func fromColor(color: UIColor = UIColor.redColor()) -> UIImage {
//		let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
//		UIGraphicsBeginImageContext(rect.size)
//		let context = UIGraphicsGetCurrentContext()
//		CGContextSetFillColorWithColor(context, color.CGColor)
//		CGContextFillRect(context, rect)
//		let img = UIGraphicsGetImageFromCurrentImageContext()
//		UIGraphicsEndImageContext()
//		return img
//	}

	public static func fromColor(color: UIColor = UIColor.red, width: CGFloat = 1, height: CGFloat = 1) -> UIImage {
		let rect = CGRect(x: 0, y: 0, width: width, height: height)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()!
		context.setFillColor(color.cgColor)
		context.fill(rect)
		let img = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return img!
	}
}

public extension UIImageView {
	/**
	 生成任意尺寸的图片

	 - parameter width:  图片宽
	 - parameter height: 图片高
	 */
	public func imageWithSize(width: Int, height: Int) {
		let qnurl = "http://oagxrzzdf.bkt.clouddn.com/123.jpg?imageView2/1/w/\(Int(width))/h/\(Int(height))"
        self.image(url: qnurl, placeholder: "")
//		self.image(qnurl, placeholder: "")
	}
}

public extension UIButton {
	/**
	 在button右手边添加图片

	 - parameter img: 右手边的图片
	 */
	public func addRightImage(img: UIImage) {
		let button = self
		let arrow = UIImageView()
		arrow.image = img
//		if let title = button.titleLabel {
//			button.addSubview(arrow)
//			arrow.centerY(title)
//			arrow.heightConstrain("10")
//			arrow.widthConstrain("10")
//			arrow.leadingConstrain(title, predicate: "4")
//		}
	}
}

public extension UIImageView {
	public func toCircleImageView() {
		self.toCircleView()
	}

	public func scaleAspectFit() {
		self.contentMode = UIViewContentMode.scaleAspectFit
		self.clipsToBounds = true
	}

	public func scaleAspectFill() {
		self.contentMode = UIViewContentMode.scaleAspectFill
		self.clipsToBounds = true
	}
}

public class QPCircleView: UIView {
	public override func layoutSubviews() {
		super.layoutSubviews()
		toCircleView()
	}

	override public func updateConstraints() {
		super.updateConstraints()
	}

	public func setup() {
	}

	convenience public init () {
		self.init(frame: CGRect.zero)
		setup()
	}

	override public init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
}

public class QPCircleImageView: UIImageView {
	public override func layoutSubviews() {
		super.layoutSubviews()
		toCircleView()
	}

	override public func updateConstraints() {
		super.updateConstraints()
	}

	public func setup() {
	}

	convenience public init () {
		self.init(frame: CGRect.zero)
		setup()
	}

	override public init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
}

public extension UIImage {
	/**
     把图片切成正方形,居中
     
     - parameter image: 原图
     
     - returns:
     */
	public class func cropCenter(image: UIImage) -> UIImage {
		let img = image
		let width = img.size.width
		let height = img.size.height
		let crop = GPUImageCropFilter()
		if width > height {
			let fff: Float = Float(img.size.height) / Float(img.size.width)
			let scale = NSNumber(value: fff).cgFloatValue()
            crop.cropRegion = CGRect(x:(1 - scale) / 2,y: 0,width: scale, height:1)
		} else {
			let fff: Float = Float(img.size.width) / Float(img.size.height)
			let scale = NSNumber(value: fff).cgFloatValue()
            crop.cropRegion = CGRect(x:0, y:(1 - scale) / 2, width:1, height:scale)
		}
		let newImage = crop.image(byFilteringImage: img)
		return newImage!
	}

	/**
     调整图片明亮度
     
     - parameter image: 原图
     - parameter rate:  0.0-1.0 ,约大约黑
     
     - returns:
     */
	public class func dim(image: UIImage, rate: CGFloat = 0.3) -> UIImage {
		let filter = GPUImageBrightnessFilter()
		filter.brightness = (-1) * rate
		return filter.image(byFilteringImage: image)
	}
}

public extension UIImageView {
	/**
     调暗图片
     
     - parameter rate: 0.0-1.0 ,约大约黑
     */
	public func dim(rate: CGFloat = 0.3) {
		if let image = self.image {
			self.image = UIImage.dim(image: image, rate: rate)
		}
	}

	/**
     图片裁切成正方形,居中
     */
	public func centerCropImage() {
		if let image = self.image {
			let img = UIImage.cropCenter(image: image)
			self.image = img
		}
		scaleAspectFit()
	}
}

public extension UIImageView {

	public func imageTemplate() {
		let imgs = ["http://hbimg.b0.upaiyun.com/cbc211d045703eba40fb65d5f9bcb8d016da04923577c-gbORW6_fw658", "http://hbimg.b0.upaiyun.com/5ecda99cb699618741836ad85c7c710c89b79d1fd38b4-4sjJsP_fw658", "http://hbimg.b0.upaiyun.com/8c224d2e4b6e35d0c0cc8ee2f018055a012840fa2440f-33rNHQ_fw658", "http://hbimg.b0.upaiyun.com/7e4b4c962dd7d928c58b5c499329e7e3317b7864337b6-n3aIxL_fw658"]
		let ran = (Int(arc4random()) % imgs.count)
//
		let url = imgs[ran]
//		image(url, placeholder: "")
		self.scaleAspectFill()
//		self.imageUrl(url)

		// self.scaleAspectFill()
	}
}

public extension UIImage {

}

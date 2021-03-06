//
//  QPViewDebug.swift
//  CJWUtilsS
//
//  Created by Frank on 3/8/16.
//  Copyright © 2016 cen. All rights reserved.
//

import UIKit

public class QPViewDebug: UIView {
}

// MARK: - 给view debug的小工具
public extension UIView {

	/**
	 debug的时候方便查看背景的颜色

	 - parameter deepDebug: 是否需要深度遍历所有的subview
	 */
	public func debug(deepDebug: Bool = false) {
		layer.borderColor = UIColor.black.cgColor
		layer.borderWidth = 1

        
		self.backgroundColor = UIColor.belizeHole()
		if let img = self as? UIImageView {
			img.backgroundColor = UIColor.pomegranate()
//			img.imageTemplate()
		} else if let label = self as? UILabel {
			self.backgroundColor = UIColor.peterRiver()
			if label.text == nil {
				if label.numberOfLines > 0 {
					label.text = "Label\nLabel\nLabel\nLabel\nLabel"
				} else {
					label.text = "Label"
				}
			}
		} else if let button = self as? UIButton {
			button.setTitle("Button", for: UIControlState.normal)
			self.backgroundColor = UIColor.pumpkin()
		} else if let textField = self as? UITextField {
			textField.text = "UITextField"
			self.backgroundColor = UIColor.alizarin()
		}

		if deepDebug {
			for sv in self.subviews {
				sv.debug(deepDebug: true)
			}
		}
	}
}

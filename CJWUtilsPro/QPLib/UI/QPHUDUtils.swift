//
//  QPHUDUtils.swift
//  CJWUtilsS
//
//  Created by Frank on 1/18/16.
//  Copyright © 2016 cen. All rights reserved.
//

import UIKit
import SVProgressHUD
import MBProgressHUD

class QPHUDUtils: NSObject {
	var mbHUD: MBProgressHUD?

    static let sharedInstance = QPHUDUtils()
    
//	class var sharedInstance: QPHUDUtils {
//		struct Static {
//			static var onceToken: dispatch_once_t = 0
//			static var instance: QPHUDUtils? = nil
//		}
//		dispatch_once(&Static.onceToken) {
//			Static.instance = QPHUDUtils()
//		}
//		return Static.instance!
//	}
}

// MARK: - 继续SVProgressHUD
//TODO: 还没完善SVProgressHUD
extension NSObject {
//	func showHUD(text: String) {
//		SVProgressHUD.setBackgroundColor(COLOR_BLACK)
//		SVProgressHUD.setForegroundColor(COLOR_WHITE)
//		SVProgressHUD.setRingThickness(8)
//		SVProgressHUD.showWithStatus(text)
//	}
//
//	func hideHUD() {
//		SVProgressHUD.dismiss()
//	}
//
//	func showLoading(view: UIView, text: String) {
//		MBProgressHUD.showHUDAddedTo(view, animated: true)
//	}
}

// MARK: - 显示hud
public extension UIView {

	private func cleanHud() {
		if let hud = QPHUDUtils.sharedInstance.mbHUD {
            hud.hide(true)
		}
	}

	/**
	 显示HUD(不自动消失)

	 - parameter text: 需要显示的文字
	 */
	public func showLoading(text: String) {

		var view = self
		if view is UITableView {
			if let sv = view.superview {
				view = sv
			}
		}
		cleanHud()
		self.isUserInteractionEnabled = false
		let hud = MBProgressHUD.showAdded(to: view, animated: true)
//		if hud != nil { }
        hud.labelText = text
//        hud.label.text = text
//		hud.mode = .indeterminate
 		QPHUDUtils.sharedInstance.mbHUD = hud
	}

	/**
	 隐藏HUD
	 */
	public func hideLoading() {
		var view = self
		if view is UITableView {
			if let sv = view.superview {
				view = sv
			}
		}
		cleanHud()
		self.isUserInteractionEnabled = true
		MBProgressHUD.hideAllHUDs(for: view, animated: true)
	}

	/**
	 老方法,和以前的项目对接
	 隐藏hud
	 调用hideLoading

	 */
	public func hideAllHUD() {
		hideLoading()
	}

	/**
	 老方法,和以前的项目对接
	 显示hud
	 调用showLoading

	 - parameter text: 需要显示的内容
	 */
	public func showHUDwith(text: String) {
		showLoading(text: text)
	}
    
    public func showHUDwith(_ text: String) {
        showLoading(text: text)
    }


	/**
	 老方法,和以前的项目对接
	 短暂出现hud

	 - parameter text: 需要显示的内容
	 */
	public func showTemporary(text: String) {
		showHUDTemporary(text: text)
	}
    
    public func showTemporary(_ text: String) {
        showHUDTemporary(text: text)
    }

	/**
	 显示hud.默认1.5s后消失

	 - parameter text:     显示的文字
	 - parameter duration: 显示时常.默认1.5
	 */
	public func showHUDTemporary(text: String, duration: TimeInterval = 1.5) {
		cleanHud()
		let view = self
		self.isUserInteractionEnabled = false
		let hud = MBProgressHUD.showAdded(to: view, animated: true)
//		if hud != nil { }
        hud.labelText = text
//        hud?.label.text = text
//		hud?.mode = .text
		QPHUDUtils.sharedInstance.mbHUD = hud
		excute(timeDelay: duration) { () -> () in
			view.hideAllHUD()
		}
	}
    
}

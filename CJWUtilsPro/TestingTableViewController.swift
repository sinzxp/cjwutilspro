//
//  TestingTableViewController.swift
//  CJWUtilsPro
//
//  Created by Frank on 20/04/2017.
//  Copyright © 2017 Frank. All rights reserved.
//

import UIKit
import SnapKit
import Masonry

class TestingTableViewController: QPTableViewController {

    lazy var box = UIView()

    override func viewDidLoad() {
//        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableViewAutomaticDimension
        super.viewDidLoad()
        self.title = "abc"

//        self.view.translatesAutoresizingMaskIntoConstraints = false
//        box.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(box)
//        let superview = box.superview!
//        box.leadingAlign(view: view)
//        box.trailingAlign(view: view)
//        box.topAlign(view: view)
//        box.bottomAlign(view: view)
//        box.heightConstrain(predicate: "100")
//        box.widthConstrain(predicate: ">=200")
//        box.backgroundColor = UIColor.lightlightGrayColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.backgroundColor = UIColor.red
//        cell.textLabel?.text = "asb"
//        return cell
//    }

    override func cellForRow(atIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        let cell = CPHomeNewOnlineTableViewCell()
        cell.debug(deepDebug: true)
//        return  CPShopStoryTableViewCell()
        return cell
//        return UITableViewCell()
    }
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return QPC()
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
 //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
}

class QPFuckingCell : QPTableViewCell {
    
    
    let label = UILabel()
    let logo = UIImageView()
    
    override func setupViews(view: UIView) {
        super.setupViews(view: view)
        view.addSubview(label)
        view.addSubview(logo)
        
        
        label.text = "不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层不过重点就是 之前cell 里面插view 是放到 cell那一层"
        //        label.textAlignmentCenter()
        label.numberOfLines = 0
        
        label.backgroundColor = UIColor.red
        logo.backgroundColor = UIColor.purple
    }
    
    override func setupConstrains(view: UIView) {
        super.setupConstrains(view: view)
        
        label.leadingAlign(view: view, predicate: "100")
        label.trailingAlign(view: view)
        label.topAlign(view: view)
        label.bottomAlign(view: view)
        
        logo.topAlign(view: view, predicate: "10")
        logo.leadingAlign(view: view, predicate: "4")
        logo.trailingConstrain(view: label, predicate: "-4")
        logo.aspectRatio()
    }
}

class QPC:UITableViewCell {
    let label = UILabel()
    let vvv = self

    let logo = UIImageView()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCell()
    }
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    func initCell(){
        label.text = "核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核核力量核力量核"
//        label.textAlignmentCenter()
        label.numberOfLines = 10

        label.backgroundColor = UIColor.red
        
//        label.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        
//        self.contentView.setToAutoLayout()
//        label.setToAutoLayout()
        self.contentView.addSubview(label)
        self.contentView.addSubview(logo)
        
        logo.backgroundColor = UIColor.yellow
        
        label.flk_nameTag = "lab"
        self.contentView.flk_nameTag = "contentView"
        self.flk_nameTag = "view"
        self.contentView.setToAutoLayout()

        go()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
     }
    
    func go(){
 
 
        let box = self.contentView
        let superview = box.superview!
        
        box.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(superview).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
//        sftm()
//        sk()
        flk()
//        appleConstrain()
    }
    
    
    func sk(){
        let superview = self.contentView
        label.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(superview).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
    
    func flk(){
        let view = self.contentView
        label.leadingAlign(view: view, predicate: "100")
        label.trailingAlign(view: view)
        label.topAlign(view: view)
        label.bottomAlign(view: view)
        
        logo.topAlign(view: view, predicate: "10")
        logo.leadingAlign(view: view, predicate: "4")
        logo.trailingConstrain(view: label, predicate: "-4")
         logo.aspectRatio()
   
    }
    
    func sftm(){
        let views = ["myView" : label]
        let formatString = "|-[myView]-|"
        
        let ct = NSLayoutConstraint.constraints(withVisualFormat: formatString, options: NSLayoutFormatOptions.alignAllTop, metrics: nil, views: views)
        let ct2 = NSLayoutConstraint.constraints(withVisualFormat: formatString, options: NSLayoutFormatOptions.alignAllLeading, metrics: nil, views: views)
        NSLayoutConstraint.activate(ct)
        NSLayoutConstraint.activate(ct2)

//        let constraints = NSLayoutConstraint.constraints(withVisualFormat: formatString, options: .alignAllTop, metrics: nil, views: views)
//        NSLayoutConstraint
//        NSLayoutConstraint.activate(constraints)
    }
    
    func appleConstrain(){
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: vvv, attribute: NSLayoutAttribute.trailingMargin, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: vvv, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1.0, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: vvv, attribute: NSLayoutAttribute.topMargin, multiplier: 1.0, constant: 0).isActive = true
        
        
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: vvv, attribute: NSLayoutAttribute.bottomMargin, multiplier: 1.0, constant: 0).isActive = true
        
        NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: label, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0).isActive = true
        
        label.exerciseAmbiguityInLayout()
    }
}

class QPTC: QPTableViewCell{}
//    let label = UILabel()
//    let label2 = UILabel()
//    
//    override func setupViews(view: UIView) {
//        view.addSubview(label)
////        view.addSubview(label2)
//        label.text = "核力量核力量\n核力量核"
//        label.textAlignmentCenter()
//        label.numberOfLines = 2
//        label.backgroundColor = UIColor.peterRiver()
//
//        label2.text = "何丽丽"
//        label2.backgroundColor = UIColor.alizarin()
//        
//        /*
//         textField.snp_makeConstraints { (make) -> Void in
//         make.edges.equalTo(contentView).inset(UIEdgeInsetsMake(10, 10, 10, 0))
//         }
//         */
//       
//        
//        label.snp.makeConstraints { (make) in
//            make.leading.equalTo(view).offset(10)
//            make.trailing.equalTo(view).offset(-10)
//            make.top.equalTo(view).offset(10)
//            make.bottom.equalTo(view).offset(-10)
//            
//            make.height.greaterThanOrEqualTo(30)
//        }
//
//        view.snp.makeConstraints { (make) in
//            label.equalConstrain2(view: view)
//            label.heightConstrain(predicate: "50")
//
//        }
//    }
//    
//    override func setupConstrains(view: UIView) {
////        label.topAlign(view: view, predicate: "16")
////        label.leadingAlign(view: view, predicate: "8")
////        label.trailingAlign(view: view, predicate: "-7")
////        label.bottomAlign(view: view, predicate: "-19")
//////        label.centerView(view: view)
//////        label.equalConstrain2(view: view)
//////        label.paddingConstrain(padding: 16)
////        label.heightConstrain(predicate: "100")
//        
//     }
//}

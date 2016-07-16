//
//  NewsDetileViewController.swift
//  NEWS
//
//  Created by Thomas Liu on 16/7/4.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class NewsDetileViewController: UIViewController {
    
    var url = "www.baidu.com";
    
    @IBAction func backc(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
        //返回上一级函数
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

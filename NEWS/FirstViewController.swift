//
//  FirstViewController.swift
//  NEWS
//
//  Created by Thomas Liu on 16/7/1.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import CoreData








typealias nameValue = (String)->Void


class FirstViewController: UIViewController
{
    
    var usernamein = ""
    var passwordin = ""
    
    
    var nameText: nameValue?
    

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
//    //3、重写协议方法，取到传值
//    func passValue(text: String) {
//        textLabel.text = text
//    }
    
    
    //无用
    func getuserid( A:Int) -> String {
        let userid = usernamein
            return userid
    }
    
    // 闭包方法
    func returnNameValue(name: nameValue) {
        self.nameText = name
    }
    
    //点击空白键盘收起
    @IBAction func touchinside(sender: AnyObject) {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    //点击Done收起键盘。
    @IBAction func ClikeButtonNext(sender: AnyObject) {
        username.resignFirstResponder()
    }
    @IBAction func ClikeDoneButton(sender: AnyObject) {
        password.resignFirstResponder()
    }
    
    
    //点击登录按钮
    @IBAction func login(sender: AnyObject){
        
        //取得  用户名 和  密码
        passwordin = password.text!
        usernamein = username.text!
        ////////////////////////////////////////////
        
        
        /////////////////////////////////////////////
        print("输入的用户名" + usernamein)
        print("输入的密码" + passwordin)
      //  print(SwiftHTTPVersionNumber)
        
        if usernamein == ""{
            //弹框，用户名为空
            let alertController = UIAlertController(title: "请填写用户名", message:    "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else //username不是空 ，判断一下密码填写了没有
        {
            if passwordin == "" {
                //弹框，用户名为空
                let alertController = UIAlertController(title: "请填写密码", message:    "", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else //密码也不是空
            {
                
                let passwordgt = httpget(usernamein)
                
                
                //现在就要发给 服务器了，然后比对一下
                ///////////////////////////////////////
                
                if passwordgt == passwordin {
                    print("相同")
                    print("获取的密码"+passwordgt)
                    print("")
                    
                    
                    //self.nameText!(self.username.text!)
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                    
                    _ = NEWSViewController()
                    
                    NSNotificationCenter.defaultCenter().postNotificationName("name", object: "tyuiyrtyuio")
                   // NSNotificationCenter.defaultCenter().postNotificationName("name", object: "asdfasdfa", userInfo: bVC)

                    //跳转
                    let sb = UIStoryboard(name: "Main", bundle:nil)
                    let vc = sb.instantiateViewControllerWithIdentifier("NEWSViewController") as UIViewController
                    self.presentViewController(vc, animated: true, completion: nil)
                    
//                    let thirdVC = (self.storyboard?.instantiateViewControllerWithIdentifier("NEWSViewController"))! as UIViewController
////                    thirdVC.text = "Pass"
//                    self.navigationController?.pushViewController(thirdVC, animated: true)
                    

                
                }
                else
                {
                    print("不同")
                    print("获取的密码"+passwordgt)
                    print("")
                    //弹框
                    let alertController = UIAlertController(title: "用户名或密码错误", message:    "请重新检查用户名和密码", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                    //            print("不同")
                    //
                }
            }
        }
    }
    
    
    func httpget( username : String) -> String{
        let urlString : String = "http://localhost:80/test2/HandleGET.php?usernamein="+usernamein//路径
        var passwordget = ""
       // var receiveData : NSMutableData
        
        print(urlString)
        
        //  print(urlString)
        var url:NSURL!
        url = NSURL(string:urlString)
        let request = NSMutableURLRequest(URL:url)
        request.HTTPMethod = "GET"
        // print(urlString)
        //响应对象

        var response:NSURLResponse?
        
        do{
            //发出请求
            let received:NSData? = try NSURLConnection.sendSynchronousRequest(request,returningResponse: &response)
            let datastring = NSString(data:received!, encoding: NSUTF8StringEncoding)
            
            passwordget = datastring as! String
            
            print(passwordget)
            print("发出了请求")
            print("")
            
        }catch let error as NSError{
            print("发出请求错误")
            //打印错误消息
            print(error.code)
            print(error.description)
        }
        
        return passwordget
    }
    
    
    
    override func viewDidLoad() {
        
        username.placeholder = "用户名"
        password.placeholder = "密码"
        
        self.username.clearButtonMode = .WhileEditing
        self.password.clearButtonMode = .WhileEditing
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}


//
//  SecondViewController.swift
//  NEWS
//
//  Created by Thomas Liu on 16/7/1.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var 注册是写用户名的地方: UITextField!
    @IBOutlet weak var 注册时写用户密码的地方: UITextField!
    
    
    @IBAction func dianjishouqi(sender: AnyObject) {
        注册是写用户名的地方.resignFirstResponder()
        注册时写用户密码的地方.resignFirstResponder()
    }
    
    
    @IBAction func 点击注册的按钮(sender: AnyObject) {
        
        let 用户输入的用户名称 = 注册是写用户名的地方.text
        let 用户输入的密码 = 注册时写用户密码的地方.text
        
        
        if 用户输入的用户名称 == "" {
            //弹窗
            let alertController = UIAlertController(title: "请输入用户名", message:    "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)

        }
        else
        {
            if 用户输入的密码 == "" {
                //弹窗
                let alertController = UIAlertController(title: "请输入密码", message:    "", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)

            }
            else
            {
                let 注册了没有啊 = httpget(用户输入的用户名称!, userpasswordzc: 用户输入的密码!)
                
                if 注册了没有啊 {
                    print("注册了")
                    
                    //弹窗
      
                    
                    
                    let sb = UIStoryboard(name: "Main", bundle:nil)
                    let vc = sb.instantiateViewControllerWithIdentifier("NEWSViewController") as UIViewController
                    //跳转
                    self.presentViewController(vc, animated: true, completion: nil)
                }
                else
                {
                    print("没有注册")
                    
                    //弹窗
                    let alertController = UIAlertController(title: "OH MAN~", message:    "Same UserName", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func httpget( usernamezcin : String , userpasswordzc : String) -> Bool{
        let urlString : String = "http://localhost:80/test2/HandleZC.php?usernameinzc=" + usernamezcin + "&userpasswordzc=" + userpasswordzc//路径
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
        
        if passwordget == "yes" {
            print("1")
            return true
        }
        else
        {
            if passwordget == "no"{
                                print("2")
                return false

            
            }
            else{
                   print("3")
                return false
             
            }
        }
    }

    
    

    
    
    override func viewDidLoad() {
        
        注册是写用户名的地方.placeholder = "用户名（数字）"
        注册时写用户密码的地方.placeholder = "密码"
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  NEWSViewController.swift
//  NEWS
//
//  Created by Thomas Liu on 16/7/4.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit

protocol passValueDelegate {
    func passValue( text: String)
}


class NEWSViewController: UIViewController {
    
    // 1、声明属性
    var delegate: passValueDelegate?


    @IBOutlet weak var Detile1: UILabel!

    @IBOutlet weak var Detile2: UILabel!

    @IBOutlet weak var Detile3: UILabel!

    @IBOutlet weak var Detile4: UILabel!
    
    @IBOutlet weak var buttontest3: UIButton!
    @IBOutlet weak var buttontest2: UIButton!
    @IBOutlet weak var buttontest1: UIButton!
    @IBOutlet weak var buttontest4: UIButton!
    
    
    var userid = "1"

    /**
     收到广播后所执行的方法
     
     - parameter notifaction: notifaction
     */
    func printName(notifaction: NSNotification) {
        print(notifaction.object)
        userid = (notifaction.object as? String)!
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
    //刷新新闻按钮
    @IBAction func FlushNews(sender: AnyObject) {
        //序号
        let  newsid = httpconect("HandleRefresh", B: userid)
        print(newsid+"新闻序号")
        
        //得到新闻序号进行处理
        let strArray = newsid.componentsSeparatedByString(",")
        print(strArray[0]+"strArray得到新闻序号进行处理")
        
        if newsid == "" {
            let alertController = UIAlertController(title: "bug", message:    "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)

        }
        else
        {
            let  newsid1 = strArray[0] as String
            let  newsid2 = strArray[1] as String
            let  newsid3 = strArray[2] as String
            let  newsid4 = strArray[3] as String
            //标题
            let title1 = httpconect("Handlenewstitle", B: newsid1)
            print(title1+"     标题1")
            buttontest1.setTitle(title1, forState: UIControlState.Normal)
            let title2 = httpconect("Handlenewstitle", B: newsid2)
            print(title2+"     标题2")
            buttontest2.setTitle(title2, forState: UIControlState.Normal)
            let title3 = httpconect("Handlenewstitle", B: newsid3)
            print(title3+"     标题3")
            buttontest3.setTitle(title3 , forState: UIControlState.Normal)
            let title4 = httpconect("Handlenewstitle", B: newsid4)
            print(title4+"     标题4")
            buttontest4.setTitle(title4 , forState: UIControlState.Normal)
            
            //细节
            
            let  detile1 = httpconect("handlenewsdetile", B: newsid1)
            print(detile1+"     细节1")
            Detile1.text = detile1
            let detile2 = httpconect("handlenewsdetile", B: newsid2)
            print(detile2+"     细节2")
            Detile2.text = detile2
            let detile3 = httpconect("handlenewsdetile", B: newsid3)
            print(detile3+"     细节3")
            Detile3.text = detile3
            let detile4 = httpconect("handlenewsdetile", B: newsid4)
            print(detile4+"     细节4")
            Detile4.text = detile4
            
            
            //url
            let url1 = httpconect("handlenewsurl", B: newsid1)
            print(url1+"        新闻路径1")
            let url2 = httpconect("handlenewsurl", B: newsid1)
            print(url2+"        新闻路径2")
            let url3 = httpconect("handlenewsurl", B: newsid1)
            print(url3+"        新闻路径3")
            let url4 = httpconect("handlenewsurl", B: newsid1)
            print(url4+"        新闻路径4")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 注册为观察者，接收信息
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("printName"), name: "name", object: nil)
        
        let bVC = FirstViewController()

        
        bVC.returnNameValue { (name) -> Void in
            self.userid = name
            print(name)
        }
        
        print("userid got " + userid)
    
        
        //设置Lable自动换行
        
        Detile1.numberOfLines = 0
        Detile1.lineBreakMode = NSLineBreakMode.ByWordWrapping
        Detile2.numberOfLines = 0
        Detile2.lineBreakMode = NSLineBreakMode.ByWordWrapping
        Detile3.numberOfLines = 0
        Detile4.lineBreakMode = NSLineBreakMode.ByWordWrapping
        Detile4.numberOfLines = 0
        Detile4.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        
        
        Detile1.text = "adahdakdhahdakjhdkahdkjahdkjhakdhakshdkajhdkjajhsdkashdkahskjdhakjsdhajkhdkahsdkjahsdkjafjvjfghjk"
        Detile2.text = "adahdakdhahdakjhdkahdkjahdkjhakdhakshdkajhdkjajhsdkashdkahskjdhakjsdhajkhdkahsdkjahsdkjafjvjfghjkk"
        Detile3.text = "adahdakdhahdakjhdkahdkjahdkjhakdhakshdkajhdkjajhsdkashdkahskjdhakjsdhajkhdkahsdkjahsdkjafjvjfghjkkj"
        Detile4.text = "adahdakdhahdakjhdkahdkjahdkjhakdhakshdkajhdkjajhsdkashdkahskjdhakjsdhajkhdkahsdkjahsdkjafjvjfghjkkjd"
        

        // Do any additional setup after loading the view.
        
        buttontest1.titleLabel?.text = "hahaha"
        buttontest2.titleLabel?.text = "hahaha"
        buttontest3.titleLabel?.text = "hahaha"
        //buttontest4.titleLabel?.text = "hahaha"
        
        
        //序号
        let  newsid = httpconect("HandleRefresh", B: userid)
        print(newsid+"新闻序号")
        
        //得到新闻序号进行处理
        let strArray = newsid.componentsSeparatedByString(",")
        print(strArray[0]+"strArray得到新闻序号进行处理")
        
        if newsid == "" {
            let alertController = UIAlertController(title: "bug", message:    "", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else
        {
            let  newsid1 = strArray[0] as String
            let  newsid2 = strArray[1] as String
            let  newsid3 = strArray[2] as String
            let  newsid4 = strArray[3] as String
            //标题
            let title1 = httpconect("Handlenewstitle", B: newsid1)
            print(title1+"     标题1")
            buttontest1.setTitle(title1, forState: UIControlState.Normal)
            let title2 = httpconect("Handlenewstitle", B: newsid2)
            print(title2+"     标题2")
            buttontest2.setTitle(title2, forState: UIControlState.Normal)
            let title3 = httpconect("Handlenewstitle", B: newsid3)
            print(title3+"     标题3")
            buttontest3.setTitle(title3 , forState: UIControlState.Normal)
            let title4 = httpconect("Handlenewstitle", B: newsid4)
            print(title4+"     标题4")
            buttontest4.setTitle(title4 , forState: UIControlState.Normal)
            
            
            //细节
            
            let  detile1 = httpconect("handlenewsdetile", B: newsid1)
            print(detile1+"     细节1")
            Detile1.text = detile1
            let detile2 = httpconect("handlenewsdetile", B: newsid2)
            print(detile2+"     细节2")
            Detile2.text = detile2
            let detile3 = httpconect("handlenewsdetile", B: newsid3)
            print(detile3+"     细节3")
            Detile3.text = detile3
            let detile4 = httpconect("handlenewsdetile", B: newsid4)
            print(detile4+"     细节4")
            Detile4.text = detile4
        }
        
        

    }
    
    
    
    
    func httpconect(A:String,B:String) -> (String) {
        let urlString : String = "http://localhost:80/test2/"+A+".php?userid="+B//路径
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
            
            print("得到的新闻数据"+passwordget)
            print("刷新闻发出了请求")
            print("")
            
        }catch let error as NSError{
            print("发出请求错误")
            //打印错误消息
            print(error.code)
            print(error.description)
        }
        
        return (passwordget)

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
    
//    
//    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
//        dismissViewControllerAnimated(true,completion: nil)    }
//    
//    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }
//    


}

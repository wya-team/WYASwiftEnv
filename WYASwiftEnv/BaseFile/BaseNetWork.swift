//
//  BaseNetWork.swift
//  WYASwiftEnv
//
//  Created by 李俊恒 on 2018/8/16.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

import UIKit
import Alamofire
enum MethodType {
    case get
    case post
}

class BaseNetWork: NSObject {
    
   /// get post 请求
   ///
   /// - Parameters:
   ///   - type: 请求方式传入参数为.get .post
   ///   - URLString: 请求的URlString
   ///   - paramenters: 需要拼接的参数如果为get请求可以不填写
   ///   - finishedCallback: 请求数据返回
   class func requestData(_ type:MethodType,URLString:String,paramenters:[String : Any]? = nil ,finishedCallback:@escaping(_ result : Any)->()) {
        // 1.获取请求的类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: paramenters).responseJSON { (response) in
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)// 请求出现错误会输出error
                return
            }
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }
}

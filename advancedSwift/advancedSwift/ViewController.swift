//
//  ViewController.swift
//  advancedSwift
//
//  Created by LoveQiuYi on 16/1/19.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

import UIKit

enum fruits:String{ //定义一个枚举，枚举的类型如果指定了是String那么其中的成员的数据类型也要是String
    case apple = "apple" //定义成员变量需要用关键字case
    case banana = "banana"
    case grape = "grape"
}
enum product{ //定义一个没有数据类型的枚举，但是成员变量都有其各自的类型属性
    case threeNumbers(Int,Int,Int)
    case name(String)
}
enum sex:String{
    case male = "male"
    case female = "female"
}

struct Color {
    var red:Double
    var green:Double
    var blue:Double
    //自定义构造器也叫指定构造器
    init (Red:Double,Green:Double,Blue:Double){
        red = Red
        green = Green
        blue = Blue
    }
}
class extensionClass{
    //定义一个空类
}

extension extensionClass{//---------对一个空类进行扩展
    //扩展计算属性
    var a:Int{
        return 6
    }
    //扩展类型属性
    class var b:Int{
        return 200
    }
    //扩展实例方法
    func printStr(num:String){
        for i in num.characters {
            print(i)
        }
    }
    //扩展类方法
    class func add(a:Int,_ b:Int) ->Int{
        return a + b
    }
    
    
}
//协议
/**
*  协议中的属性如果不是optional的话，如果有类遵循这个协议那么必须全部实现这个协议中的方法属性
*/
@objc protocol NameProtocol {//-----定义一个可选协议最前面加上：@objc
    //实例属性
    optional var age:Int {get}
    optional var sex:String {get}//前面加上optional表示这个属性是可选择性的
    //类型属性
    optional static var name:String {get}
    //实例方法
    optional func add(a:Int,_ b:Int) ->Int
    //类方法
    optional static func sub(a:Int,_ b:Int) ->Int
}
 protocol otherProtocol:NameProtocol{
    func sub(a:Int,_ b:Int) ->Int
}
class proClass:NameProtocol {//新建一个类遵循协议,如果遵循的时可选协议那么实现方法中需要加上@objc
    @objc var age:Int{
        return 20
    }
    @objc class var name:String{
        return "zhangxin"
    }
    @objc func add(a: Int, _ b: Int) -> Int {
        //编写实现
        return a + b
    }
    @objc static func sub(a: Int, _ b: Int) -> Int {
        //编写实现
        return a * b
    }
    
}
class otherProclass: otherProtocol {//遵循otherProtocol这个协议也就遵循了NameProtocol这个协议
    @objc func add(a: Int, _ b: Int) -> Int {
        return a + b
    }
    @objc func sub(a: Int, _ b: Int) -> Int {
        return a * b
    }
}
//定义一个泛型的类---------泛型就是可以输出任意类型的内容
class newFxClass<T>{
    //定义一个对象方法
    func printValue(value:T){
        print(value)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("---------------------swift高级语法------------------")
        print("--------------枚举------------")
        let fruit1 = fruits.apple//实例化枚举的对象
        let fruit2 = fruits.banana.rawValue//rawValue属性可以访问成员变量的值
        let fruitName = fruits(rawValue: "grape")//和上面的方法作用相反，通过String来获取成员
        print(fruit1,fruit2)
        print(fruitName!)
        //相关值
        let productOne = product.threeNumbers(8, 7, 6)//为成员变量threeNumbers添加相关值
        print(productOne)
        print("--------------类------------")
        //创建一个类
        class Person{
            var age = 20
            var isMale = sex.male
        }
        //实例化一个Person对象
        let smallPerson = Person()
        smallPerson.age = 10//定义对象的属性
        smallPerson.isMale = sex.female
        print(smallPerson.age,smallPerson.isMale,Person().age)//分别输出对象的age以及isMale还有类的属性age
        class classOne{
            lazy var numberOne = Person()
            var numberTwo = 30
        }
        print(classOne().numberOne.age)//如果没有调用print中实现的方法那么numberOne对象的属性还没有被创建
        //get和set方法
        class getOrSet{
            var result = 0
            var number:Int{
                get{
                    let i = result + 30
                    return i
                }
                set(i){
                    result = i + 3
                }
            }
        }
        let test = getOrSet()//创建了一个对象
        test.number = 100//调用这个对象的set方法  这个时候result为103
        print("test.number is\(test.number) and test.result is \(test.result)")
        //--------------方法--------------
        class NewClass{
            var number:String = "zhangxin"
            //无参数的实例方法
            func printNumber(){
                for index in number.characters{
                    print(index)
                }
            }
            //有参数的实例方法
            func appendNumber(str:String){
                print(number + str)
            }
        }
        let newclass = NewClass()//创建一个对象
        newclass.printNumber()//调用方法
        newclass.appendNumber("cool")
        print("--------------继承和重写------------")
        //定义一个父类
        class Father{
            var age = 40
            func printAge(){
                //print(age)
                print(age)
            }
            func eat(){
                print("father eat")
            }
            final func play(){ //让这个属性子类不能进行重写那就添加final即可------禁止重写
                print("father play")
            }
        }
        //定义一个子类
        class Son: Father {
            func run(){
                print("run")
            }
            override func eat() {//重写父类的方法的时候需要添加override
                print("son eat")
            }
        }
        let father = Father()
        father.age = 50
        let son = Son()
        print(father.age,father.eat())
        print(son.printAge(),son.eat())
        print(son is Son)//is是类型检测符 返回的时bool类型的值
        print("--------------结构体------------")
        //创建一个构造器对象
        let rgbColor = Color(Red: 1.0, Green: 0.0, Blue: 0.5)
        print(rgbColor.red,rgbColor.green,rgbColor.blue)
        //新建一个类
        class NewClass1 {
            var value1:Int = 23
            var value2:String = "zhangxin"
            //指定构造器
            init(a:Int,b:String){
                value1 = a
                value2 = b
            }
            //便利构造器
            convenience init(){
                self.init(a: 30,b: "zhangxinzhang")
            }
            //析构方法------这个方法用于类中，当一个类的实例释放之前，析构方法被立即调用，用来执行某些特定的清除工作
            /**
            注意点：
            1 一个类中只能定义一个析构方法
            2 析构方法的调用是隐式调用，不可以是显式调用，也就是对象去调用析构方法
            3 析构方法只能用于类中，不能用于结构或者是枚举中
            */
            deinit{
                print("析构方法")
            }
        }

        class NewClass2:NewClass1{
            //重写父类中的指定构造器
            override init(a: Int, b: String) {
                super.init(a: 25, b: "xuqiuyi")
            }
        }
        //继承指定构造器，也就是init方法
        let newclass1 = NewClass2(a:5,b:"zhangxinxin")
        print(newclass1.value1,newclass1.value2)
        //继承便利构造器，也就是convenience构造器
        let newclass2 = NewClass2()
        print(newclass2.value1,newclass2.value2)
        var newclass3:NewClass1? = NewClass1()
        newclass3 = nil
        print("--------------扩展------------")
        //调用方法
        let extenclass = extensionClass()
        extenclass.printStr("hello")//调用对象方法
        print(extensionClass.add(2,5))//调用类方法
        print("--------------协议------------")
        let proclass = proClass()//实例化一个对象
        print("proclass age is \(proclass.age),name is \(proClass.name)")
        print(proclass.add(5, 4))//实例方法
        print(proClass.sub(4, 2))//类方法
        let other = otherProclass()
        print(other.add(4, 5))
        print(other.sub(5, 6))
        print("--------------泛型------------")
       
        let newFx = newFxClass<String>()//类型方法中的数据类型是String
        newFx.printValue("zhangxin")
        let newFx2 = newFxClass<Int>()//这个时候返回的就是Int类型的了
        newFx2.printValue(5)
        print("--------------关联类型------------")
    }

}







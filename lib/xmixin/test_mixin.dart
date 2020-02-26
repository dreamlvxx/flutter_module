

//mixin可以有abs方法  也可以有impl方法
mixin TestMixin{
  void method1();
  void method2(){
    print('impl method 2 in mixin 1');
  }
}

mixin TestMixin2{
  void method3();
  void method2(){
    print("impl method 2 in mixin2");
  }
}

//当存在两个mixin方法重复的情况下，后面的直接覆盖前面的
class OneTestMiXinImpl with TestMixin,TestMixin2{

  @override
  void method1() {
    print('impl method 1');
  }

  @override
  void method3() {
    print("impl method 3");
  }

}

//-----------------------属于某个类型的mixin---------------------------------
class BaseObject{
  void method(){
    print('base');
  }
}

mixin TestMixin3 on BaseObject{
  void method();
  void test23(){
    method();
  }
}
//只有继承于子类的class才能用这个mixin
class Test3 extends BaseObject with TestMixin3{

}








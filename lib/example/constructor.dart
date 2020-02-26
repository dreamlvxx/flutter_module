
class TestSuper{
  String aaa;
  String bbb;
  TestSuper.init(String nessary,{this.aaa,this.bbb,String othera});
}

class TestCo extends TestSuper{

  String name;
  String sex;
  String addr;

  TestCo(this.name,this.sex) : super.init("ness");
  //TestCo(this.name);不存在重载  所以这个不可以和上行同事存在

  TestCo.constru({name,sex,other}) : addr = "init pa", super.init("na");
  TestCo.con([name,ooo = "default"]) : super.init("aaa");
}


TestCo cc = TestCo.constru(name: "sad",sex: "asd");
TestCo cd = TestCo.con("sad");
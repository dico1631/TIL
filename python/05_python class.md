

- `__init__` : 생성자

  ___ : double underscore

- 캡슐화 : 변수는 숨기고 함수만 보여주는 것

  변수를 직접 수정할 수 있게 하면 보안상 문제가 되기 때문에 중간에 필터링(함수)를 거쳐야만 변수를 수정할 수 있게 만든 것

- 멤버 : 클래스에 속한 변수와 함수, class 메모리 등록시 등록되는 전역변수와 함수

  멤버가 아닌 것 : 지역변수, 함수 내의 변수, 반복문 사용을 위한 변수 등 제일 처음 class 등록시 메모리에 등록되지 않는 애들

- self가 있는 함수는 반드시 `객체 = class` 로 class를 메모리 등록 후 `객체.함수()`사용해야함

  없는 함수는 `class.함수` 로 바로 사용 가능,  `객체.함수()` 방법은 불가능

- class를 만들어야 라이브러리로 사용 가능

- self는 꼭 매개변수 중 제일 앞에 위치되어야 한다.

```python
class Student:
 num = 0 # 번호, 생략가능
 grade = 0 # 학년, 생략가능
 name = '' #이름, 생략가능
#내가 쓰진 않지만 반드시 주소값을 쓸 변수 self를 제일 앞에넣어놔야 함
 def setNum(self, num):
 self.num = num
 def setGrade(self, grade):
 self.grade = grade

 def setName(self, name):
 self.name = name
s = Student()
s.setNum(1)
s.setGrade(3)
s.setName('kim')
```

```python
class Book:
     # 코드 작성
    # title = ""
    # price = 0  안써도 자동으로 set 함수에서 생성됨. 보통 안씀
    def setTitle(self, name):
        self.title = name
    def setPrice(self, num):
        self.price = num


book1 = Book()
book1.setTitle('Python')
book1.setPrice(10000)
book2 = Book()
book2.setTitle('Java')
book2.setPrice(10000)
print(book1.title, book1.price)
print(book2.title, book2.price)
```

```python
class Car:
     # 생성자 작성
     #init을 쓰지 않으면 car1, car2가 따로 선언되었어도 class Car 이라는 틀에 있는 변수 1개를 둘이 공유한다. 각각 생기는 게 아님.
    def __init__(self):
        self.result = []
     # add_option 메소드 작성
    def add_option(self, option):
        self.result.append(option)
     # show_option 메소드 작성
    def show_option(self):
        return self.result

car1 = Car()
car2 = Car()
car1.add_option('전동 트렁크')
car1.add_option('통풍 시트')
car2.add_option('뒷자리 에어백')
car2.add_option('하이패스')
print(car1.show_option())
print(car2.show_option())
```



### 다형성

- 상속 : 부모 클래스의 내용을 자식이 그대로 가져옴
- 오버라이딩 : 상속받은 부모 클래스의 함수를 자식이 고쳐서 쓰는 것



### 모듈

> 라이브러리

- import [python파일명] (as [별칭])

- `if __name__ == '__main__':` : 모듈 개발 하는 동안 만드는 사람이 test를 하는데 이 test를 할 때 썼던 testset을 기록해둘때 쓰는 코드

  모듈로 가져와 쓰는 곳에선 `__name__`은 모듈 파일의 이름이 되고

  해당 모듈 자체를 실행하면 `__name__`은 `__main__`이 된다는 것을 이용

  

  모듈 개발자가 모듈 속 함수가 잘 돌아가는 지 보려고 아래와 같이 테스트 코드를 쓰고 돌려본다.

  근데 이걸 실수로 그대로 둔 채 다른 사람들이 쓸 수 있게 해버리면 다른 사람이 쓸 때는 실행하면 안되는데 실행이 되어버린다. 

  ```python
  def myfunc(a,b):
      return a+b
  
  myfunc(2, 3)
  ```

  위 경우를 막기 위해 아래 코드를 쓴다.

  ```python
  def myfunc(a,b):
      return a+b
  
  #이렇게 쓰면 이 파일이 아니라 다른 사람이 내껄 가져다 쓰는 경우엔 아래 코드가 실행이 안된다.
  if __name__ == '__main__':
      myfunc(2, 3)
  ```

  
# Django

> client와 상호작용하는 webserver

![image](https://user-images.githubusercontent.com/58927491/73327515-9f675400-4299-11ea-9d58-aa1f841b4a21.png)

### 																			MVC Roles and Relationships Diagram

- MTV 패턴 (Model, Template, View) 

   - Model : 데이터 처리 (DB의 테이블) 

   - Template : 클라이언트에게 보여줄 UI (HTML)

   - View : Controller와 비슷한 역할, 요청을 받은 후 [모델을 실행한 후] 응답 

     ● Model은 app/models.py 파일 내의 클래스 형식으로 작성 

     ● Template은 app의 templates 라는 디렉토리 하위에 작성 

     ● View는 app/views.py 파일 내의 함수 또는 클래스 형식으로 작성

- 작동 흐름

  client > Django에 요청 > Routing에서 url 확인, 필요 함수가 어떤 것인지 전달 > view Routing 에서 받은 정보를 가지고 Template (화면) 과 Model (DB 작동) 을 움직여서 실행, Django로 결과 전달 > Django는 client로 response

![image](https://user-images.githubusercontent.com/58927491/73327775-9c209800-429a-11ea-9178-7053c04927c2.png)

- 구조 : project 안에 view와 template를 가진 app/app들이 들어있음.

  ​			(app은 꼭 1개 이상)



## 1. Django 설치

```shell
C:\Windows\system32> cd/
C:\> mkdir django
C:\django> conda install django
```

```shell
C:\django> django-admin startproject tutorial
C:\django> cd tutorial
C:\django\tutorial> code .  #해당 폴더에 vscode가 켜짐
```



## 2. Vscode에서 Django 시작

- app 만들기

```shell
$ python manage.py startapp [firstapp]
```

- server 키기

```shell
$ python manage.py runserver
```


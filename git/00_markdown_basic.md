# 마크다운(Markdown)

> 일반 텍스트 형식 구문을 사용하는 마크업 언어의 일종으로 사용법이 쉽고 간결하여 빠르게 문서 정리를 할 수 있습니다. 단, 모든 HTML 마크업을 대체하지는 않습니다.

 

## 1. 문법

### 1.1 Header

> 헤더는 제목을 표현할 때 사용합니다. 단순히 글자의 크기를 표현하는 것이 아닌 의미론적인 중요도를 나타냅니다.

* `<h1>`부터 `<h6>` 까지 표현 가능합니다.
* `#` 의 개수로 표현하거나 `<h1></h1> ` 의 형태로 표현 가능합니다.



# h1 태그입니다.

## h2 태그입니다.

### h3 태그입니다.

#### h4 태그입니다.

##### h5 태그입니다.

###### h6 태그입니다.

### 1.2 List

> 목록을 나열할 때 사용합니다. 순서가 필요한 항목과 그렇지 않은 항목으로 구불할 수 있습니다. 순서가 있는 항복 아래 순서가 없는 항목을 지정할 수 있으며 그 반대도 가능합니다.

* 순서가 있는 목록
  * `1.` 을 누르고 스페이스바를 누르면 생성할 수 있습니다.
  * `tab` 키를 눌러서 하위 항목을 생성할 수 있고 `shift + tab` 키를 눌러서 상위 항목으로 이동 할 수 있습니다.
* 순서가 없는 목록		
  * `-` (하이픈)을 쓰고 스페이스바를 누르면 생성 할 수 있습니다.
  * `tab` 키를 눌러서 하위 항복을 생성할 수 있고 `shift + tab` 키를 눌러서 상위 항목으로 이동 할 수 있습니다.



1. 순서가 있는 항목
2. 순서가 있는 항목
   1. 순서가 있는 하위 항목
   2. 순서가 있는 하위 항목



- 순서가 없는 항목
- 순서가 없는 항목
  - 순서가 없는 하위 항목
  - 순서가 없는 하위 항목



### 1.3 Code Block

> 코드 블럭은 작성한 코드를 정리하거나 강조하고 싶은 부분을 나타낼 때 사용합니다. 인라인과 블럭 단위로 구분 할 수 있습니다.

- Inline
  - 인라인 블럭으로 처리하고 싶은 부분을 `(백틱)으로 감싸줍니다.
- Block
  -  \` (백틱)을 3번 입력하고 `enter` 를 눌러 생성합니다.



`add` 한 요소를 remote 저장소에 올리려면 `$ git push origin master` 를 터미널에 입력합니다.

```shell
$ git add .
$ git commit -m "first commit"
$ git push origin master
```



### 1.4 Image

> 로컬에 있는 이미지를 삽입하거나 이미지 링크를 활용하여 이미지를 나타낼 때 사용합니다.

- `![]()` 을 작성하고 `()` 안에 이미지 주소를 입력합니다. `[]` 안에는 이미지 파일의 이름을 작성합니다.
- 로컬에 이미 파일을 저장한 경우 절대 경로가 아닌 상태 경로응 사용하여 이미지를 저장합니다.



![](https://git-scm.com/images/logo@2x.png)  ![](data:image/png;base64,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) 



### 1.5 Link

> 특정 주소로 링크를 걸 때 사용합니다.

- `[]()` 을 작성하고 `()` 안에 링크 주소를 작성하고 `[]` 안에 어떤 링크 주소인지 작성합니다.

[git 공식 사이트](https://git-scm.com/)

[github 공식 사이트](https://github.com/)



### 1.6 Table

> 표를 작성하여 요소를 구분할 수 있습니다.

- `|` (파이프) 사이에 컬럽을 작성하고 `enter` 를 입력합니다.

- 마지막 컬럼을 작성하고 뒤에 `|` 를 붙여줍니다.

  ex) |working copy|cache|tree|

| working directory | staging area | remoerepo |
| ----------------- | ------------ | --------- |
| working tree      | index        | history   |
| working copy      | cache        | tree      |



### 1.7 기타

##### 인용문

- `>` 을 입력하고 `enter` 키를 누릅니다.

> git은 컴퓨터 파일의 변경사항을 추적하고 여러 명의 사용자들 간에 해당 파일들의 작업을 조율하기 위한 분산 버전 관리 시스템이다.

- 인용문 안에 인용문을 작성하면 중첩해서 사용할 수 있습니다.

> $ git add . 
>
> > $ git commit -m "first commit"
> >
> > > $ git push origin master



##### 수평선

- `---`. `***` ,`___` 을 입력하여 작성합니다.

working Directorty

---

Staging Area

---

Remote Repository

---

##### 강조

- 이탤릭체는 해당 부분을 `*` 혹은 `_`(언더바)로 감싸줍니다.
- 보드체는 해당 부분을 `**` 혹은 `__`(언더바 2개)로 감싸줍니다.
- 취소선은 해당 부분을 `~~` 로 감싸줍니다.

이것은 *이탤릭체*입니다.

이것은 **보드체**입니다.

이것은 ~~취소선~~ 입니다.



## 2. 과제

- 이 파일의 내용을 그대로 따라 작성하기.
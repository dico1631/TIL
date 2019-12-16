# CLI

> 커맨드 라인 인터페이스

#### 터미널 명령어들

- `ls`  : 디렉토리 내 구성 리스트 출력
- `pwd`  : print working directory 현재 내 위치 알기
  - 첫 pwd 했을 때 위치가 home directory : /c/users > ~ 이 이 폴더 의미

- `mkdir` [폴더명] : 폴더 생성
- `cd` [폴더명] : 폴더 변경
- `cd ..`  :  상위 폴더로 이동
  - `..` 은 상위 폴더를 의미
- `git init`  : git 시작
  - Initialized empty Git repository in C:/Users/student/.git/   가 나옴
  - `.git`  : `. `[폴더명] 은 숨김 폴더를 의미. `ls`로는 보이지 않음
- `ls -a`  : 숨김 폴더까지 전부 보기
- `git status`  : 상태 확인하기
- `touch` [파일명] : 파일 만들기
- `rm` [파일명] : 파일 지우기

---

#### 단축키

- tab키 : 자동완성, 아래 코드들을 연습할 때 파일명을 다 치지 말고 이 단축키 이용할 것

# git / github 사용법

```shell
#은 단순 설명을 위한 주석. 코드가 아님

#git이 잘 깔렸는지 확인 (버전 확인)
student@M15035 MINGW64 ~
$ git --version
git version 2.24.1.windows.2

#공부 한 내용을 넣을 파일을 만들기(today I Learned)
student@M15035 MINGW64 ~
$ mkdir TIL 

#TIL 파일로 이동
student@M15035 MINGW64 ~
$ cd TIL/

#TIL 파일에 git 시작 ** 꼭 TIL 파일(빈 파일)에서 시작해야함
#git은 폴더 단위로 관리를 하기 때문에 빈 파일에 넣지 않으면 다 자기가 관리해야 하는 파일로 인식한다.
#따라서 home directory에서 시작시키면 안됨
student@M15035 MINGW64 ~/TIL
$ git init
Initialized empty Git repository in C:/Users/student/TIL/.git/

#git을 숨김 폴더로 만들었기 때문에 확인하려면 ls -a 해야함
student@M15035 MINGW64 ~/TIL (master)
$ ls

student@M15035 MINGW64 ~/TIL (master)
$ ls -a
./  ../  .git/

#git 상태 확인
student@M15035 MINGW64 ~/TIL (master)
$ git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

#a.txt 파일 만들어보고 확인
student@M15035 MINGW64 ~/TIL (master)
$ touch a.txt

student@M15035 MINGW64 ~/TIL (master)
$ ls
a.txt

#만들었던 a.txt 지우고 확인
student@M15035 MINGW64 ~/TIL (master)
$ rm a.txt

student@M15035 MINGW64 ~/TIL (master)
$ ls
```

```shell
#git은 폴더 단위로 버전을 관리한다.
#버전 관리한다는 것은 현 상태를 스냅샷 찍는 것 같이 관리한다.
#현 상태의 모습을 사진대에 올리고 (add) 스냅샷을 찍는 (commit) 느낌
#사진대 : staging area

#사진대에 파일을 올린다.
student@M15035 MINGW64 ~/TIL (master)
$ git add 00_markdown_basic.md

#git 상태 확인
#add가 되면 '00_markdown_basic.md'가 초록색으로 바뀜
student@M15035 MINGW64 ~/TIL (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   00_markdown_basic.md
```

```shell
#스냅샷 찍어서 저장해보기

#실패 화면
student@M15035 MINGW64 ~/TIL (master)
$ git commit

*** Please tell me who you are. #나는 너가 누군지 몰라

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
#최소한 너의 이메일과 이름은 알려줘

Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'student@M15035.(none)')

#시킨대로 이름과 이메일 설정
student@M15035 MINGW64 ~/TIL (master)
$ git config --global user.email "dicoqnfkrzl@naver.com"

student@M15035 MINGW64 ~/TIL (master)
$ git config --global user.name "Min Jung"

student@M15035 MINGW64 ~/TIL (master)
$ git config --global user.email
dicoqnfkrzl@naver.com

student@M15035 MINGW64 ~/TIL (master)
$ git config --global user.email
dicoqnfkrzl@naver.com

#성공 화면
#절대 git commit 하고 엔터치지 말기!!!
student@M15035 MINGW64 ~/TIL (master)
$ git commit -m "first commit"
[master (root-commit) 0006544] first commit
 1 file changed, 170 insertions(+)
 create mode 100644 00_markdown_basic.md
 
 #commit한 것 확인하기
 student@M15035 MINGW64 ~/TIL (master)
$ git log
commit 000654421782e43cf3b096e24402bbea0fdfdd7c (HEAD -> master)
Author: Min Jung <dicoqnfkrzl@naver.com> #누가
Date:   Mon Dec 16 17:15:28 2019 +0900 #언제

    first commit #무엇을 추가했는지 알려줌

```

```shell
#2번째 파일 git에 등록해보기

#git 현 상태 확인
student@M15035 MINGW64 ~/TIL (master)
$ git status
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        01_cli.md

nothing added to commit but untracked files present (use "git add" to track)

#add
student@M15035 MINGW64 ~/TIL (master)
$ git add 01_cli.md

#git 현 상태 확인
student@M15035 MINGW64 ~/TIL (master)
$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   01_cli.md

#commit
student@M15035 MINGW64 ~/TIL (master)
$ git commit -m "add 01_cli.md"
[master 5d8db9c] add 01_cli.md
 1 file changed, 165 insertions(+)
 create mode 100644 01_cli.md

 #commit한 것 확인하기
student@M15035 MINGW64 ~/TIL (master)
$ git log
commit 5d8db9c15de96192933e23c13a19fe996896a370 (HEAD -> master)
Author: Min Jung <dicoqnfkrzl@naver.com>
Date:   Mon Dec 16 17:20:24 2019 +0900

    add 01_cli.md

commit 000654421782e43cf3b096e24402bbea0fdfdd7c
Author: Min Jung <dicoqnfkrzl@naver.com>
Date:   Mon Dec 16 17:15:28 2019 +0900

    first commit


```


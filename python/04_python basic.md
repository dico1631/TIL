> 개발 환경 : miniconda(python), vs code, jupyter

# 아나콘다

- 구글 검색으로 미니콘다 설치 (위치 주소에 한글/띄어쓰기 없게 하기, Add path 라는 항목 선택하기)
- 가상 환경을 세팅하고 python을 자동으로 설치해줌

- python은 언어, 이건 한 번 설치하면 다른 python 버전은 사용 할 수 없음
- 아나콘다는 python을 관리하기 위한 프로그램으로 다른 python 버전까지, 다양한 버전을 사용 가능하게 해줌. 
- 설치 확인: cmd > python --version, conda --version



# jupyter

- 개발툴

- 한 줄씩 실행되고 성공시 실행 내용을 저장해두기에 중간에 문제가 생겨도 처음부터 실행할 필요가 없음
- 설치 : cmd > conda install jupyter
- 실행 : cmd > jupyter notebook > 인터넷창이 뜸 (안되면 나온 url로 들어가기) : 이때 뜬 위치가 root > new에서 python 3
- 종료 : 브라우저를 끄고 ctrl+c

### 단축키

- 파랑모드 + h : 단축키 모음 보기
- 파랑모드 + dd : 삭제
- 파랑모드 + a or b : 앞(a) 뒤(b)에 코드창 만듬
- shift + enter  : 실행 후 아래로 내려감
- alt + enter : 실행 후 아래에 코드창 만듬
- ctrl + enter : run

# vs code

- vs code 에서 python 과 AREPL for python 확장팩 설치



# 가상환경

- 개발할 때는 라이브러리와 같은 남이 만든 것을 사용하게 됨
- 그러면 그 사람이 개발 당시에 사용한 개발 환경과 같아야만 작동되는 경우가 많음
- 그렇기에 사용하려면 매번 그 개발 환경과 같도록 지우고 다시 설치해야 하는 불편함이 생김. 그리고 내가 원하는 환경과 다를 수도 있음
- 그래서 이를 막고자 가상의 공간을 여럿 만들어서 거기에 필요환경을 설치 (python 버전 등)
- 그러면 용량은 늘어나지만 유연한게 사용가능

### 아나콘다에 가상환경 만들기

- conda create --name [이름] : 가상환경 만들기

  가상환경은 Miniconda3의 envs에만 만들어지기에 어디서 실행하든 가능

  python의 가상환경의 경우엔 가상환경 만든 위치에 만들어지기에 해당 폴더로 가서 실행해야 함

- conda activate [이름] : 만든 가상환경 실행

- conda deactivate : 현재 가상환경 종료

- conda list : 가상환경에 설치된 프로그램 리스트 보기

- conda install [matplotlib/설치할 것] : 가상환경에 설치 > 설치한 내용은 해당 가상환경에서만 볼 수 있음

- 가상환경 이름 폴더로 가서 지우기 : 가상환경 지우기



# 패키지 관리

- 내가 원하는 라이브러리 등을 자동으로 다운받아 주는 것

  ex) java의 gradle, maven / python의 pip / conda install



- %reset : 내 변수 전체 삭제
- del [변수명] : 변수 삭제
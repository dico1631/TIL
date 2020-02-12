# jupyter notebook 명령어

- !  : 시스템 명령어 , cmd 창에 쓰는 명령어(windows 명령어, linux 명령어)

- % : 매직 명령어, 리눅스 명령어를 그대로 사용할 수 있음
  - load : file 불러오기
  - run : python 파일 실행
- %% : 



# data structure의 용도

1. list
   - 임시적 데이터 저장
   - 여러 결과물을 저장
2. tuple
   - 데이터의 안전한 저장
   - 변경 불가능
   - 파라미터 값 저장
   - *args : value만 있음, *은 container을 벗겨라라는 의미
3. dict
   - lookup table, 참조 데이터
   - table의 record
   - xml 파싱 결과나 json 저장
   - **kwargs : key와 value, * 하나는 { }, 나머지 하나는 key를 벗겨서 value를 쓸 수 있게 함
4. set
   - dict의 key를 저장하는 용도
   - 전역변수를 저장하는 용도
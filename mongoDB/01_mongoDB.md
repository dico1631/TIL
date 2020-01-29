# mongo DB

> NoSQL 중에 하나
>
> 정리없이 다 그냥 저장할 때 사용

- sharding system : data를 쪼개 여러 서버에 담아서 사용하는 것. mongo DB는 서버 개수 3개 이상을 강조한다.
  - 문제점 : 서버가 문제가 생겨도 실시간으로 알 수가 없다.  
- replica : 복구를 위해 똑같은 data를 복제하는 방법.

- scalout :  비슷한 성능을 가진 부품을 병렬형태로 늘린다.
  - scalup : 더 나은 성능을 가진 부품으로 변경한다. (반대말)
- mongoDB 툴 : robo 3T



- mongod --port [20000 바꿀 포트 주소] --dbpath [c:/data/s1 DB로 쓸 파일 위치] : data 저장소를 바꿈, shard 하는 방법
  - mysql : 1개의 서버를 두고 다양한 방법으로 접근이 가능
  - mongoDB : 서버를 여러 개 만들어서 사용

- cmd창을 X 버튼을 눌러서 꺼버리면 (서버를 꺼버리는 것) 데이터가 유실될 수 있음. 안전하게 꺼지도록 명령어를 통해 종료해야 함.

```javascript
//mongoDB 시작하기
C:\Users\student>mongo

MongoDB shell version v4.2.3
connecting to: mongodb://127.0.0.1:27017/?
..(생략)..
To permanently disable this reminder, run the following command: db.disableFreeMonitoring()
---

> //여기에 쓰기 시작
```

```javascript
//DB보기
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
//DB test를 만들기, 없으면 만들어 줌
> use test
switched to db test
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
//data 저장
> db.test_col.save({'key':'value'})
WriteResult({ "nInserted" : 1 })
> show dbs
admin   0.000GB
config  0.000GB
local   0.000GB
test    0.000GB
> db.test_col.save({'key1':'value1'})
WriteResult({ "nInserted" : 1 })
> db.test_col.save({'key2':'value2'})
WriteResult({ "nInserted" : 1 })
> show collections
test_col
> db.test_col.save({'key3':'value3'})
WriteResult({ "nInserted" : 1 })
```

```javascript
//data 보기
> db.test_col.find()
{ "_id" : ObjectId("5e2fd3cd812dd0b56c97e5a7"), "key" : "value" }
{ "_id" : ObjectId("5e2fd3f9812dd0b56c97e5a8"), "key1" : "value1" }
{ "_id" : ObjectId("5e2fd409812dd0b56c97e5a9"), "key2" : "value2" }
{ "_id" : ObjectId("5e2fd4b4812dd0b56c97e5aa"), "key3" : "value3" }
> for(var i = 0; i <= 5; i++){
... print('aaa' + i)}
aaa0
aaa1
aaa2
aaa3
aaa4
aaa5
> db.score.save({a:99})
WriteResult({ "nInserted" : 1 })
> db.score.find()
{ "_id" : ObjectId("5e2fd595812dd0b56c97e5ab"), "a" : 99 }
> for(var i = 0; i <= 5; i++){
... db.score.save({a:i, exam:5}) }
WriteResult({ "nInserted" : 1 })
> db.score.find()
{ "_id" : ObjectId("5e2fd595812dd0b56c97e5ab"), "a" : 99 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5ac"), "a" : 0, "exam" : 5 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5ad"), "a" : 1, "exam" : 5 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5ae"), "a" : 2, "exam" : 5 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5af"), "a" : 3, "exam" : 5 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5b0"), "a" : 4, "exam" : 5 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5b1"), "a" : 5, "exam" : 5 }

```

```javascript
//조건에 맞는 것 찾기
> db.score.find({a:2})
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5ae"), "a" : 2, "exam" : 5 }
//a가 15보다 큰 것 찾기
> db.score.find({a:{$gt : 15}})
{ "_id" : ObjectId("5e2fd595812dd0b56c97e5ab"), "a" : 99 }
//$gt와 같은 언어: 크라이테리아
//a가 2보다 크고, 4 이하 인 것
> db.score.find({a:{$gt : 2, $lte : 4}})
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5af"), "a" : 3, "exam" : 5 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5b0"), "a" : 4, "exam" : 5 }
```

```javascript
//or 연산 {$or : [{조건1},{조건2}]}
> db.score.find({$or : [{a:5},{a:99}]})
{ "_id" : ObjectId("5e2fd595812dd0b56c97e5ab"), "a" : 99 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5b1"), "a" : 5, "exam" : 5 }
```

```javascript
//조건 외의 것
> db.score.find({ a : { $nin : [ 2, 3, 4 ] } } )
{ "_id" : ObjectId("5e2fd595812dd0b56c97e5ab"), "a" : 99 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5ac"), "a" : 0, "exam" : 5 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5ad"), "a" : 1, "exam" : 5 }
{ "_id" : ObjectId("5e2fd5d6812dd0b56c97e5b1"), "a" : 5, "exam" : 5 }
```

```javascript
//있다면, 없다면
> db.score.find( { exam : { $exists : false } } )
{ "_id" : ObjectId("5e2fd595812dd0b56c97e5ab"), "a" : 99 }
```

```javascript
//필요 컬럼만 보기
// id는 보이지 말고 a만 보여라, id는 기본키라서 지정 안하면 보이는게 디폴트
> db.score.find({ }, { _id:0, a:1 } )
{ "a" : 99 }
{ "a" : 0 }
{ "a" : 1 }
{ "a" : 2 }
{ "a" : 3 }
{ "a" : 4 }
{ "a" : 5 }
```

- 값 수정(Update) : mongoDB는 기존 구조가 어떤 모양이었든 그냥 덮어쓰기 해버림
- $set : 없던 값은 넣고, 있던 값은 값만 바꿈, 언급 안한 건 남겨둠

```javascript
//update
> db.users.find()
{ "_id" : ObjectId("5e2fe0f6812dd0b56c97e5b2"), "name" : "Cash", "lang" : [ "eng" ] }
{ "_id" : ObjectId("5e2fe0fe812dd0b56c97e5b3"), "name" : "Sue", "lang" : [ "python", "java" ] }
> db.users.update( { name : 'Cash'}, { name : 'J'})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find()
{ "_id" : ObjectId("5e2fe0f6812dd0b56c97e5b2"), "name" : "J" }
{ "_id" : ObjectId("5e2fe0fe812dd0b56c97e5b3"), "name" : "Sue", "lang" : [ "python", "java" ] }
```

```javascript
//set 사용
> db.users.update( { name : 'J'}, { $set : { age : 50 } } )
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find()
{ "_id" : ObjectId("5e2fe0f6812dd0b56c97e5b2"), "name" : "J", "age" : 50 }
{ "_id" : ObjectId("5e2fe0fe812dd0b56c97e5b3"), "name" : "Sue", "lang" : [ "python", "java" ] }
```

```javascript
//컬럼 지움, age를 지우는게 중요한 거라 age가 70이 아니어도 해당 이름의 age를 지움
> db.users.update( { name : 'J'}, { $unset : { age : 70 } } )
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find()
{ "_id" : ObjectId("5e2fe0f6812dd0b56c97e5b2"), "name" : "J" }
{ "_id" : ObjectId("5e2fe0fe812dd0b56c97e5b3"), "name" : "Sue", "lang" : [ "python", "java" ] }
```

```javascript
//data를 pop, push
//pop
> db.users.update( { name : 'Sue'}, { $pull : { lang : 'java' } } )
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find()
{ "_id" : ObjectId("5e2fe0f6812dd0b56c97e5b2"), "name" : "J" }
{ "_id" : ObjectId("5e2fe0fe812dd0b56c97e5b3"), "name" : "Sue", "lang" : [ "python" ] }

//push
> db.users.update( { name : 'Sue'}, { $push : { lang : 'javascript' } } )
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> db.users.find()
{ "_id" : ObjectId("5e2fe0f6812dd0b56c97e5b2"), "name" : "J" }
{ "_id" : ObjectId("5e2fe0fe812dd0b56c97e5b3"), "name" : "Sue", "lang" : [ "python", "javascript" ] }
```

```javascript
//row 지우기
> db.users.remove({ name : 'Sue'})
WriteResult({ "nRemoved" : 1 })
> db.users.find()
{ "_id" : ObjectId("5e2fe0f6812dd0b56c97e5b2"), "name" : "J" }
//collection 내용물 비우기
> db.users.remove({ })
WriteResult({ "nRemoved" : 1 })
> db.users.find()
//collection 지우기
> show collections
users
> db.users.drop()
true
> show collections
> 
```


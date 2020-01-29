# Replica

- primary 서버가 있고 이를 복제한 replica 서버들이 있다.

- primary 서버과 replica 서버들은 서로 heartbeat을 체크해서 죽었는지 살았는지 확인한다.

- primary 서버가 죽으면 replica 서버들에서 1개를 정해서 primary 서버로 만든다.

- replica 서버가 죽으면 다시 살리는 그 시간동안 들어온 data를 복제해서 넣을 수 없으니까, oplog에 데이터를 모아뒀다가 복구 후 복제해 넣는다.

- 단점 : primary가 죽었어도 heartbeat을 보내서 죽었는지 확인하기 전까진 알 수 없다. 바로 죽자마자 알 수 있는 게 아님. 이 죽어있는데 알지 못한 시간동안 data가 들어오면 그 data들은 날라간다.

- mongoDB는 3개의 replica를 권장한다.

# Sharding

- primary + replica들 = 1개의 shard
- shard들과 config servers가 필요하다.
- config servers는 mongos에게 들어온 data를 각 shard에 어떻게 나눠줄지를 알려주는 서버이다. data는 config servers에 있다.
- mongos는 shard에 데이터를 나눠주는 역할의 서버이다.
- config servers와 mongos도 죽을 때를 대비해 replica set을 만들 수 있다.

![image](https://user-images.githubusercontent.com/58927491/73320959-55c03e80-4284-11ea-99ef-6020b007f054.png)

- mongoDB는 3개의 shard를 권장한다. (shard 3개, 각각에 replica 3개, 총 9개)


SET @@AUTOCOMMit = 0; #자동 저장을 꺼서 실수하면 되돌리기를 할수 있게 함
ROLLBACK;  #바로 직전 것만 돌아갈 수 있음
COMMIT;  #영구저장을 시킴
SELECT * FROM 제품;

-- UPDATE
UPDATE 제품 SET 제품명 = '통큰파이';
WHERE 제품명 = '쿵떡파이'; #WHERE 필수! 안쓰면 다 날라감!
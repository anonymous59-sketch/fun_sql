// express 서버모듈
const express = require("express"); // express 모듈을 자바스크립트 파일 안에서 사용하기 위해서 import하는 과정
const db = require('./db');
// console.log(db); 어떤 기능을 import 받아왔는지 확인하기

const app = express(); // 인스턴스 생성.

// (url주소) 매칭 (실행함수) => 라우팅 정보
// "/"
// "/customer"
app.get('/', (req, res) => { // 첫번째 매개값 (요청정보에 포함되어있는 것을 처리하는 변수 , 응답 정보를 처리해주는 변수)
  res.send('박상원 홈에 오신 것을 환영합니다.');
});

app.get('/customer', (req, res) => {
  res.send('박상원 customer');
});

app.get('/product', (req,res) => {
  res.send('박상원 product');
});

// "/student" -> 화면에 출력
app.get('/student/:studno1'/* :studno는 studno라는 변수값을 사용자의 요청 정보로 받아서 사용하겠다. */, async(req, res) => {
  console.log(req.params.studno1);
  const studno = req.params.studno1;
  const qry = `SELECT * FROM student WHERE studno = ${studno}`;
  const connection = await db.getConnection();
  const result = await connection.execute(qry);
  res.send(result.rows); // 반환되는 결과값 중에서 rows라는 속성의 값만 가져오기
})

// '/employee' 사원목록을 출력하는 라우팅
app.get('/employee/:empno', async(req, res) => {
  console.log(req.params.empno);
  const empno = req.params.empno;
  const qry = `SELECT * FROM emp WHERE empno = ${empno}`;
  const conncection = await db.getConnection();
  const result = await conncection.execute(qry);
  res.send(result.rows);
})

// 서버 실행
app.listen(3000, () => {
  console.log("server 실행 : http://localhost:3000");
}); // 매개값 listen(포트번호, 실행할 함수)
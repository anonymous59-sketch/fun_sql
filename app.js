// express 서버모듈
const express = require("express"); // express 모듈을 자바스크립트 파일 안에서 사용하기 위해서 import하는 과정
const db = require('./db');
// console.log(db); 어떤 기능을 import 받아왔는지 확인하기

const app = express(); // 인스턴스 생성.

app.use(express.static("public"));
// 퍼블릭 폴더 만들고 그 안에 있는 정적 페이지를 넣어놨다는 것을 서버에 알리는 역할
// 기본값으로 index.html 파일을 불러온다.
// 다른 파일을 불러오려면 기본값 설정을 바꾸거나 다른 방법이 필요
app.use(express.json());
// app에 json 문자를 처리할 수 있는 기능을 추가한다.

// (url주소) 매칭 (실행함수) => 라우팅 정보
// "/"
// "/customer"
app.get('/', (req, res) => { // 첫번째 매개값 (요청정보에 포함되어있는 것을 처리하는 변수 , 응답 정보를 처리해주는 변수)
  res.send('박상원 홈에 오신 것을 환영합니다.');
});

// 글 전체 목록 반환
app.get('/boards', async (req,res) => {
  const qry = `SELECT * FROM board ORDER BY 1`;
  try {
    const connection = await db.getConnection();
    const result = await connection.execute(qry); 
    console.log('성공 boards');
    res.send(result.rows);
  } catch(err) {
    console.log(err);
    res.send('실패 boards');
  }
})

/* // app.get('/customer', (req, res) => {
//   res.send('박상원 customer');
// });

// app.get('/product', (req,res) => {
//   res.send('박상원 product');
// }); */
    
// get 요청방식은 길이기 2kb까지 되어서 단순 조회에 많이 사용된다. 보안도 취약함 head영역, 처리방식 빠름
// post 요청방식은 많은 데이터를 전달할 수 있고 보안도 되어있다. body영역
// INSERT INTO 기능 만들어보기
app.post('/add_board', async(req, res) => {
  console.log(req.body);
  const {board_no, title, content, writer, write_date} = req.body; // 객체로 값을 빠르게 받아오는 방법
  // console.log(board_no, title);
  const qry = /* `INSERT INTO board (board_no, title, content, writer)
               VALUES(${board_no}, '${title}', '${content}', '${writer}')` */
               `INSERT INTO board (board_no, title, content, writer, write_date)
               VALUES(:board_no, :title, :content, :writer, :write_date)`;
  try {
    const connection = await db.getConnection();
    const result = await connection.execute(qry, [
      board_no,
      title,
      content,
      writer,
      new Date(write_date)
    ]);
    // binding 방식 
    // console.log(result);
    connection.commit();
    // commit()을 해줘야 데이터베이스에 적용이 된다.
    res.json({board_no, title, content, writer, write_date});
    // 객체이지만 속성과 속성값이 같아서 생략함
    // res.send('처리완료'); // 서버 -> 클라이언트 응답결과를 보내준다.
    // 서버에 데이터를 넣으면 오류든 아니든 반드시 값을 반환하니까 기억하자
  } catch(err) {
    console.log(err);
    // res.send('처리 중 에러');
    res.json({retCode: 'NG', retMsg:'DB 에러'});
  }
});

app.get(`/remove_board/:board_no`, async(req, res) => {
  // console.log(req.params.board_no);
  const del_no = req.params.board_no;
  try{
    const qry = `DELETE FROM board WHERE board_no = ${del_no}`;
    const connection = await db.getConnection();
    const result = await connection.execute(qry);
    console.log('성공 remove_board');
    connection.commit();
    // console.log(result);
    res.json({retCode:'OK'});
  } catch(err) {
    console.log(err);
    res.json({retCode:'NG'});
  }
})

// "/student" -> 화면에 출력
app.get('/student/:studno1'/* :studno는 studno라는 변수값을 사용자의 요청 정보로 받아서 사용하겠다. */, async(req, res) => {
  console.log(req.params.studno1);
  const studno = req.params.studno1;
  const qry = `SELECT * FROM student WHERE studno = ${studno}`;
  const connection = await db.getConnection();
  const result = await connection.execute(qry);
  res.send(result.rows); // 반환되는 결과값 중에서 rows라는 속성의 값만 가져오기
});

// '/employee' 사원목록을 출력하는 라우팅
app.get('/employee/:empno', async(req, res) => {
  console.log(req.params.empno);
  const empno = req.params.empno;
  try{
    const qry = `SELECT * FROM emp WHERE empno = ${empno}`;
    const connection = await db.getConnection();
    const result = await connection.execute(qry);
    connection.commit();
    res.send(result.rows);
  } catch(err) {
    console.log(err);
  }
  res.send(result.rows);
});

// insert into 기능은 보통 post 형식으로 사용하는 것이 표준

// 서버 실행
app.listen(3000, () => {
  console.log("server 실행 : http://localhost:3000");
}); // 매개값 listen(포트번호, 실행할 함수)

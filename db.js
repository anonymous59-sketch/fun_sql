// db.js
const oracledb1 = require("oracledb");

// 조회 데이터를 객체로 표현 옵션
oracledb1.outFormat = oracledb1.OUT_FORMAT_OBJECT;

const dbconfig = {
  user: 'scott',
  password: 'tiger',
  connectString: 'localhost:1521/xe',
} // database 정보를 입력

// db에 접속하기 위한 session을 얻어 오는 함수.
async function getConnection() {
  try{
    const connection = await oracledb1.getConnection(dbconfig);
    return connection; // 연결(session)을 반환
  } catch(err) {
    return err;
  } 
}

// 외부 js 파일에서 사용할 수 있도록 export
module.exports = {getConnection, execute};

// 비동기처리 -> 동기방식 처리
async function execute() {
  //session 획득.
  const qry = `insert into board (board_no, title, content, writer) 
               values(5, 'db입력', '연습중입니다', 'user01')`;
  try {
    const connection = await oracledb1.getConnection(dbconfig);
    const result = await connection.execute(qry);
    connection.commit(); // 커밋하겠다.
    console.log(`DB 등록 성공`);
    console.log(result);
  } catch(err) {
    console.log(`예외발생 => ${err}`);
  }
} // end of execute()
// execute();

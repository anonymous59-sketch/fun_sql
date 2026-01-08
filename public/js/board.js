// fetch를 통해 

fetch('./boards')
.then(response => {
  return response.json();
})
.then(result => {
  // console.log(result);
  // 반복
  result.forEach(elem => {
    // tbody 만들기
    const insertHtml = `
            <tr>
              <td>${elem['BOARD_NO']}</td>
              <td class="title">${elem['TITLE']}</td>
              <td>${elem['CONTENT']}</td>
              <td>${elem['WRITER']}</td>
              <td>${new Date(elem['WRITE_DATE']).toLocaleString()}</td>
              <td><button onClick='deleteRow(${elem['BOARD_NO']}, this)' class="delete">X</button></td>
            </tr>
          `;
    const subject = document.querySelector('tbody');
    subject.insertAdjacentHTML('beforeend', insertHtml)
  });
})
.catch(err => {
  console.log(err); 
})

// form에 submit 이벤트 등록
document.querySelector('form').addEventListener('submit', e => {
  e.preventDefault();
  const board_no = document.querySelector('#postNo').value;
  const title = document.querySelector('#title').value;
  const content = document.querySelector('#content').value;
  const writer = document.querySelector('#writer').value;
  const write_date = new Date();

  // 입력값 체크
  if (!board_no || !title || !content || !writer) {
    alert('필수 값 입력')
    return;
  }
  const data = {
    board_no,
    title,
    content,
    writer,
    write_date
  };
  // fetch 함수 입력
  fetch("add_board", {
      method: 'post',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data),
    })
    .then((data /* fetch에서의 결과값 */ ) => {
      // console.log(data);
      // return data.text(); // 결과값이 strean이라 문자열로 변환
      return data.json(); // 
    }) // fetch의 실행이 성공이면
    .then(result /* 위의 then의 결과값 */ => {
      // console.log(result);
      const insertHtml = `
              <tr>
                <td>${result['board_no']}</td>
                <td class="title">${result['title']}</td>
                <td>${result['content']}</td>
                <td>${result['writer']}</td>
                <td>${new Date(result['write_date']).toLocaleString()}</td>
                <td><button onClick='
                deleteRow(${result['board_no']}, this)' class="delete">X</button></td>
              </tr>
            `;
      const subject = document.querySelector('tbody');
      subject.insertAdjacentHTML('beforeend', insertHtml);
    })
    .catch((err) => {
      console.log(err);
    }) // fetch의 실행이 에러면;
    // console.log(document.querySelector('input'));
    document.querySelectorAll('input').forEach(elem => elem.value = '');  
    document.querySelector('textarea').value = '';
    document.querySelector('#postNo').focus();
})


// 삭제 버튼 함수
function deleteRow(dno, delBtn) {
  fetch(`remove_board/${dno}`)
  .then(response => {
    return response.json();
  })
  .then(result => {
    // console.log(result.retCode);
    if (result.retCode == 'OK'){
      // console.log(delBtn.parentElement.parentElement);
      delBtn.parentElement.parentElement.remove();
    } else if (result.retCode == 'NG'){
      alert('제대로 삭제되지 않았습니다.')
    }
  })
  .catch(err => {
    console.log(err);
  })
}
// 삭제 버튼 이벤트 
// 삭제기능
// 요청방식(get) - '/remove_board/:board_no'
// 반환된 결과 ({retCode: 'OK' or 'NG'})

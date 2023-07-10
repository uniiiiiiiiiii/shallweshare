	$('#withdrawal_submit').on('click', function(e) {
		e.preventDefault();
		var w_check = $("#w_check").val();
		var u_id = $('input[name=u_id]').val();
		console.log(u_id);
		if (w_check.trim() == '') {
			alert('데이터를 입력해주세요');
		}else if(w_check!='탈퇴합니다') {
			alert('입력값이 맞지 않습니다.');
		}else {
			alert("회원 탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			
			location.href='../mypage/withdrawal_process'
			
		}
	});

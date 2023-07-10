<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
function deleteCheck() {
	
	var sessionU_id = '<%= session.getAttribute("u_id") %>';
	var u_id = '${party.u_id}';
	console.log("sessionU_id="+sessionU_id+","+"u_id="+u_id)
	
	if (sessionU_id === u_id) {
		var result = confirm('삭제하시겠습니까?');

        if(result) {
	    	window.location='party_delete?p_id=${party.p_id}';
	    	alert('파티를 삭제하였습니다. 메인페이지로 이동합니다.')
        } else {
            //no
        }
	} else {
	    // 세션의 u_id 값과 JSP 안의 u_id 값이 일치하지 않는 경우
	    alert("파티장만 삭제할 수 있습니다.")
	}
}
function modifyCheck() {
	
	var sessionU_id = '<%= session.getAttribute("u_id") %>';
	var u_id = '${party.u_id}';
	
	if (sessionU_id === u_id) {
	    window.location='party_modify?p_id=${party.p_id}';
	} else {
	    // 세션의 u_id 값과 JSP 안의 u_id 값이 일치하지 않는 경우
	    alert("파티장만 수정할 수 있습니다.")
	}
}
</script>
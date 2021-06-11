<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(function(){
	
	$('input[name="ques1"]').on('click', function() {
	    //alert(1)
		var valueCheck = $('input[name="ques1"]:checked').val(); // 체크된 Radio 버튼의 값을 가져옵니다.
	   	//alert(valueCheck);
	    $("#test").html(valueCheck);
	});
	
})
</script>
</head>
<body>
<div class="form-check ">
<div>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">질문</th>
      <th scope="col">아니다 또는 거의 그렇지 않다.</th>
      <th scope="col">때때로 그렇다.</th>
      <th scope="col">자주 그렇다.</th>
      <th scope="col">거의 항상 그렇다.</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>나는 의욕이 없고, 우울하고 슬프다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td>나는 하루 중 아침에 가장 기분이 좋다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques2"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques2"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques2"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques2"> </td>
    </tr>
    <tr>
      <td>나는 갑자기 울거나, 울고 싶을 때가 있다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 잠을 잘 못자거나 아침에 일찍 깬다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 평상시와 같이 잘 먹는다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 이성과 이야기하고 함께 있기를 좋아한다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 체중이 준 것 같다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 변비가 있다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">심장이 평상시보다 빨리 뛰거나 두근거린다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 별 이유없이 몸이 나른하고 피곤하다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">내 정신은 이전처럼 맑다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 어떤 일이든지 전처럼 쉽게 처리한다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 안절부절해서 가만히 있을 수가 없다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나의 장래는 희망적이라고 느낀다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 평소보다 짜증이 많아졌다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 매사에 결단력이 있다고 생각한다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 유익하고 필요한 사람이라고 생각한다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 내 삶이 충만하고 의의가 있다고 느낀다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">내가 죽어야 남들이 편할 것 같다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 전과 같이 즐겁게 일한다.</td>
      	<td><input class="form-check-input" type="radio" value="4" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="1" name="ques1"> </td>
    </tr>
    <tr>
      <td id="ques1">나는 평소보다 짜증이 많아졌다.</td>
      	<td><input class="form-check-input" type="radio" value="1" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="2" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="3" name="ques1"> </td>
		<td><input class="form-check-input"  type="radio" value="4" name="ques1"> </td>
    </tr>
    
    
  </tbody>
</table>
<div id="test"></div>
</div>
	

</div>


</body>
</html>
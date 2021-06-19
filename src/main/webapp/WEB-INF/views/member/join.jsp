<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

계정 정보를 입력해주세요!
 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
		<table style="width: 600px">
			<tr>
				<td width="100">ID</td>
				<td><input type="text" name="id" id='id'> 
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" id="password" name="password">
					</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name">
				
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
				<input type="text" id="email" name="email">
				
				</td>
			</tr>
			
			<tr>
				<td>닉네임(가명)</td>
				<td>
					<input type="text"id="alias" name="alias">  			
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text"id="memberAddr" name="memberAddr">  			
				</td>
			</tr>
			<tr>
				<td>Phone</td>
				<td>
					<input type="text"id="phone" name="phone">  			
				</td>
			</tr>
			<tr>
				<td>email</td>
				<td>
					<input type="text"id="email" name="email">  			
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text"id="dateOfBirth" name="dateOfBirth">  			
				</td>
			</tr>
			
			

			<tr>
				<td colspan="2">
				<input type="submit" value="가입"> 
				<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>





</body>
</html>
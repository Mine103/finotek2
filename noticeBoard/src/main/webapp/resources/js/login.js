window.onload = function() {
	document.getElementById("login").onclick = function() {
        var email = document.getElementById("email").value;
        var pass = document.getElementById("pass").value;
        if(email == "") {
            document.getElementById("alert").innerText = "이메일를 입력해주세요.";
            return;
        }
        if(pass == "") {
            document.getElementById("alert").innerText = "비밀번호를 입력해주세요.";
            return;
        }
        document.getElementById("loginform").submit();
        return true;
    };
};
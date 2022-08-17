window.onload = function() {
    document.getElementById("register").onclick = function() {
        var email = document.getElementById("email").value;
        var pass = document.getElementById("pass").value;
        var confirmpass = document.getElementById("confirmpass").value;
        var name = document.getElementById("name").value;
        var alertText = document.getElementById("alert").innerText;
        if(email == "") {
            document.getElementById("alert").innerText = "이메일을 입력해주세요";
            return;
        }
        if(pass == "") {
            document.getElementById("alert").innerText = "비밀번호를 입력해주세요";
            return;
        }
        if(confirmpass == "") {
            document.getElementById("alert").innerText = "비밀번호 확인을 입력해주세요";
            return;
        }
        if(name == "") {
            document.getElementById("alert").innerText = "이름을 입력해주세요";
            return;
        }
        document.getElementById("registerForm").submit();
        return true;
    };
};
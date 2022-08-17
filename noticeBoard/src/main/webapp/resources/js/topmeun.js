window.onload = function() {
    document.getElementById("searchBtn").onclick = function() {
        var serach = document.getElementByName("serach");
        if(serach == "") {
            alert("검색어를 입력해 주세요.");
            return;
        }
        document.getElementById("searchForm").submit();
        return true;
    }
};
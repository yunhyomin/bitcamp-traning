    //(실습)옵션선택 여부에 따라 차량금액 변경처리
    let totalTag; //차량금액 표시할 HTML 태그 객체 저장
    let totalValue = 0; //차량금액 + 옵션금액 저장
    window.onload = function(){
        totalTag = document.getElementById("total");
        totalValue = parseInt(totalTag.value);
    
        // class 속성으로 찾아서 이벤트 연결
        let opts = document.getElementsByClassName("opt");
        for (let opt of opts) {
            //opt.onclick = compute;
            opt.onchange = compute;
        }
    };
    
    function compute() {  
        console.log("this.id : " + this.id);
        let optValue = parseInt(this.value);
        console.log("optValue : " + optValue);
            
        if (this.checked) {
            totalValue += optValue;
        } else {
            totalValue -= optValue;
        }
        //화면에 결과 값 표시
        totalTag.value = totalValue;
    }
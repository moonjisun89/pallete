window.addEventListener('load', ()=>{
    console.log(location.href);
    
    //const param = document.querygetElementsByClassName("btn_layer2").value();

    const param = location.href.substr(-2);
    console.log(param);
    const allBtn = document.getElementById("ALL");
    if(param!=='sp'&& param!=="ll"){
        const btn = document.getElementById(param);
        btn.className="cate_btn on";
    }else{
        allBtn.className="cate_btn on";
    }

})
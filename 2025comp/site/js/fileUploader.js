//파일 업로드 기능 함수
function fileUploaderInit(inputFile){
    let fileList = document.querySelector('.fileUploader__list');
    let files = inputFile.files;

    for(let i = 0; i < files.length; i ++){
        console.log(files[i].name);
        let fileItem = document.createElement('li');
        fileItem.classList.add('fileUploader__item');
        
        fileItem.innerHTML = `
        <div class="file__info">
        <i class="file__icon"></i>
        <span class="file__name">${files[i].name}</span>
        
        </div>
        <button type="button" class="file__delete"></button>
        `
        fileList.appendChild(fileItem);
    }

    // 파일 삭제 버튼 이벤트 설정
    attachDeleteEvent();
}
// 파일 삭제 버튼 이벤트 설정 함수
function attachDeleteEvent(){
    let fileClose = document.querySelectorAll('.file__delete')
    fileClose.forEach(function(btn){
        btn.addEventListener('click', function(e){
            let item = e.target.closest('.fileUploader__item')
            item.remove();
        })
    })
}
document.addEventListener("DOMContentLoaded", function(){
    let inputFile = document.getElementById('input__file')
    
    
    
    inputFile.addEventListener('change', function(e){
        fileUploaderInit(inputFile);
    });

    // 초기 로드 시 필요하면 호출
    // fileUploaderInit();
    attachDeleteEvent(); // 외부에서도 독립적으로 호출 가능
});
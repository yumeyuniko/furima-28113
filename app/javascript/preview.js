if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
document.addEventListener('DOMContentLoaded', function () {
  const ImageList = document.getElementById('img-item');


  document.getElementById('item-image').addEventListener('change', function (e) {
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
      

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
          // 画像を表示するためのdiv要素を生成
          const imageElement = document.createElement('div');
          imageElement.setAttribute('class','preview');
          
          // 表示する画像を生成
          const blobImage = document.createElement("img");
          blobImage.setAttribute("src", blob);
          blobImage.setAttribute('id', `img-size`);
          
        // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    });
  });
}
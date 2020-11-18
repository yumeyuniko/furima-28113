window.addEventListener("load", function () {

  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener('input', function () {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = Math.floor(inputValue / 10);
    addTaxDom.innerHTML = fee;
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = (inputValue - fee );
    
  });
})


 


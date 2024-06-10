function count (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${Math.floor(inputValue / 10).toLocaleString()}`;
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = `${Math.ceil(inputValue - inputValue / 10).toLocaleString()}`;
  }); 
};

window.addEventListener('turbo:load', count);
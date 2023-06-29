window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {

    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    const tax = inputValue * 0.1;
    const profit = inputValue - tax;

    addTaxDom.innerHTML = Math.floor(tax);
    profitDom.innerHTML = Math.floor(profit);

  })
});
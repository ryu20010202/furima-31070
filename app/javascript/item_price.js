function post(){
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    const commission = document.getElementById("add-tax-price");
    const gain = document.getElementById("profit");
    let commission_price = inputValue * 0.1 ;
    let gain_price = inputValue * 0.9 ;
    commission.innerHTML = Math.floor(commission_price);
    gain.innerHTML = Math.floor(gain_price);
  })

}

window.addEventListener('load', post)
import './index.css'

window.onload = () => {
  let elem = document.getElementById('hello');
  console.log(elem.innerText)
  document.body.insertAdjacentHTML('afterbegin', elem)
}

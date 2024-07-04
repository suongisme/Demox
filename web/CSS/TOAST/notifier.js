const successDom = document.getElementById('__success__');
const errorDom = document.getElementById('__error__');
new Toast({
    message: successDom?.textContent ?? errorDom?.textContent,
    type: successDom ? 'success' : 'danger'
});
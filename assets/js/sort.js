const th = document.querySelectorAll('th');
console.log(th);

th.forEach(th => {
    th.addEventListener('click', () => {
        th.classList.toggle('active');
        console.log('clicked');
    });
});
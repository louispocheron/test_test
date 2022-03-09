let searchBar = document.getElementById('search');
let list = document.querySelectorAll('.assoc-li');

searchBar.addEventListener('keyup', (e) => {
    // search bar associations
    let search = e.target.value.toLowerCase();
    list.forEach((li) => {
        let name = li.querySelector('.assoc-name').innerText.toLowerCase();
        if (name.indexOf(search) != -1) {
            li.style.display = 'block';
        } else {
            li.style.display = 'none';
        }
    })
})


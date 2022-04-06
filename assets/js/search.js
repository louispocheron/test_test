let searchBar = document.getElementById('search');
let list = document.querySelectorAll('.assoc-li');

const ajaxAssocContent = document.querySelector('.ajaxAssocContent');

searchBar.addEventListener('keyup', (e) => {
    // search bar associations
    let search = e.target.value.toLowerCase();
    ajax(search);

})


function ajax(filter){
    let queryString = new URLSearchParams();
    queryString.append('search', filter);
    let url = new URL(window.location.href);


    axios.get(url.pathname + "?" + queryString.toString() + "&ajax=1", null)
         .then(data => {
            console.log(data);
            const content = document.querySelector('.ajaxDivContent');
            let dataUser = data.data;
            ajaxAssocContent.innerHTML = dataUser;
        })  
        .catch(err => {
            console.log(err);
        })
}



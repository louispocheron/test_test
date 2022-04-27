const selectYear = document.getElementById('selectYear');
let currentYear = new Date().getFullYear();    
let earliestYear = 1965;     
while (currentYear >= earliestYear) {      
    let dateOption = document.createElement('option');          
    dateOption.text = currentYear;      
    dateOption.value = currentYear;        
    selectYear.add(dateOption);      
    currentYear -= 1;    
}


const trtest = document.querySelectorAll('.trtest'); 
console.log(trtest);


let year = selectYear.options[selectYear.selectedIndex];
selectYear.addEventListener('change', Ajaxyear);

function Ajaxyear(){
    let data = selectYear.options[selectYear.selectedIndex];
    let queryString = new URLSearchParams();
    queryString.append('year', data.value);
    let url = new URL(window.location.href);

    axios.post(url.pathname + "?" + queryString.toString() + "&ajax=1", {
        'year': data.value,
    })
    .then(data => {
        const content = document.querySelector('.trtest');
        let dataUser = data.data.content;
        console.log(data);
        if (dataUser == "") {
            content.innerHTML = `aucune saisie trouvée pour l'année choisie`;
        } else {
        content.innerHTML = dataUser;
        }
    })
    .catch(err => {
        console.log(err);
    })
}






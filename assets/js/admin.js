//NOMBRE D'HEURE ET MINUTES PAR ADHERENT
const duree = document.getElementsByClassName('duree');
const totalDiv = document.getElementsByClassName('total');
const totalP = document.querySelector('.totalP');

    // CALCUL DU TOTAL D'HEURES
    // get data attributes 'data-hihi' from test
    const data = Array.from(duree).map(el => el.dataset.duree);

    window.onload = () => {
    //parse int hours and minutes from data 
    const hours = data.map(el => parseInt(el.split(':')[0]));
    const minutes = data.map(el => parseInt(el.split('h')[1]));
    // sum hours and minutes
    let totalHours = hours.reduce((acc, cur) => acc + cur);
    let totalMinutes = minutes.reduce((acc, cur) => acc + cur);
   
    // as long as minutes are more than 60, add 1 to hours and subtract 60 from minutes
    while (totalMinutes >= 60) {
        totalHours++;
        totalMinutes -= 60;
    }
    // if minutes are less than 10, add 0 before minutes
    if (totalMinutes < 10) {
        totalMinutes = `0${totalMinutes}`;
    }
    // innerhtml of totalP
    totalP.innerHTML = `cet adhérants a saisie ${totalHours}h${totalMinutes} au total`;
    }




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




let salut = selectYear.options[selectYear.selectedIndex];
console.log("salut");

selectYear.addEventListener('change', sendYear);
// console.log(salut.value);

const tableau = document.querySelectorAll('.tableau');
const ligne = document.querySelectorAll('.ligne'); 



function sendYear(){
    let data = selectYear.options[selectYear.selectedIndex];
    let queryString = new URLSearchParams();
    queryString.append('year', data.value);
    let url = new URL(window.location.href);


    axios.post(url.pathname + "?" + queryString.toString() + "&ajax=1", {
        'year': data.value,
        })
        .then(data => {
            const content = document.querySelector('.ajaxDivContent');
            let dataUser = data.data.content;
            console.log(dataUser);
            content.innerHTML = dataUser;

            
      
        })

        .catch(err => {
            console.log(err);
        })
}

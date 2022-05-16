// const { sort } = require("core-js/core/array");import 'flatpickr';
// flatpickr for input with calss flatpickr



// CREATION SELECT YEAR
const selectYear = document.getElementById('selectYear');
let currentYear = new Date().getFullYear();    
let earliestYear = 1965;     
while (currentYear >= earliestYear) {      
    let dateOption = document.createElement('option');          
    dateOption.text = currentYear;      
    dateOption.value = currentYear;
    dateOption.className = 'select-dd';
    selectYear.add(dateOption);      
    currentYear -= 1;    
}

// CREATION SELECT MONTH
const selectMonth = document.getElementById('selectMonth');
const trtest = document.querySelectorAll('.trtest');
const btnSubmit = document.querySelector(".btn-submit")

const months = [
    {value: '01', text: 'Janvier'},
    {value: '02', text: 'Février'},
    {value: '03', text: 'Mars'},
    {value: '04', text: 'Avril'},
    {value: '05', text: 'Mai'},
    {value: '06', text: 'Juin'},
    {value: '07', text: 'Juillet'},
    {value: '08', text: 'Août'},
    {value: '09', text: 'Septembre'},
    {value: '10', text: 'Octobre'},
    {value: '11', text: 'Novembre'},
    {value: '12', text: 'Décembre'}
];

for(let i=0; i<months.length; i++){
    const monthOption = document.createElement('option');
    monthOption.text = months[i].text;
    monthOption.value = months[i].value;
    monthOption.className = 'select-month';
    selectMonth.add(monthOption);
}



let year = selectYear.options[selectYear.selectedIndex];
btnSubmit.addEventListener('click', Ajaxyear);

function Ajaxyear(){
    let data = selectYear.options[selectYear.selectedIndex];
    let month = selectMonth.options[selectMonth.selectedIndex].value;
    let queryString = new URLSearchParams();
    queryString.append('year', data.value);
    queryString.append('month', month);
    let url = new URL(window.location.href);

    axios.post(url.pathname + "?" + queryString.toString() + "&ajax=1", {
        'year': data.value,
        'month': month
    })
    .then(data => {
        console.log(data);
        const content = document.querySelector('.trtest');
        const content2 = document.querySelector('.ajaxDivContent');
        let dataUser = data.data.content;
        if (dataUser == "\n") {
            content2.innerHTML = "<h3 style='color: red'>aucune saisie trouvée pour l'année choisie</h3>";
        } else {
        content.innerHTML = dataUser;
        }
    })
    .catch(err => {
        console.log(err);
    })
}

// console.log('newfun');

// for(let i = 0; i < trtest.length; i++){
//     trtest[i].addEventListener('click', pdfOpen);
// }


// function pdfOpen(){
//     let newHref = trtest.dataset.href
//     window.open(newHref, '_blank');
// }    








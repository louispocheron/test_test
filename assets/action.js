// ON RECUP LES INPUTS

console.log('salut');

let durée = document.querySelector(".duration");
let heureDepart = document.querySelector(".heureDepart");  
let heureArrivee = document.querySelector(".heureArrivee");
let villeDepart = document.querySelector(".villeDepart");



// (async() => {
//     console.log("waiting for variable");
//     while(!window.hasOwnProperty(villeDepart.value)) // define the condition as you like
//         await new Promise(resolve => setTimeout(resolve, 1000));
//     console.log(villeDepart.value);
// })();


const dataHours = document.querySelector('.ligne');
let duree = dataHours.dataset;

console.log(Object.values(duree)[0]);
// get the value of
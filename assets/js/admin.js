
const duree = document.getElementsByClassName('duree');
const totalDiv = document.getElementsByClassName('total');
const totalP = document.querySelector('.totalP');


    console.log('test pc');

    console.log(duree);
    // CALCUL DU TOTAL D'HEURES
    // get data attributes 'data-hihi' from test
    const data = Array.from(duree).map(el => el.dataset.duree);
    // sum all value from data
    window.onload = () => {
    if(data !== undefined){
    const total = data.reduce((acc, val) => acc + parseInt(val), 0);
    totalP.innerHTML = `nombre total d'heures qu'a saisie l'utilisateur : ${total}`;
    }
    else{
        totalP.innerHTML = `l'utilisateur n'a pas encore saisi d'heures`;
    }
    };





// get all data-duree attributes
// for (let i = 0; i < duree.length; i++) {
//     const duree_value = duree[i].getAttribute('data-duree');
//     console.log(duree_value);
// }


export function sumEuros(data){

    // on calcul le total des euros
    let euros = data.map(el => el.split('.')[0]);
    euros = euros.map(el => parseInt(el));
    let totalEuros = euros.reduce((a, b) => a + b);

    // puis le total des centimes

    // check if there is a cent
    let cents = data.map(el => el.split('.')[1]);
    
    // On enleve les valeurs NaN
    cents = cents.filter(el => !isNaN(el));

    cents = cents.map(el => parseInt(el));
    let totalCents = cents.reduce((a, b) => a + b);
    // console.log(totalCents);

    // on ajoute les centimes au total des euros
    if (totalCents > 9){
        totalEuros ++;
        totalCents = totalCents - 10;
    }

    let totalSum = `${totalEuros}.${totalCents}`

    return totalSum;
    
}
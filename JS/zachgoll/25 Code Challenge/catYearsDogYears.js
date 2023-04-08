var humanYearsCatYearsDogYears = function(humanYears) {

  let catYears =  15;
  let dogYears = 15; 
  let arr = [humanYears, catYears, dogYears];
  
  if (humanYears === 1) {
    return arr;
  }
  if (humanYears === 2) {
    arr[1]+=9;
    arr[2]+=9;
    return arr;
  }
  if (humanYears > 2) {
    
    arr[1]+=9;
    arr[2]+=9;
    console.log(arr);
    
    for (i = 0; i < humanYears.length; i++) {
      arr[1]+=4;
      arr[2]+=5;
      
    }
    return arr;
  }
}

#calculate the chance that at `defectRate`, `itemPerBox` items will have `defects` defect
defectRate <- 0.05;
itemsPerBox <- 20;
defects <- 4;

factorial(itemsPerBox) / (factorial(defects) * factorial(itemsPerBox - defects)) *
    (defectRate ** defects) * ((1 - defectRate) ** (itemsPerBox - defects));
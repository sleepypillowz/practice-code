//an object is like a key value pair
const objectVariable = { prop1: 20, prop2: 50 };

objectVariable

//use dot notation to access information
//which can be infinitely nested

objectVariable.prop1

const nestedObject = {
    layer1: {
        layer2: {
            layer3: {
                targetValue: 20
            }
        }
    }
}

nestedObject.layer1.layer2.layer3.targetValue;

objectVariable['prop1'];
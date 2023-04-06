/*
&& and
|| or
! not
*/

20 === 20 && 10 === 10
20 === 20 && 10 === 12
20 === 20 || 10 === 12
!(20 === 20)

const isUserLoggedIn = true;

const doesUserHavePermissions = false;

const canUserPerformAction = isUserLoggedIn && doesUserHavePermissions;

const result = !(((40 / 20) === 2 && true) || ('yes' === 'no'));

const step1 = 40 / 20;
const step2 = step1 === 2;
const step3 = step2 && true;
const step4 = 'yes' === 'no';
const step5 = step3 || step4;
const step6 = !step5;

/* immediately invoked variable */
const result2 = (() => {
    return 20;
})();
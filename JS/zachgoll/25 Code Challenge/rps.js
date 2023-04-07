const rps = (p1, p2) => {

    const choice = ['rock', 'paper', 'scissors'];
    const P1W = 'Player 1 won!';
    const P2W = 'Player 2 won!';

    for (let i = 0; i < choice.length; i++) {
        if (p1 === choice[i]) {
            if (p2 === choice[i]) {
                return 'Draw!';
            }
            else if (p1 === choice[0] && p2 === choice[2]) {
                return P1W;
            }
            else if (p1 === choice[1] && p2 === choice[0]) {
                return P1W;
            }
            else if (p1 === choice[2] && p2 === choice[1]) {
                return P1W;
            }
            else if (p2 === choice[0] && p1 === choice[2]) {
                return P2W;
            }
            else if (p2 === choice[1] && p1 === choice[0]) {
                return P2W;
            }
            else if (p2 === choice[2] && p1 === choice[1]) {
                return P2W;
            }
        }
    }
};
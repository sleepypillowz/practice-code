// Function to create the chessboard
function createChessboard() {
    const chessboard = document.getElementById('chessboard');

    // Add column labels
    for (let col = 0; col < 8; col++) {
        const label = document.createElement('div');
        label.classList.add('label', 'col-label');
        label.textContent = String.fromCharCode(65 + col);
        chessboard.appendChild(label);
    }

    for (let row = 0; row < 8; row++) {
        // Add row label
        const label = document.createElement('div');
        label.classList.add('label', 'row-label');
        label.textContent = 8 - row;
        chessboard.appendChild(label);

        for (let col = 0; col < 8; col++) {
            const square = document.createElement('div');
            square.classList.add('square');

            // Add classes for light and dark squares
            if ((row + col) % 2 === 0) {
                square.classList.add('light');
            } else {
                square.classList.add('dark');
            }

            // Add coordinates as data attributes
            square.dataset.row = row;
            square.dataset.col = col;

            chessboard.appendChild(square);
        }
    }
}

// Function to add chess pieces
function addChessPieces() {
    const chessboard = document.getElementById('chessboard');

    // Define the initial chessboard setup
    const piecesSetup = [
        'r', 'n', 'b', 'q', 'k', 'b', 'n', 'r',
        'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p',
        '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '',
        '', '', '', '', '', '', '', '',
        'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P',
        'R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R',
    ];

    // Loop through the squares and add pieces
    const squares = chessboard.getElementsByClassName('square');
    for (let i = 0; i < squares.length; i++) {
        const piece = document.createElement('div');
        piece.classList.add('piece');
        piece.draggable = true;
        piece.dataset.piece = piecesSetup[i]; // Set the piece type as a data attribute

        // Set the piece type based on the piecesSetup array
        const pieceType = piecesSetup[i];
        if (pieceType) {
            piece.textContent = pieceType;
        }

        squares[i].appendChild(piece);
    }
}

// Function to handle drag start
function handleDragStart(e) {
    // Set the dragged piece's data
    e.dataTransfer.setData('text/plain', e.target.dataset.piece);
}

// Function to handle drag over
function handleDragOver(e) {
    // Prevent the default behavior to allow a drop
    e.preventDefault();
}

// Function to handle drag-and-drop events
function handleDragAndDrop(e) {
    // Prevent the default behavior to allow a drop
    e.preventDefault();

    // Get the dragged piece's data
    const pieceType = e.dataTransfer.getData('text/plain');

    // Find the square where the piece is dropped
    const targetSquare = e.target.closest('.square');

    // Check if the target is a valid square and does not have a piece already
    if (targetSquare && !targetSquare.querySelector('.piece')) {
        // Create a new piece element and append it to the target square
        const piece = document.createElement('div');
        piece.classList.add('piece');
        piece.textContent = pieceType;
        targetSquare.appendChild(piece);
    }
}

// Add an event listener to the chessboard for drag start
document.getElementById('chessboard').addEventListener('dragstart', handleDragStart);

// Add an event listener to the chessboard for drag over
document.getElementById('chessboard').addEventListener('dragover', handleDragOver);

// Add an event listener to the chessboard for drop
document.getElementById('chessboard').addEventListener('drop', handleDragAndDrop);

// Initial setup
createChessboard();
addChessPieces();

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>4-2-3-1 Formation</title>
        <style>
            body {
                margin: 0;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f0f0f0;
                background-image: url('../IMAGE/HOME/Red and Black Sportive Next Match Youtube Thumbnail.png');
                background-size: cover; /* ??m b?o hình n?n bao ph? toàn b? khu v?c ch?i */
                background-position: center;
            }
            #playArea {
                position: relative;
                width: 500px;
                height: 700px;
                border: 1px solid black;
                margin: 0 auto;
                background-image: url('../IMAGE/HOME/Green Sport Highlight covers.png'); /* Replace with the actual URL */
                background-size: cover;
                background-position: center;
                transition: all 0.5s ease-in-out;
                overflow: hidden; /* ?n ph?n n?i dung ra ngoài khu v?c ch?i */
                animation: slideInPlayArea 1s ease forwards; /* Áp d?ng animation */
                opacity: 0; /* ?n playArea ban ??u */
            }
            @keyframes slideInPlayArea {
                0% {
                    opacity: 0;
                    transform: translateY(-100px); /* Di chuy?n t? trên xu?ng */
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .player p
            {
                position: absolute;
                bottom: -30px;
            }
            .player.selected {
                display: block;
            }
            .player-list {
                margin: 20px;
            }
            .player-list label {
                display: block;
                margin-bottom: 5px;
            }
            .player {
                position: absolute;
                width: 50px; /* ?? r?ng c?a c?u th? */
                height: 50px; /* ?? cao c?a c?u th? */
                background-color: #3498db; /* Màu n?n */
                border-radius: 50%; /* ?? t?o hình tròn */
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.5s ease; /* ?? tr? khi di chuy?n */
                transform: translateX(-100%); /* ??y ra ngoài phía bên trái */
                opacity: 0; /* ?n ?i ban ??u */
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
            }

            /* Hi?u ?ng khi di chu?t qua c?u th? */
            .player:hover {
                background-color: #2980b9;
            }

            /* Hi?u ?ng di chuy?n vào v? trí ban ??u */
            

            /* Áp d?ng hi?u ?ng cho các c?u th? */
            .player:nth-child(odd) {
                animation: slideIn 0.5s ease forwards;
            }
.player:nth-child(even) {
                animation: slideIn 0.5s ease forwards;
                animation-delay: 0.1s; /* Delay cho các c?u th? ch?n ?? t?o hi?u ?ng ??ng th?i */
            }
            
            @keyframes slideIn {
                0% {
                    transform: translateX(-100%);
                    opacity: 0;
                }
                100% {
                    transform: translateX(0);
                    opacity: 1;
                }
            }
            /* ??nh d?ng cho player-list */
            .player-list {
                margin-bottom: 10px;
            }

            /* ??nh d?ng cho checkbox */
            .player-list input[type="checkbox"] {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        
        <div>
            <select id="formationSelect">
                <option value="4-1-1-3-1">4-1-1-3-1</option>
                <option value="4-3-3">4-3-3</option>
                <option value="3-1-3-2-1">3-1-3-2-1</option>
                <!-- Thêm các tùy ch?n khác t?i ?ây -->
            </select>
        </div>
        <div class="player-list">
            <label><input type="checkbox" id="check1" data-player="player1"> Ronaldo - GK</label>
            <label><input type="checkbox" id="check2" data-player="player2"> James - RB</label>
            <label><input type="checkbox" id="check3" data-player="player3"> Ramos - LCB</label>
            <label><input type="checkbox" id="check4" data-player="player4"> Pepe - RCB</label>
            <label><input type="checkbox" id="check5" data-player="player5"> Marcelo - LB</label>
            <label><input type="checkbox" id="check6" data-player="player6"> Kiera - CDM</label>
            <label><input type="checkbox" id="check7" data-player="player7"> Kaka - CAM</label>
            <label><input type="checkbox" id="check8" data-player="player8"> H. Son - RM</label>
            <label><input type="checkbox" id="check9" data-player="player9"> Messi - LM</label>
            <label><input type="checkbox" id="check10" data-player="player10"> Pirlo - CM</label>
            <label><input type="checkbox" id="check11" data-player="player11"> Balloteli - ST</label>
            <label><input type="checkbox" id="check12" data-player="player12"> Torres - ST</label>
            <label><input type="checkbox" id="check13" data-player="player13"> Tien Linh - ST</label>
            <label><input type="checkbox" id="check14" data-player="player14"> Ronaldinho - CAM</label>
        </div>

    <div id="playArea">
        <!-- T?o 11 c?u th? -->
        <div class="player" id="player1" data-position="GK" style="background-image: url('../IMAGE/PLAYER/p4.jpg');"><p>Ronaldo</p></div>
        <div class="player" id="player2" data-position="RB" style="background-image: url('../IMAGE/PLAYER/p5.jpg');"><p>james</p></div>
        <div class="player" id="player3" data-position="LCB" style="background-image: url('../IMAGE/PLAYER/p4.jpg');"><p>Ramos</p></div>
        <div class="player" id="player4" data-position="RCB" style="background-image: url('../IMAGE/PLAYER/p5.jpg');"><p>Pepe</p></div>
        <div class="player" id="player5" data-position="LB" style="background-image: url('../IMAGE/PLAYER/p4.jpg');"><p>marcelo</p></div>
        <div class="player" id="player6" data-position="CDM" style="background-image: url('../IMAGE/PLAYER/p5.jpg');"><p>Kiera</p></div>
        <div class="player" id="player7" data-position="CAM" style="background-image: url('../IMAGE/PLAYER/p4.jpg');"><p>Kaka</p></div>
        <div class="player" id="player8" data-position="RM" style="background-image: url('../IMAGE/PLAYER/p5.jpg');"><p>H.son</p></div>
        <div class="player" id="player9" data-position="LM" style="background-image: url('../IMAGE/PLAYER/p5.jpg');"><p>Messi</p></div>
        <div class="player" id="player10" data-position="CM" style="background-image: url('../IMAGE/PLAYER/p4.jpg');"><p>Pirlo</p></div>
        <div class="player" id="player11" data-position="ST" style="background-image: url('../IMAGE/PLAYER/p3.jpg');"><p>Balloteli</p></div>
        <div class="player" id="player12" data-position="ST" style="background-image: url('../IMAGE/PLAYER/p5.jpg');"><p>Torres</p></div>
        <div class="player" id="player13" data-position="ST" style="background-image: url('../IMAGE/PLAYER/p4.jpg');"><p>Tien linh</p></div>
        <div class="player" id="player14" data-position="CAM" style="background-image: url('../IMAGE/PLAYER/p5.jpg');"><p>Ronaldinho</p></div>


    </div>

    <script>
        



        document.addEventListener('DOMContentLoaded', (event) => {
            const playArea = document.getElementById('playArea');
            const playerCheckboxes = document.querySelectorAll('.player-list input[type="checkbox"]');
            const players = document.querySelectorAll('.player');

            var count = 0;



            const playerPositions = {
                'GK': {top: '10%', left: '45%'},
                'LCB': {top: '20%', left: '25%'},
                'CB': {top: '20%', left: '45%'},
                'RCB': {top: '20%', left: '65%'},
                'LB': {top: '30%', left: '10%'},
                'RB': {top: '30%', left: '85%'},
                'CDM': {top: '35%', left: '45%'},
                'LCM': {top: '50%', left: '25%'},
                'RCM': {top: '50%', left: '65%'},
                'CM': {top: '50%', left: '45%'},
                'LM': {top: '70%', left: '25%'},
                'RM': {top: '70%', left: '65%'},
                'CAM': {top: '70%', left: '45%'},
                'ST': {top: '85%', left: '45%'},
                'CF': {top: '80%', left: '45%'},
                'LW': {top: '80%', left: '5%'},
                'RW': {top: '80%', left: '85%'}

            };

            const formations = {
                '4-1-1-3-1': {
                    'GK': 'player1',
                    'RB': 'player2',
                    'LCB': 'player3',
                    'RCB': 'player4',
                    'LB': 'player5',
                    'CDM': 'player6',
                    'LM': 'player7',
                    'RM': 'player8',
                    'CAM': 'player9',
                    'CM': 'player10',
                    'ST': 'player11'
                },
                '4-3-3': {
                    'GK': 'player1',
                    'RCB': 'player2',
                    'LCB': 'player3',
                    'LB': 'player4',
                    'RB': 'player5',
                    'RCM': 'player6',
                    'CM': 'player7',
                    'LCM': 'player8',
                    'RW': 'player9',
                    'LW': 'player10',
                    'ST': 'player11'
                },
                '3-1-3-2-1': {
                    'GK': 'player1',
                    'RCB': 'player2',
                    'CB': 'player3',
                    'LCB': 'player4',
                    'CDM': 'player5',
                    'RCM': 'player6',
                    'CM': 'player7',
                    'LCM': 'player8',
                    'RW': 'player9',
                    'LW': 'player10',
                    'ST': 'player11'
                }
            };

            // ?n t?t c? các c?u th? ban ??u
            players.forEach(player => {
                player.style.display = 'none';
            });

            let selectedPlayers = JSON.parse(localStorage.getItem('selectedPlayers')) || [];

            // Hi?n th? l?i c?u th? ?ã ch?n
selectedPlayers.forEach(player => {
                console.log("count" + count);
                const playerCheckbox = document.querySelector('input[type="checkbox"][data-player="' + player.id + '"]');
                if (playerCheckbox) {
                    playerCheckbox.checked = true;
                    const playerIndex = Array.from(players).findIndex(p => p.id === player.id);
                    if (playerIndex !== -1) {
                        players[playerIndex].style.display = 'flex';
                        const position = playerPositions[player.position];
                        if (position) {
                            players[playerIndex].style.top = position.top;
                            players[playerIndex].style.left = position.left;
                        }
                        count++;
                    }
                }
            });
            // L?ng nghe s? ki?n khi checkbox thay ??i
            playerCheckboxes.forEach((checkbox, index) => {

                checkbox.addEventListener('change', () => {
                    const playerId = players[index].id;
                    const playerPosition = players[index].dataset.position;
                    if (checkbox.checked && count < 11) {
                        players[index].style.display = 'flex';
                        count++;
                        // L?u thông tin c?a c?u th? ???c ch?n vào localStorage
                        selectedPlayers.push({id: playerId, position: playerPosition});
                        localStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
                        // N?u c?u th? này có v? trí ???c ??nh ngh?a, ??t nó vào v? trí t??ng ?ng
                        const position = playerPositions[playerPosition];
                        if (position) {
                            players[index].style.top = position.top;
                            players[index].style.left = position.left;
                        }
                    } else if (!checkbox.checked) {
                        players[index].style.display = 'none';
                        count--;
                        // Xóa c?u th? kh?i m?ng n?u checkbox không ???c ch?n
                        const selectedIndex = selectedPlayers.findIndex(player => player.id === playerId);
                        if (selectedIndex !== -1) {
                            selectedPlayers.splice(selectedIndex, 1);
                            localStorage.setItem('selectedPlayers', JSON.stringify(selectedPlayers));
                        }
                    } else {
                        // Không cho phép ch?n thêm n?u ?ã ??t ??n s? l??ng t?i ?a
                        checkbox.checked = false;
                        alert("Full player");
                    }
                    console.log("count" + count);
                });
            });
            let isDragging = false;
            let currentObject = null;
// L?u c?u th? vào currentObject 
            document.querySelectorAll('.player').forEach(player => {
                player.addEventListener('mousedown', function (event) {
                    isDragging = true;
                    currentObject = player;
                    players.forEach(p => {
                        p.style.transition = 'none';
                    });
                    event.preventDefault(); // Ng?n ch?n hành vi m?c ??nh (ví d?: kéo v?n b?n)
                });
            });

            // Di chuy?n currentObject theo con tr? chu?t
            document.addEventListener('mousemove', function (event) {
                if (isDragging && currentObject) {
                    const rect = playArea.getBoundingClientRect();

                    const x = event.clientX - rect.left - (currentObject.offsetWidth / 2);
                    const y = event.clientY - rect.top - (currentObject.offsetHeight / 2);

                    // ??m b?o v?t th? không b? di chuy?n ra kh?i khu v?c ch?i
                    const maxX = playArea.clientWidth - currentObject.clientWidth;
                    const maxY = playArea.clientHeight - currentObject.clientHeight;
                    currentObject.style.left = Math.max(0, Math.min(x, maxX)) + 'px';
                    currentObject.style.top = Math.max(0, Math.min(y, maxY)) + 'px';
                }
            });

            document.addEventListener('mouseup', function () {
                isDragging = false;
                currentObject = null;
                players.forEach(p => {
                    p.style.transition = 'all 0.5s ease';
                });

            });

            document.querySelectorAll('.player').forEach(player => {
                player.addEventListener('mouseover', function () {
                    player.style.backgroundColor = 'red';
                });

                player.addEventListener('mouseout', function () {
                    player.style.backgroundColor = '#3498db';
                });
            });
            function displayFormation(formation) {
                players.forEach(player => {
                    player.style.display = 'none';
                    const playerCheckbox = document.querySelector('input[type="checkbox"][data-player="' + player.id + '"]');
                    playerCheckbox.checked = false;
                });
                count = 0;

                const selectedFormation = formations[formation];
                if (selectedFormation) {
                    Object.entries(selectedFormation).forEach(([position, playerId]) => {
                        const playerIndex = Array.from(players).findIndex(p => p.id === playerId);
                        if (playerIndex !== -1) {
                            const playerCheckbox = document.querySelector('input[type="checkbox"][data-player="' + players[playerIndex].id + '"]');
                            playerCheckbox.checked = true;
players[playerIndex].style.display = 'flex';
                            const positionInfo = playerPositions[position];
                            if (positionInfo) {
                                players[playerIndex].style.top = positionInfo.top;
                                players[playerIndex].style.left = positionInfo.left;
                            }
                            count++;
                    }
                    });
                }
            }
            formationSelect.addEventListener('change', function () {
                const selectedFormation = this.value;
                displayFormation(selectedFormation);
            });

            window.addEventListener('load', function () {
                const selectedFormation = formationSelect.value;
                displayFormation(selectedFormation);
            });
        });


    </script>
</body>
</html>

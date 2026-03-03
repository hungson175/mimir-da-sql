'use client';

import { useState, useCallback } from 'react';

type Player = 'X' | 'O' | null;
type Board = Player[][];

const BOARD_SIZE = 15;
const WIN_COUNT = 5;

export default function CaroGame() {
  const [board, setBoard] = useState<Board>(() =>
    Array(BOARD_SIZE).fill(null).map(() => Array(BOARD_SIZE).fill(null))
  );
  const [currentPlayer, setCurrentPlayer] = useState<'X' | 'O'>('X');
  const [winner, setWinner] = useState<Player>(null);
  const [winningCells, setWinningCells] = useState<[number, number][]>([]);

  const checkWinner = useCallback((board: Board, row: number, col: number, player: Player): [number, number][] | null => {
    const directions = [
      [0, 1],   // horizontal
      [1, 0],   // vertical
      [1, 1],   // diagonal \
      [1, -1],  // diagonal /
    ];

    for (const [dr, dc] of directions) {
      const cells: [number, number][] = [[row, col]];

      // Check positive direction
      for (let i = 1; i < WIN_COUNT; i++) {
        const r = row + dr * i;
        const c = col + dc * i;
        if (r >= 0 && r < BOARD_SIZE && c >= 0 && c < BOARD_SIZE && board[r][c] === player) {
          cells.push([r, c]);
        } else {
          break;
        }
      }

      // Check negative direction
      for (let i = 1; i < WIN_COUNT; i++) {
        const r = row - dr * i;
        const c = col - dc * i;
        if (r >= 0 && r < BOARD_SIZE && c >= 0 && c < BOARD_SIZE && board[r][c] === player) {
          cells.push([r, c]);
        } else {
          break;
        }
      }

      if (cells.length >= WIN_COUNT) {
        return cells;
      }
    }

    return null;
  }, []);

  const handleCellClick = useCallback((row: number, col: number) => {
    if (board[row][col] || winner) return;

    const newBoard = board.map(r => [...r]);
    newBoard[row][col] = currentPlayer;
    setBoard(newBoard);

    const winningCellsFound = checkWinner(newBoard, row, col, currentPlayer);
    if (winningCellsFound) {
      setWinner(currentPlayer);
      setWinningCells(winningCellsFound);
    } else {
      setCurrentPlayer(currentPlayer === 'X' ? 'O' : 'X');
    }
  }, [board, currentPlayer, winner, checkWinner]);

  const resetGame = useCallback(() => {
    setBoard(Array(BOARD_SIZE).fill(null).map(() => Array(BOARD_SIZE).fill(null)));
    setCurrentPlayer('X');
    setWinner(null);
    setWinningCells([]);
  }, []);

  const isWinningCell = (row: number, col: number) => {
    return winningCells.some(([r, c]) => r === row && c === col);
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen p-4">
      <h1 className="text-4xl font-bold text-white mb-6 drop-shadow-lg">
        Cờ Caro (5 in a Row)
      </h1>

      <div className="bg-white/10 backdrop-blur-md rounded-2xl p-6 shadow-2xl">
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-4">
            <div className={`px-4 py-2 rounded-lg font-semibold transition-all ${
              currentPlayer === 'X' && !winner
                ? 'bg-blue-500 text-white shadow-lg scale-105'
                : 'bg-gray-200 text-gray-600'
            }`}>
              Ngườ chơi X
            </div>
            <div className={`px-4 py-2 rounded-lg font-semibold transition-all ${
              currentPlayer === 'O' && !winner
                ? 'bg-red-500 text-white shadow-lg scale-105'
                : 'bg-gray-200 text-gray-600'
            }`}>
              Ngườ chơi O
            </div>
          </div>

          {winner && (
            <div className={`px-6 py-2 rounded-lg font-bold text-xl animate-bounce ${
              winner === 'X' ? 'bg-blue-500' : 'bg-red-500'
            } text-white`}>
              {winner === 'X' ? 'X' : 'O'} Chiến thắng!
            </div>
          )}
        </div>

        <div
          className="grid gap-0.5 bg-board-line p-2 rounded-lg"
          style={{
            gridTemplateColumns: `repeat(${BOARD_SIZE}, minmax(0, 1fr))`,
          }}
        >
          {board.map((row, rowIndex) =>
            row.map((cell, colIndex) => (
              <button
                key={`${rowIndex}-${colIndex}`}
                onClick={() => handleCellClick(rowIndex, colIndex)}
                className={`
                  w-8 h-8 sm:w-10 sm:h-10 bg-board flex items-center justify-center
                  text-lg sm:text-2xl font-bold transition-all duration-200
                  hover:bg-yellow-200 active:scale-95
                  ${isWinningCell(rowIndex, colIndex) ? 'bg-yellow-400 animate-pulse' : ''}
                  ${cell === 'X' ? 'text-blue-600' : 'text-red-600'}
                `}
              >
                {cell}
              </button>
            ))
          )}
        </div>

        <button
          onClick={resetGame}
          className="w-full mt-4 py-3 bg-gradient-to-r from-green-500 to-emerald-600
                     text-white font-bold rounded-lg shadow-lg
                     hover:from-green-600 hover:to-emerald-700
                     active:scale-95 transition-all duration-200"
        >
          Chơi lại
        </button>
      </div>

      <div className="mt-6 text-white/80 text-sm">
        <p>Luật chơi: 5 quân liên tiếp theo hàng ngang, dọc hoặc chéo để chiến thắng</p>
      </div>
    </div>
  );
}

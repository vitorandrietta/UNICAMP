from random import randint
import copy

"""
 Class that defines a basic board
"""

# a list containing all the wall coordinates
WALLS = [(y, 20) for y in range(59, 20, -1)] + [(y, 40) for y in range(0, 41)]

DIM = 60
VISITED = 2
WALL = 1
GOAL = 3
EMPTY_SPACE = 0
BOARD_MATRIX = None


#global function to generate one square board to be used between all methods, if randomWalls = false, then the board
#that was proposed in the project guide will be used
def generate_square_board(dimension=DIM, random_walls=False, walls_density=0.3, walls=WALLS):
    global BOARD_MATRIX
    BOARD_MATRIX = [[EMPTY_SPACE for _ in range(0, dimension)] for _ in range(0, dimension)]
    if not random_walls:
        for coord in walls:
            BOARD_MATRIX[coord[0]][coord[1]] = WALL
    else:
        _generate_random_walls(walls_density, dimension, BOARD_MATRIX)

#generate walls in the board in random points, based on the density provided
def _generate_random_walls(wall_density, board_dim, board):
    pass
    for _ in range(0, int(pow(board_dim, 2) * wall_density)):
        i = randint(0, board_dim - 1)
        j = randint(0, board_dim - 1)
        board[i][j] = WALL


"""
    defines a simple square board, 
    1 = wall
    0 = haven't visited yet
    2 = already visited
"""

# a simple board structure
class Board:
    def __init__(self):
        self.dim = DIM
        self.board = copy.deepcopy(BOARD_MATRIX)

    def is_wall(self, pos):
        return self.board[pos[0]][pos[1]] == WALL

    # check if the agent was in this coordinate
    def was_here_check(self, coor):
        return self.board[coor[0]][coor[1]] == VISITED

    # store the information that the agent was in this coordinate
    def was_here(self, coor):
        self.board[coor[0]][coor[1]] = VISITED

from search import Problem

"""
    the state and go are defined as a coordinate in tuple (x,y)
"""


class Labyrinth(Problem):
    #repeat coord is a boolean responsable for informing if the agent is allowed to Go
    #back in a position He already visited.
    def __init__(self, initial, goal, repeat_coord, board):
        self.board = board
        self.n_steps = []
        Problem.__init__(self, initial, goal)
        self.repeat_coord = repeat_coord

    def actions(self, state):

        #all predefined movements available
        left_pos = (state[0] - 1, state[1])
        right_pos = (state[0] + 1, state[1])
        up_pos = (state[0], state[1] + 1)
        down_pos = (state[0], state[1] - 1)

        possible_actions = [left_pos, right_pos, up_pos, down_pos]

        #check if the action won't go through the boundaries of the board or a wall, and if it's a coordinate where
        #the agent already visited
        if left_pos[0] == -1 or self.board.is_wall(left_pos) or (self.board.was_here_check(left_pos) and not self.repeat_coord):
            possible_actions.remove(left_pos)

        if right_pos[0] == self.board.dim or self.board.is_wall(right_pos) or (self.board.was_here_check(right_pos) and not self.repeat_coord):
            possible_actions.remove(right_pos)

        if down_pos[1] == -1 or self.board.is_wall(down_pos) or (self.board.was_here_check(down_pos) and not self.repeat_coord):
            possible_actions.remove(down_pos)

        if up_pos[1] == self.board.dim or self.board.is_wall(up_pos) or (self.board.was_here_check(up_pos) and not self.repeat_coord):
            possible_actions.remove(up_pos)

        return possible_actions

    def result(self, state, action):
        # update the board
        self.board.was_here(action)
        self.n_steps.append(action)
        return action

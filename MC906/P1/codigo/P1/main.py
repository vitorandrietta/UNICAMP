from base_state import Board, generate_square_board
from labyrinth_problem import Labyrinth
from search import astar_search, breadth_first_tree_search, depth_first_tree_search
from numpy import linalg, array
import matplotlib.pyplot as plt
import pandas as pd
from mpl_toolkits.mplot3d import Axes3D
from random import randint
import time

# start and end points
GOAL = None
START = None




# euclidian distance heuristic
def h1(n):
    a = array(GOAL)
    b = array(n.state)
    return linalg.norm(a - b)

# the square of the euclidian distance heuristic
def h2(n):
    return pow(h1(n), 2)


# plot the track taken by the agent
def plotMatrix(matrix, name):
    matrix[GOAL[0]][GOAL[1]] = 3
    matrix[START[0]][START[1]] = 4
    ar = array(matrix)
    plt.grid(True)
    plt.matshow(ar)
    plt.savefig("plots/{}.png".format(name))

#plot 3d graph
def plot3DGprah(lst, name):
    x, y, z = zip(*lst)
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    ax.scatter(x, y, z, c='r', marker='o')
    ax.set_xlabel('nós visitados')
    ax.set_ylabel('densidade de parede')
    ax.set_zlabel('tempo parar solução (s)')
    ax.set_title(name)
    plt.show()

#plot table
def plot_table(data, c_names, title):
    fig, ax = plt.subplots()

    fig.patch.set_visible(False)
    ax.axis('off')
    ax.axis('tight')

    df = pd.DataFrame(array(data),columns=c_names)

    ax.table(cellText=df.values,colLabels=df.columns,loc='center')

    fig.tight_layout()
    plt.title(title)
    plt.show()


if __name__ == "__main__":
    BFS_plot = []
    DFS_plot = []
    A_st1_plot = []
    A_st2_plot = []

    for d in range(1, 5):
        for _ in range(0, 400):
            GOAL = (randint(0, 59), randint(0, 59))
            START = (randint(0, 59), randint(0, 59))
            euclidian_distance = linalg.norm(array(GOAL) - array(START))
            generate_square_board(60, True, d / 10)
            lab_problem = Labyrinth(START, GOAL, False, Board())
            start = time.time()
            breadth_first_tree_search(lab_problem)
            end = time.time()
            interval1 = end - start
            nn1 = len(lab_problem.n_steps)
            BFS_plot.append((nn1, d / 10, interval1))
            lab_problem = Labyrinth(START, GOAL, False, Board())
            start = time.time()
            depth_first_tree_search(lab_problem)
            end = time.time()
            interval2 = end - start
            nn2 = len(lab_problem.n_steps)
            DFS_plot.append((nn2, d / 10, interval2))
            lab_problem = Labyrinth(START, GOAL, False, Board())
            start = time.time()
            astar_search(lab_problem, h1)
            end = time.time()
            interval3 = end - start
            nn3 = len(lab_problem.n_steps)
            A_st1_plot.append((nn3, d / 10, interval3))
            lab_problem = Labyrinth(START, GOAL, False, Board())
            start = time.time()
            astar_search(lab_problem, h2)
            end = time.time()
            interval4 = end - start
            nn4 = len(lab_problem.n_steps)
            A_st2_plot.append((nn4, d / 10, interval4))


    #code to sort table data according to euclidian distance between start and end point ( in reversal order)
    # inner_sort = lambda tup: tup[3]
    # DFS_plot.sort(key=inner_sort, reverse=True)
    # BFS_plot.sort(key=inner_sort,reverse=True)
    # A_st1_plot.sort(key=inner_sort,reverse=True)
    # A_st2_plot.sort(key=inner_sort,reverse=True)


    #code to plot tables
    # columns = ("nodes visited", "wall density","time to reach goal (s)", "euclidian distance to goal")
    # plot_table(DFS_plot,columns,"DFS")
    # plot_table(BFS_plot, columns, "BFS")
    # plot_table(A_st1_plot,columns,"A* heuristica 1")
    # plot_table(A_st2_plot, columns, "A* heuristica 2")

    #code to plot 3D graphs
    plot3DGprah(DFS_plot, "DFS")
    plot3DGprah(BFS_plot, "BFS")
    plot3DGprah(A_st1_plot, "A* Heurística 1")
    plot3DGprah(A_st2_plot, "A* Heurística 2")

    # graph parameters (wall density, visited nodes, time)

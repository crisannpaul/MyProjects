# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""
 
import random
import pacman
import util


class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """


    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """


    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s, s, w, s, w, w, s, w]

#Node(state, actions, parent, cost)
class Node:
    def __init__(self, state, action, parent, cost=0):
        self.state = state
        self.action = action
        self.parent = parent
        self.cost = cost

    def getParent(self):
        return self.parent

    def getCost(self):
        return self.cost

    def getState(self):
        return self.state

    def getAction(self):
       return self.action

    def __str__(self):
        return f"{self.state} - {self.action}"

    #tryed to do it recursively
    def recActions(self, parent):
        if self.parent == None:
            return []
        else:
            #print(self.actions)
            return [self.state] + self.recActions(self.parent)

#return the path from the start to the goal
def getPath(node):
    path = []
    while node.getParent() != None:
        path.append(node.getAction())
        node = node.getParent()
    path.reverse()
    return path

#optimized, efficient
def depthFirstSearch(problem: SearchProblem):
    """Search the deepest nodes in the search tree first."""

    frontier = util.Stack()

    exploredNodes = []

    #define start node
    startState = problem.getStartState()
    currentNode = Node(startState, None, None)
    
    frontier.push(currentNode)
    
    while not frontier.isEmpty():
        #begin exploring last (most-recently-pushed) node on frontier
        currentState = currentNode.getState()

        if currentState not in exploredNodes:
            #mark current node as explored
            exploredNodes.append(currentState)

            if problem.isGoalState(currentState):
                return getPath(currentNode)
            else:
                #get list of possible successor nodes in 
                #form (successor, action, stepCost)
                successors = problem.getSuccessors(currentState)
                
                #push each successor to frontier
                for succState, succAction, succCost in successors:
                    if succState not in exploredNodes:
                        newNode = Node(succState, succAction, currentNode)
                        frontier.push(newNode)

        currentNode = frontier.pop()

    return getPath(currentNode)
def breadthFirstSearch(problem: SearchProblem):
    """Search the shallowest nodes in the search tree first."""

    frontier = util.Queue()
    
    exploredNodes = []
    
    startState = problem.getStartState()
    currentNode = Node(startState, None, None, 0) #(state, action, parent, cost)
    frontier.push(currentNode)
    
    while not frontier.isEmpty():
        #begin exploring first (earliest-pushed) node on frontier
        currentNode = frontier.pop()
        currentState = currentNode.getState()

        if currentState not in exploredNodes:
            #put popped node state into explored list
            exploredNodes.append(currentState)

            if problem.isGoalState(currentState):
                return getPath(currentNode)
            else:
                #list of (successor, action, stepCost)
                successors = problem.getSuccessors(currentState)
                
                for succState, succAction, succCost in successors:
                    if succState not in exploredNodes:
                        newCost = currentNode.getCost() + succCost
                        newNode = Node(succState, succAction, currentNode, newCost)

                        frontier.push(newNode)

    return getPath(currentNode)
def uniformCostSearch(problem: SearchProblem):
    """Search the node of least total cost first."""

    #FIFO: holds (item, cost)
    frontier = util.PriorityQueue()

    #previously expanded nodes, holds state:cost
    exploredNodes = {}
    
    startState = problem.getStartState()
    currentNode = Node(startState, None, None, 0) #(state, action, parent, cost)
    
    frontier.push(currentNode, 0)
    
    while not frontier.isEmpty():
        #begin exploring first (lowest-cost) node on frontier
        currentNode = frontier.pop()
        currentState = currentNode.getState()

        if (currentState not in exploredNodes) or (currentNode.getCost() < exploredNodes[currentState]):
            #put popped node's state into explored list
            exploredNodes[currentState] = currentNode.getCost()

            if problem.isGoalState(currentState):
                return getPath(currentNode)
            else:
                #list of (successor, action, stepCost)
                successors = problem.getSuccessors(currentState)
                
                for succState, succAction, succCost in successors:
                    newCost = currentNode.getCost() + succCost
                    newNode = Node(succState, succAction, currentNode, newCost)

                    frontier.update(newNode, newCost)

    return getPath(currentNode)
def aStarSearch(problem: SearchProblem, heuristic=nullHeuristic):
    """Search the node of least total cost first."""

    frontier = util.PriorityQueue()

    #previously expanded nodes, holds state:cost
    exploredNodes = []
    
    startState = problem.getStartState()
    currentNode = Node(startState, None, None, 0) #(state, action, parent, cost)
    
    frontier.push(currentNode, 0)
    
    while not frontier.isEmpty():

        #begin exploring first (lowest-cost) node on frontier
        currentNode = frontier.pop()
        currentState = currentNode.getState()
        exploredNodes.append((currentState, currentNode.getCost()))

        if problem.isGoalState(currentState):
            return getPath(currentNode)
        else:
            #list of (successor, action, stepCost)
            successors = problem.getSuccessors(currentState)

            for succState, succAction, succCost in successors:
                newCost = currentNode.getCost() + succCost
                newNode = Node(succState, succAction, currentNode, newCost)

                #check if this successor has been explored
                already_explored = False
                for explored in exploredNodes:
                    #examine each explored node tuple
                    exploredState, exploredCost = explored

                    if (succState == exploredState) and (newCost >= exploredCost):
                        already_explored = True

                #if this successor not explored, put on frontier and explored list
                if not already_explored:
                    frontier.push(newNode, newCost + heuristic(succState, problem))
                    exploredNodes.append((succState, newCost))

    return getPath(currentNode)

# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch

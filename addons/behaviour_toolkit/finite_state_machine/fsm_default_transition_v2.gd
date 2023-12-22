@tool
@icon("../icons/FSMDefaultTransition.svg")
## Use this class as child of the [FiniteStateMachine] class.
## This transition will be called as a default transition that can happen anytime.
## When this transition triggers it will interrupt any active state and go to its own defined state
class_name FsmDefaultTransitionV2 extends FsmTransitionV2
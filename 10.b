global facts
global is_changed
is_changed = True
facts = [["vertebrate", "duck"], ["flying", "duck"], ["mammal",
"cat"]]

def assert_fact(fact):
global facts
global is_changed
if fact not in facts:
facts.append(fact)
is_changed = True

def backward_chain(goal):
global facts
global is_changed
while is_changed:
is_changed = False
if goal in [fact[0] for fact in facts]:

return True
for A1 in facts:
if goal == "vertebrate" and A1[0] == "mammal":
assert_fact(["vertebrate", A1[1]])
if goal == "animal" and A1[0] == "vertebrate":
assert_fact(["animal", A1[1]])
if goal == "bird" and A1[0] == "vertebrate" and
["flying", A1[1]] in facts:
assert_fact(["bird", A1[1]])

return False

# Prompt the user for input
goal = input("Enter the goal: ")

try:
result = backward_chain(goal)
if result:
print(f"The goal '{goal}' can be satisfied.")
else:
print(f"The goal '{goal}' cannot be satisfied.")
except BackwardChainingError as e:
print("Backward chaining failed:", e)
print("Supported facts for the goal are:")
print(facts)

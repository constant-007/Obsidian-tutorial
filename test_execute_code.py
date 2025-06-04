# -*- coding: utf-8 -*-
# Test file for Execute Code plugin examples

print("Testing Execute Code examples...")
print("=" * 40)

# Test basic Python example
print("\n1. Basic Python Example:")
print("Python Code Execution Demo")
print("=" * 30)

result = 2 ** 10
print(f"2^10 = {result}")

numbers = [1, 2, 3, 4, 5]
squared = [x**2 for x in numbers]
print(f"Squared list: {squared}")

text = "Hello Obsidian!"
print(f"Reversed: {text[::-1]}")

# Test data analysis
print("\n2. Data Analysis Example:")
learning_data = {
    "Obsidian": {"hours": 25, "difficulty": 7, "progress": 85},
    "Python": {"hours": 40, "difficulty": 8, "progress": 70},
    "JavaScript": {"hours": 30, "difficulty": 6, "progress": 65},
    "DataAnalysis": {"hours": 20, "difficulty": 9, "progress": 45}
}

print("Learning Progress Analysis")
print("=" * 40)

total_hours = sum(data["hours"] for data in learning_data.values())
print(f"Total hours: {total_hours}")

hardest_subject = max(learning_data.items(), key=lambda x: x[1]["difficulty"])
print(f"Hardest: {hardest_subject[0]} (difficulty: {hardest_subject[1]['difficulty']}/10)")

avg_progress = sum(data["progress"] for data in learning_data.values()) / len(learning_data)
print(f"Average progress: {avg_progress:.1f}%")

print("\nAll tests completed successfully!") 
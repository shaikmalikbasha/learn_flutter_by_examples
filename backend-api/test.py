import httpx
import random

API_URL = "http://localhost:8000/employees"

first_names = [
    "Aarav",
    "Vihaan",
    "Aditya",
    "Arjun",
    "Rohan",
    "Karan",
    "Rahul",
    "Suresh",
    "Vikram",
    "Manish",
    "Pranav",
    "Kiran",
    "Deepak",
    "Sandeep",
    "Nikhil",
    "Anil",
]

last_names = [
    "Reddy",
    "Sharma",
    "Verma",
    "Patel",
    "Iyer",
    "Nair",
    "Singh",
    "Gupta",
    "Rao",
    "Das",
    "Mehta",
    "Kumar",
    "Yadav",
    "Babu",
    "Naidu",
    "Chowdary",
]

roles = ["Developer", "Designer", "Manager", "Tester", "Analyst", "Support"]


def generate_employee(i):
    first = random.choice(first_names)
    last = random.choice(last_names)

    return {
        "name": f"{first} {last}",
        "email": f"{first.lower()}.{last.lower()}{i}@example.com",
        "role": random.choice(roles),
    }


def create_employee(emp):
    try:
        response = httpx.post(API_URL, json=emp)
        if response.status_code == 200:
            print("Created:", response.json())
        else:
            print("Failed:", response.status_code, response.text)
    except Exception as e:
        print("Error:", e)


def main():
    for i in range(1, 101):  # 100 employees
        emp = generate_employee(i)
        create_employee(emp)


if __name__ == "__main__":
    main()

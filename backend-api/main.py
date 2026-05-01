from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, String, Integer, select
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, sessionmaker

# -----------------------
# Database setup
# -----------------------
DATABASE_URL = "sqlite:///./employees.db"

engine = create_engine(DATABASE_URL, echo=False)
SessionLocal = sessionmaker(bind=engine)


class Base(DeclarativeBase):
    pass


class Employee(Base):
    __tablename__ = "employees"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, index=True)
    name: Mapped[str] = mapped_column(String)
    email: Mapped[str] = mapped_column(String, unique=True, index=True)
    role: Mapped[str] = mapped_column(String)


Base.metadata.create_all(engine)

# -----------------------
# FastAPI app
# -----------------------
app = FastAPI()

# Allow ALL CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# -----------------------
# Helper
# -----------------------
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


# -----------------------
# CRUD APIs
# -----------------------

# Create Employee
@app.post("/employees")
def create_employee(data: dict):
    db = next(get_db())

    emp = Employee(
        name=data.get("name"),
        email=data.get("email"),
        role=data.get("role"),
    )

    db.add(emp)
    db.commit()
    db.refresh(emp)

    return emp


# Read All with Pagination
@app.get("/employees")
def get_employees(
    limit: int = Query(10, ge=1, le=100),
    offset: int = Query(0, ge=0)
):
    db = next(get_db())

    stmt = select(Employee).offset(offset).limit(limit)
    result = db.execute(stmt).scalars().all()

    return {
        "limit": limit,
        "offset": offset,
        "data": result
    }


# Read One
@app.get("/employees/{emp_id}")
def get_employee(emp_id: int):
    db = next(get_db())
    emp = db.get(Employee, emp_id)

    if not emp:
        raise HTTPException(status_code=404, detail="Employee not found")

    return emp


# Update
@app.put("/employees/{emp_id}")
def update_employee(emp_id: int, data: dict):
    db = next(get_db())
    emp = db.get(Employee, emp_id)

    if not emp:
        raise HTTPException(status_code=404, detail="Employee not found")

    emp.name = data.get("name", emp.name)
    emp.email = data.get("email", emp.email)
    emp.role = data.get("role", emp.role)

    db.commit()
    db.refresh(emp)

    return emp


# Delete
@app.delete("/employees/{emp_id}")
def delete_employee(emp_id: int):
    db = next(get_db())
    emp = db.get(Employee, emp_id)

    if not emp:
        raise HTTPException(status_code=404, detail="Employee not found")

    db.delete(emp)
    db.commit()

    return {"message": "Deleted successfully"}
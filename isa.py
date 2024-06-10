import json
from enum import Enum


class Variable:
    def __init__(self, name, address, data, is_string):
        self.name = name
        self.address = address
        self.data = data
        self.is_string = is_string

    def to_dict(self):

        return {
            "name": self.name,
            "address": self.address,
            "data": self.data,
            "is_string": self.is_string
        }

    @staticmethod
    def from_dict(data):
        return Variable(data["name"], data["address"], data["data"], data["is_string"])

class Opcode(str, Enum):
    XCHNG = "xchng"
    PUSH = "push"
    POP = "pop"
    LD = "ld"
    ST = "st"
    DUP = "dup"
    JMP = "jmp"
    JZ = "jz"
    JNZ = "jnz"
    JL = "jl"
    JLE = "jle"
    JG = "jg"
    JGE = "jge"
    CALL = "call"
    RET = "ret"
    INC = "inc"
    ADD = "add"
    SUB = "sub"
    OR = "or"
    AND = "and"
    PRINT = "print"
    INPUT = "input"
    IO_STATUS = "io_status"
    HALT = "hlt"

    def __str__(self):
        return str(self.value)


class Command:
    def __init__(self, opcode: Opcode, operand=None):
        self.opcode = opcode
        self.operand = operand

    def __str__(self):
        return (
            f"{self.opcode}"
            if self.operand is not None
            else f"{self.opcode}"
        )

    def to_dict(self):
        return {"opcode": str(self.opcode), "operand": self.operand}

    @staticmethod
    def from_dict(data):
        return Command(Opcode(data["opcode"]), data.get("operand"))


class MachineCodeLine:
    def __init__(self, line_number: int, command: Command):
        self.line_number = line_number
        self.command = command

    def __str__(self):
        return f"{self.line_number}: {self.command}"

    def to_dict(self):
        return {"line_number": self.line_number, "command": self.command.to_dict()}

    @staticmethod
    def from_dict(data):
        return MachineCodeLine(data["line_number"], Command.from_dict(data["command"]))

def to_json_struct(obj):
    if isinstance(obj, tuple):
        return list(obj)
    elif isinstance(obj, list):
        return [to_json_struct(item) for item in obj]
    elif isinstance(obj, dict):
        return {key: to_json_struct(value) for key, value in obj.items()}
    else:
        return obj

def write_to_json(filename: str, code_lines: list, memory: list):
    data = {
        "code": [to_json_struct(line) for line in code_lines],
        "memory": [to_json_struct(var) for var in memory],
    }
    with open(filename, mode="w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)


def read_from_json(filename: str):
    with open(filename) as f:
        data = json.load(f)
        code_lines = [MachineCodeLine.from_dict(line) for line in data["code"]]
        memory = [Variable.from_dict(var) for var in data["memory"]]
        return code_lines, memory

def write_code(filename: str, code: str):
    with open(filename, mode="bw") as f:
        f.write(code.encode("utf-8"))


def read_code(filename):
    with open(filename, mode="rb") as f:
        code = f.read()
        code = str(code, encoding="utf-8").splitlines()
        return list(code)

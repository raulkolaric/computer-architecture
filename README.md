# Computer Architecture
This repository contains exercises and labs for the Computer Architecture course, focused on understanding how processors manage data, instructions, and memory at a low level.

## Subjects Covered
- **MIPS Assembly**: Writing and debugging assembly code for the MIPS architecture.
- **Register Operations**: Manipulation of processor registers ($t0-$t9, $s0-$s7, etc.) for arithmetic and logical operations.
- **Memory Alignment**: Understanding how data is stored in memory and the importance of word alignment.

## What is MIPS?
**MIPS** (Microprocessor without Interlocked Pipelined Stages) is a **RISC** (Reduced Instruction Set Computer) instruction set architecture (ISA). It is widely used in academic settings to teach computer architecture because of its clean, logical design and its focus on efficiency through simplicity.

Key characteristics:
- **Load/Store Architecture**: Only load and store instructions can access memory; all other operations are performed on registers.
- **Fixed-length Instructions**: Every instruction is exactly 32 bits long, which simplifies the instruction fetching and decoding process.

## How to Run
The exercises are designed to be executed using the **MARS (MIPS Assembler and Runtime Simulator)**.

### Prerequisites
- [Java Runtime Environment (JRE)](https://www.java.com/en/download/) installed on your machine.

### Execution Command
To open the MARS simulator, run the following command from the repository root:

```bash
java -jar Mars4_5.jar
```

Alternatively, you can run a specific assembly file directly from the CLI:

```bash
java -jar Mars4_5.jar <path_to_file.asm>
```

## Repository Structure
- `lab01-registers/`: Introduction to MIPS registers and basic arithmetic.
- `lab02-memory-alignment/`: Exercises on memory access and data alignment.

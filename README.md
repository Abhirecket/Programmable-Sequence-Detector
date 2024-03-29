# Programmable Sequence Detector
 Programmable sequence detection refers to the ability to detect specific patterns or sequences of bits within a stream of data in a configurable or programmable manner. 

### RTL Description: Programmable Sequence Detector

- **Engineer**: Abhishek Kumar Kushwaha
- **Date Created**: March 19, 2024
- **Module Name**: programmable_sequence_detector
- **Company**: College of VLSI
- **Revision**: Revision 0.01 - File Created

#### Overview:
The `programmable_sequence_detector` module implements a sequence detector that detects a fixed programmable sequence of bits in a stream of input data. The sequence to detect is defined by the parameter `PROG_SEQUENCE`.

#### Functional Description:
- **Inputs**: 
  - `clk`: Clock signal.
  - `rst`: Reset signal.
  - `data_i`: Input data stream.
- **Outputs**:
  - `detect_o`: Output signal indicating whether the programmable sequence has been detected.
- **Parameters**:
  - `PROG_SEQUENCE`: Parameter specifying the programmable sequence to detect.
  - `WIDTH`: Parameter specifying the width of the input data and the programmable sequence.
- **Registers**:
  - `shift_q`: Register to store the shifted input data stream.
- **Logic**:
  - The `shift_q` register holds the shifted input data stream. It is updated on every clock cycle by shifting in the new input data (`data_i`).
  - The `shift_nxt` wire represents the next state of the shifted input data.
  - The `detect_o` output is determined by comparing the shifted input data (`shift_nxt`) with the programmable sequence (`PROG_SEQUENCE`). If they match, `detect_o` is asserted.
- **Reset Handling**:
  - On reset (`rst`), the `shift_q` register is cleared.
- **Dependencies**:
  - This module has no external dependencies.

#### Target Devices and Tool Versions:
- This RTL design does not specify target devices or tool versions. It is generic and can be synthesized using various Verilog synthesis tools.

#### Additional Comments:
- This module allows for the detection of a fixed programmable sequence of bits in a stream of input data.
- The ability to specify the sequence to detect through a parameter makes this module versatile and applicable to various applications.

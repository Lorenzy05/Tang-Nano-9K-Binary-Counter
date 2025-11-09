# Tang Nano 9K Counter Project

[English](#english) | [中文](#中文)

---

## English

### Project Description
A 4-bit binary counter implemented on the Tang Nano 9K FPGA development board. This project demonstrates fundamental digital logic design with button-controlled counting and visual LED feedback.

### Features
- **4-bit counter** (0-15 range with automatic wrap-around)
- **Button control** - S2 increments count, S1 resets to zero
- **LED display**:
  - LEDs 0-3: Binary representation of counter value
  - LED 4: Illuminates when number is even
  - LED 5: Illuminates when number is odd
- **Robust input handling**:
  - Clock division for stable operation
  - Button debouncing to eliminate mechanical noise
  - Edge detection for single-pulse generation

### Hardware Requirements
- Tang Nano 9K FPGA Development Board
- USB-C cable for programming and power

### Pin Configuration
| Signal | Pin | Description |
|--------|-----|-------------|
| `clk` | 35 | 27MHz system clock |
| `rst_n` | 4 | S1 button (active low reset) |
| `enable_btn` | 3 | S2 button (increment counter) |
| `leds[0]` | 10 | LED0 - LSB of counter |
| `leds[1]` | 11 | LED1 - Counter bit 1 |
| `leds[2]` | 12 | LED2 - Counter bit 2 |
| `leds[3]` | 13 | LED3 - MSB of counter |
| `leds[4]` | 14 | LED4 - Even indicator |
| `leds[5]` | 15 | LED5 - Odd indicator |

### File Structure
```
project/
├── top.sv              # Top-level module
├── counter.sv          # 4-bit counter logic
├── led_display.sv      # LED control and display
├── clk_div.sv          # Clock divider (27MHz → 1kHz)
├── debounce.sv         # Button debouncing logic
└── edge_detect.sv      # Rising edge detection
```

### Usage Instructions
1. Open project in Gowin IDE
2. Compile all Verilog files
3. Program Tang Nano 9K board
4. **Operation**:
   - Press S2 button to increment counter
   - Press S1 button to reset to zero
   - Observe binary value on LEDs 0-3
   - Check odd/even status on LEDs 4-5

---

## 中文

### 项目描述
基于唐纳诺9K FPGA开发板的4位二进制计数器项目。该项目展示了基础数字逻辑设计，具有按钮控制计数和LED视觉反馈功能。

### 功能特性
- **4位计数器** (0-15范围，自动循环)
- **按钮控制** - S2增加计数，S1复位清零
- **LED显示**:
  - LED 0-3: 计数器值的二进制表示
  - LED 4: 数字为偶数时亮起
  - LED 5: 数字为奇数时亮起
- **稳定输入处理**:
  - 时钟分频确保稳定运行
  - 按钮消抖消除机械噪声
  - 边沿检测生成单次脉冲

### 硬件要求
- 唐纳诺9K FPGA开发板
- USB-C线（用于编程和供电）

### 引脚配置
| 信号 | 引脚 | 描述 |
|------|------|------|
| `clk` | 35 | 27MHz系统时钟 |
| `rst_n` | 4 | S1按钮（低电平有效复位）|
| `enable_btn` | 3 | S2按钮（增加计数）|
| `leds[0]` | 10 | LED0 - 计数器最低位 |
| `leds[1]` | 11 | LED1 - 计数器第1位 |
| `leds[2]` | 12 | LED2 - 计数器第2位 |
| `leds[3]` | 13 | LED3 - 计数器最高位 |
| `leds[4]` | 14 | LED4 - 偶数指示 |
| `leds[5]` | 15 | LED5 - 奇数指示 |

### 文件结构
```
项目/
├── top.sv              # 顶层模块
├── counter.sv          # 4位计数器逻辑
├── led_display.sv      # LED控制和显示
├── clk_div.sv          # 时钟分频器 (27MHz → 1kHz)
├── debounce.sv         # 按钮消抖逻辑
└── edge_detect.sv      # 上升沿检测
```

### 使用说明
1. 在Gowin IDE中打开项目
2. 编译所有Verilog文件
3. 烧录到唐纳诺9K开发板
4. **操作方式**:
   - 按下S2按钮增加计数
   - 按下S1按钮复位清零
   - 通过LED 0-3观察二进制数值
   - 通过LED 4-5检查奇偶状态

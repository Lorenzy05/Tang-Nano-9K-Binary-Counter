Tang Nano 9K Counter Project / 唐纳诺9K计数器项目

Description / 项目描述:
A 4-bit binary counter implemented on Tang Nano 9K FPGA board. 
在唐纳诺9K FPGA开发板上实现的4位二进制计数器。



Features / 功能特性:
- Press S2 button to increment counter (0-15, then wraps around)
- 按下S2按钮计数加1 (0-15循环)

- 4 LEDs display binary value of counter
- 4个LED显示二进制计数值

- 2 LEDs indicate odd/even status (LED4=odd, LED5=even)
- 2个LED指示奇偶状态 (LED4=单数, LED5=双数)

- Press S1 button to reset counter to zero
- 按下S1按钮复位计数器到零



Pin Configuration / 引脚配置:
- clk: System clock (27MHz oscillator)
- clk: 系统时钟 (27MHz晶振)

- rst_n: Pin 4 (S1 button - active low reset)
- rst_n: 引脚4 (S1按钮 - 低电平有效复位)

- enable_btn: Pin 3 (S2 button - increment counter)
- enable_btn: 引脚3 (S2按钮 - 计数加1)

- leds[5:0]: Pins 10-11-13-14-15-16 (6 LEDs: 0-3=binary, 4=odd, 5=even)
- leds[5:0]: 引脚 10-11-13-14-15-16 (6个LED: 0-3=二进制, 4=单数, 5=双数)



Usage / 使用方法:
1. Compile project in Gowin IDE
   在Gowin IDE中编译项目
2. Program Tang Nano 9K board
   烧录到唐纳诺9K开发板
3. Press S2 to count up, S1 to reset
   按下S2计数，按下S1复位



File Structure / 文件结构:
- top.v: Top level module
- counter.v: 4-bit counter logic
- led_display.v: LED control
- clk_div.v: Clock divider
- debounce.v: Button debouncing
- edge_detect.v: Edge detection
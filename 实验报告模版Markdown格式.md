> #         **重庆交通大学学院**
>
> #             **《嵌入式系统基础A》课程**
>
> #                      实验报告（2）

**班 级： 物联网工程1901

**姓名-学号 ： 任子欣631907060118

**实验项目名称： <span class="underline"> STM32串口通信编程 </span>**

**实验项目性质： <span class="underline"> 设计性 </span>**

**实验所属课程： <span class="underline">《嵌入式系统基础A》 </span>**

**实验室(中心)： <span class="underline"> 南岸校区语音大楼 </span>**

**指 导 教 师 ： <span class="underline">娄路 </span>**

**完成时间： <span class="underline"> 2021</span> 年 <span class="underline"> 10</span> 月  25





**一、实验内容和任务**

1.  了解串口协议和RS-232标准，以及RS232电平与TTL电平的区别；了解\"USB/TTL转232\"模块（以CH340芯片模块为例）的工作原理。

2.  安装 stm32CubeMX，配合Keil，分别尝试使用寄存器地址方式（汇编或C，不限） 和HAL库这两种方式，完成下列任务：

    (1)重做上一个LED流水灯作业，即用GPIO端口完成3只LED红绿灯的周期闪烁。

    (2)完成一个STM32的USART串口通讯程序（查询方式即可，暂不要求采用中断方式），要求：1）设置波特率为115200，1位停止位，无校验位；2）STM32系统给上位机（win10）连续发送"hello windows！"。win10采用"串口助手"工具接收。

3.  在没有示波器条件下，可以使用Keil的软件仿真逻辑分析仪功能观察管脚的时序波形，更方便动态跟踪调试和定位代码故障点。 请用此功能观察第1题中3个GPIO端口的输出波形，和第2题中串口输出波形，并分析其正确与否。

    参考网址：

    https://blog.csdn.net/qq\_43279579/article/details/112213196

    搭建STM32开发环境------STM32CubeMX，Keil5

    https://blog.csdn.net/qq\_43279579/article/details/112233696

    STM32实现LED闪烁------基于HAL库

    https://blog.csdn.net/ssj925319/article/details/111984002

    基于 MDK 创建 STM32 汇编程序：串口输出 Hello world

    https://blog.csdn.net/vic\_to\_ry/article/details/110451036

**二、实验要求**

1\. 分组要求：每个学生独立完成，即1人1组。

2\. 程序及报告文档要求：具有较好的可读性，如叙述准确、标注明确、截图清晰等。

3.项目代码上传github，同时把项目完整打包为zip文件，与实验报告（Markdown源码及PDF文件）、作业博客地址一起提交到学习通。

三. **实验过程介绍 （此处可以填博客内容）**

选择对应芯片：

![img](https://img-blog.csdnimg.cn/d8f959c9749c48bc9c9e867291afea03.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAd2VpeGluXzUwOTA5Njgz,size_18,color_FFFFFF,t_70,g_se,x_16)

关闭：

![img](https://img-blog.csdnimg.cn/df92e8647d02495991bece43957d1f32.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAd2VpeGluXzUwOTA5Njgz,size_20,color_FFFFFF,t_70,g_se,x_16)

在该新建项目创立main:

![img](https://img-blog.csdnimg.cn/0b71670101ba47ccbb1ff3f58402cb20.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAd2VpeGluXzUwOTA5Njgz,size_19,color_FFFFFF,t_70,g_se,x_16)

![img](https://img-blog.csdnimg.cn/89e038b333b24e0382a744218fbb9775.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAd2VpeGluXzUwOTA5Njgz,size_19,color_FFFFFF,t_70,g_se,x_16)

main.s代码：

;RCC寄存器地址映像             
RCC_BASE            EQU    0x40021000 
RCC_CR              EQU    (RCC_BASE + 0x00) 
RCC_CFGR            EQU    (RCC_BASE + 0x04) 
RCC_CIR             EQU    (RCC_BASE + 0x08) 
RCC_APB2RSTR        EQU    (RCC_BASE + 0x0C) 
RCC_APB1RSTR        EQU    (RCC_BASE + 0x10) 
RCC_AHBENR          EQU    (RCC_BASE + 0x14) 
RCC_APB2ENR         EQU    (RCC_BASE + 0x18) 
RCC_APB1ENR         EQU    (RCC_BASE + 0x1C) 
RCC_BDCR            EQU    (RCC_BASE + 0x20) 
RCC_CSR             EQU    (RCC_BASE + 0x24) 
                              
;AFIO寄存器地址映像            
AFIO_BASE           EQU    0x40010000 
AFIO_EVCR           EQU    (AFIO_BASE + 0x00) 
AFIO_MAPR           EQU    (AFIO_BASE + 0x04) 
AFIO_EXTICR1        EQU    (AFIO_BASE + 0x08) 
AFIO_EXTICR2        EQU    (AFIO_BASE + 0x0C) 
AFIO_EXTICR3        EQU    (AFIO_BASE + 0x10) 
AFIO_EXTICR4        EQU    (AFIO_BASE + 0x14) 
                                                           
;GPIOA寄存器地址映像              
GPIOA_BASE          EQU    0x40010800 
GPIOA_CRL           EQU    (GPIOA_BASE + 0x00) 
GPIOA_CRH           EQU    (GPIOA_BASE + 0x04) 
GPIOA_IDR           EQU    (GPIOA_BASE + 0x08) 
GPIOA_ODR           EQU    (GPIOA_BASE + 0x0C) 
GPIOA_BSRR          EQU    (GPIOA_BASE + 0x10) 
GPIOA_BRR           EQU    (GPIOA_BASE + 0x14) 
GPIOA_LCKR          EQU    (GPIOA_BASE + 0x18) 
                                                       
;GPIO C口控制                   
GPIOC_BASE          EQU    0x40011000 
GPIOC_CRL           EQU    (GPIOC_BASE + 0x00) 
GPIOC_CRH           EQU    (GPIOC_BASE + 0x04) 
GPIOC_IDR           EQU    (GPIOC_BASE + 0x08) 
GPIOC_ODR           EQU    (GPIOC_BASE + 0x0C) 
GPIOC_BSRR          EQU    (GPIOC_BASE + 0x10) 
GPIOC_BRR           EQU    (GPIOC_BASE + 0x14) 
GPIOC_LCKR          EQU    (GPIOC_BASE + 0x18) 
                                                           
;串口1控制                       
USART1_BASE         EQU    0x40013800 
USART1_SR           EQU    (USART1_BASE + 0x00) 
USART1_DR           EQU    (USART1_BASE + 0x04) 
USART1_BRR          EQU    (USART1_BASE + 0x08) 
USART1_CR1          EQU    (USART1_BASE + 0x0c) 
USART1_CR2          EQU    (USART1_BASE + 0x10) 
USART1_CR3          EQU    (USART1_BASE + 0x14) 
USART1_GTPR         EQU    (USART1_BASE + 0x18) 
                            
;NVIC寄存器地址                
NVIC_BASE           EQU    0xE000E000 
NVIC_SETEN          EQU    (NVIC_BASE + 0x0010)     
;SETENA寄存器阵列的起始地址 
NVIC_IRQPRI         EQU    (NVIC_BASE + 0x0400)     
;中断优先级寄存器阵列的起始地址 
NVIC_VECTTBL        EQU    (NVIC_BASE + 0x0D08)     
;向量表偏移寄存器的地址     
NVIC_AIRCR          EQU    (NVIC_BASE + 0x0D0C)     
;应用程序中断及复位控制寄存器的地址                                                
SETENA0             EQU    0xE000E100 
SETENA1             EQU    0xE000E104 
                            
                              
;SysTick寄存器地址            
SysTick_BASE        EQU    0xE000E010 
SYSTICKCSR          EQU    (SysTick_BASE + 0x00) 
SYSTICKRVR          EQU    (SysTick_BASE + 0x04) 
                              
;FLASH缓冲寄存器地址映像     
FLASH_ACR           EQU    0x40022000 
                             
;SCB_BASE           EQU    (SCS_BASE + 0x0D00) 
                             
MSP_TOP             EQU    0x20005000               
;主堆栈起始值                
PSP_TOP             EQU    0x20004E00               
;进程堆栈起始值             
                            
BitAlias_BASE       EQU    0x22000000               
;位带别名区起始地址         
Flag1               EQU    0x20000200 
b_flas              EQU    (BitAlias_BASE + (0x200*32) + (0*4))               
;位地址 
b_05s               EQU    (BitAlias_BASE + (0x200*32) + (1*4))               
;位地址 
DlyI                EQU    0x20000204 
DlyJ                EQU    0x20000208 
DlyK                EQU    0x2000020C 
SysTim              EQU    0x20000210 


;常数定义 
Bit0                EQU    0x00000001 
Bit1                EQU    0x00000002 
Bit2                EQU    0x00000004 
Bit3                EQU    0x00000008 
Bit4                EQU    0x00000010 
Bit5                EQU    0x00000020 
Bit6                EQU    0x00000040 
Bit7                EQU    0x00000080 
Bit8                EQU    0x00000100 
Bit9                EQU    0x00000200 
Bit10               EQU    0x00000400 
Bit11               EQU    0x00000800 
Bit12               EQU    0x00001000 
Bit13               EQU    0x00002000 
Bit14               EQU    0x00004000 
Bit15               EQU    0x00008000 
Bit16               EQU    0x00010000 
Bit17               EQU    0x00020000 
Bit18               EQU    0x00040000 
Bit19               EQU    0x00080000 
Bit20               EQU    0x00100000 
Bit21               EQU    0x00200000 
Bit22               EQU    0x00400000 
Bit23               EQU    0x00800000 
Bit24               EQU    0x01000000 
Bit25               EQU    0x02000000 
Bit26               EQU    0x04000000 
Bit27               EQU    0x08000000 
Bit28               EQU    0x10000000 
Bit29               EQU    0x20000000 
Bit30               EQU    0x40000000 
Bit31               EQU    0x80000000 


;向量表 
    AREA RESET, DATA, READONLY 
    DCD    MSP_TOP            ;初始化主堆栈 
    DCD    Start              ;复位向量 
    DCD    NMI_Handler        ;NMI Handler 
    DCD    HardFault_Handler  ;Hard Fault Handler 
    DCD    0                   
    DCD    0 
    DCD    0 
    DCD    0 
    DCD    0 
    DCD    0 
    DCD    0 
    DCD    0 
    DCD    0 
    DCD    0 
    DCD    0 
    DCD    SysTick_Handler    ;SysTick Handler 
    SPACE  20                 ;预留空间20字节 








​                 
;代码段 
​    AREA |.text|, CODE, READONLY 
​    ;主程序开始 
​    ENTRY                            
​    ;指示程序从这里开始执行 
Start 
​    ;时钟系统设置 
​    ldr    r0, =RCC_CR 
​    ldr    r1, [r0] 
​    orr    r1, #Bit16 
​    str    r1, [r0] 
​    ;开启外部晶振使能  
​    ;启动外部8M晶振 
​                                            
ClkOk           
​    ldr    r1, [r0] 
​    ands   r1, #Bit17 
​    beq    ClkOk 
​    ;等待外部晶振就绪 
​    ldr    r1,[r0] 
​    orr    r1,#Bit17 
​    str    r1,[r0] 
​    ;FLASH缓冲器 
​    ldr    r0, =FLASH_ACR 
​    mov    r1, #0x00000032 
​    str    r1, [r0] 
​            
    ;设置PLL锁相环倍率为7,HSE输入不分频 
    ldr    r0, =RCC_CFGR 
    ldr    r1, [r0] 
    orr    r1, #(Bit18 :OR: Bit19 :OR: Bit20 :OR: Bit16 :OR: Bit14) 
    orr    r1, #Bit10 
    str    r1, [r0] 
    ;启动PLL锁相环 
    ldr    r0, =RCC_CR 
    ldr    r1, [r0] 
    orr    r1, #Bit24 
    str    r1, [r0] 
PllOk 
    ldr    r1, [r0] 
    ands   r1, #Bit25 
    beq    PllOk 
    ;选择PLL时钟作为系统时钟 
    ldr    r0, =RCC_CFGR 
    ldr    r1, [r0] 
    orr    r1, #(Bit18 :OR: Bit19 :OR: Bit20 :OR: Bit16 :OR: Bit14) 
    orr    r1, #Bit10 
    orr    r1, #Bit1 
    str    r1, [r0] 
    ;其它RCC相关设置 
    ldr    r0, =RCC_APB2ENR 
    mov    r1, #(Bit14 :OR: Bit4 :OR: Bit2) 
    str    r1, [r0]      


    ;IO端口设置 
    ldr    r0, =GPIOC_CRL 
    ldr    r1, [r0] 
    orr    r1, #(Bit28 :OR: Bit29)          
    ;PC.7输出模式,最大速度50MHz  
    and    r1, #(~Bit30 & ~Bit31)   
    ;PC.7通用推挽输出模式 
    str    r1, [r0] 
            
    ;PA9串口0发射脚 
    ldr    r0, =GPIOA_CRH 
    ldr    r1, [r0] 
    orr    r1, #(Bit4 :OR: Bit5)          
    ;PA.9输出模式,最大速度50MHz  
    orr    r1, #Bit7 
    and    r1, #~Bit6 
    ;10：复用功能推挽输出模式 
    str    r1, [r0]    


    ldr    r0, =USART1_BRR   
    mov    r1, #0x271 
    str    r1, [r0] 
    ;配置波特率-> 115200 
                   
    ldr    r0, =USART1_CR1   
    mov    r1, #0x200c 
    str    r1, [r0] 
    ;USART模块总使能 发送与接收使能 
    ;71 02 00 00   2c 20 00 00 
             
    ;AFIO 参数设置             
    ;Systick 参数设置 
    ldr    r0, =SYSTICKRVR           
    ;Systick装初值 
    mov    r1, #9000 
    str    r1, [r0] 
    ldr    r0, =SYSTICKCSR           
    ;设定,启动Systick 
    mov    r1, #0x03 
    str    r1, [r0] 
            
    ;NVIC                     
    ;ldr   r0, =SETENA0 
    ;mov   r1, 0x00800000 
    ;str   r1, [r0] 
    ;ldr   r0, =SETENA1 
    ;mov   r1, #0x00000100 
    ;str   r1, [r0] 
              
    ;切换成用户级线程序模式 
    ldr    r0, =PSP_TOP                   
    ;初始化线程堆栈 
    msr    psp, r0 
    mov    r0, #3 
    msr    control, r0 
              
    ;初始化SRAM寄存器 
    mov    r1, #0 
    ldr    r0, =Flag1 
    str    r1, [r0] 
    ldr    r0, =DlyI 
    str    r1, [r0] 
    ldr    r0, =DlyJ 
    str    r1, [r0] 
    ldr    r0, =DlyK 
    str    r1, [r0] 
    ldr    r0, =SysTim 
    str    r1, [r0] 

;主循环            
main            
    ldr    r0, =Flag1 
    ldr    r1, [r0] 
    tst    r1, #Bit1                 
    ;SysTick产生0.5s,置位bit 1 
    beq    main                  ;0.5s标志还没有置位       
     
    ;0.5s标志已经置位 
    ldr    r0, =b_05s                
    ;位带操作清零0.5s标志 
    mov    r1, #0 
    str    r1, [r0] 
    bl     LedFlas 


    mov    r0, #'H' 
    bl     send_a_char
    
    mov    r0, #'e' 
    bl     send_a_char
    
    mov    r0, #'l' 
    bl     send_a_char
    
    mov    r0, #'l' 
    bl     send_a_char
    
    mov    r0, #'o' 
    bl     send_a_char
    
    mov    r0, #' ' 
    bl     send_a_char
    
    mov    r0, #'w' 
    bl     send_a_char
    
    mov    r0, #'o' 
    bl     send_a_char
    
    mov    r0, #'r' 
    bl     send_a_char
    
    mov    r0, #'l' 
    bl     send_a_char
    
    mov    r0, #'d' 
    bl     send_a_char
    
    mov    r0, #'\n' 
    bl     send_a_char
    
    b      main


​              
​            
;子程序 串口1发送一个字符 
send_a_char 
​    push   {r0 - r3} 
​    ldr    r2, =USART1_DR   
​    str    r0, [r2] 
b1 
​    ldr    r2, =USART1_SR  
​    ldr    r2, [r2] 
​    tst    r2, #0x40 
​    beq    b1 
​    ;发送完成(Transmission complete)等待 
​    pop    {r0 - r3} 
​    bx     lr 


​                 
;子程序 led闪烁 
LedFlas      
​    push   {r0 - r3} 
​    ldr    r0, =Flag1 
​    ldr    r1, [r0] 
​    tst    r1, #Bit0 
​    ;bit0 闪烁标志位 
​    beq    ONLED        ;为0 打开led灯 
​    ;为1 关闭led灯 
​    ldr    r0, =b_flas 
​    mov    r1, #0 
​    str    r1, [r0] 
​    ;闪烁标志位置为0,下一状态为打开灯 
​    ;PC.7输出0 
​    ldr    r0, =GPIOC_BRR 
​    ldr    r1, [r0] 
​    orr    r1, #Bit7 
​    str    r1, [r0] 
​    b      LedEx 
ONLED       
​    ;为0 打开led灯 
​    ldr    r0, =b_flas 
​    mov    r1, #1 
​    str    r1, [r0] 
​    ;闪烁标志位置为1,下一状态为关闭灯 
​    ;PC.7输出1 
​    ldr    r0, =GPIOC_BSRR 
​    ldr    r1, [r0] 
​    orr    r1, #Bit7 
​    str    r1, [r0] 
LedEx        
​    pop    {r0 - r3} 
​    bx     lr 
​                                
;异常程序 
NMI_Handler 
​    bx     lr 

HardFault_Handler 
    bx     lr 
              
SysTick_Handler 
    ldr    r0, =SysTim 
    ldr    r1, [r0] 
    add    r1, #1 
    str    r1, [r0] 
    cmp    r1, #500 
    bcc    TickExit 
    mov    r1, #0 
    str    r1, [r0] 
    ldr    r0, =b_05s  
    ;大于等于500次 清零时钟滴答计数器 设置0.5s标志位 
    ;位带操作置1 
    mov    r1, #1 
    str    r1, [r0] 
TickExit    
    bx     lr 
                                                                           

    ALIGN            
    ;通过用零或空指令NOP填充,来使当前位置与一个指定的边界对齐 
    END
勾选`Create HEX File`：

![在这里插入图片描述](https://img-blog.csdnimg.cn/ae2f3a9e9d254f868e843429575eb6a3.png)

勾选`Use MicroLIB`：

![在这里插入图片描述](https://img-blog.csdnimg.cn/d3eb1b556f584b1aafb45ab64dfaeede.png)

编译：

![在这里插入图片描述](https://img-blog.csdnimg.cn/ae99c7c1c9804201b9c330d423ab0150.png)

利用USB转串口烧录程序，不同的是，将波特率改为`115200`：

![img](https://img-blog.csdnimg.cn/4a62e2952e7d43e3ad397b81d756f002.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAd2VpeGluXzUwOTA5Njgz,size_20,color_FFFFFF,t_70,g_se,x_16)

将boot0和boot1都接0，重新接电：

![img](https://img-blog.csdnimg.cn/13ec3b323838401d89edcc28d0328689.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAd2VpeGluXzUwOTA5Njgz,size_20,color_FFFFFF,t_70,g_se,x_16)

运行结果：

![img](https://img-blog.csdnimg.cn/d4bb0a944e8b48ff8d704c4230ff201e.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAd2VpeGluXzUwOTA5Njgz,size_20,color_FFFFFF,t_70,g_se,x_16)

打开串口，成功接收：

![img](https://img-blog.csdnimg.cn/a260951e2a794c32b1425210ae5bda15.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAd2VpeGluXzUwOTA5Njgz,size_20,color_FFFFFF,t_70,g_se,x_16)

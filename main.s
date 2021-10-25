      
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
                              
          
AFIO_BASE           EQU    0x40010000 
AFIO_EVCR           EQU    (AFIO_BASE + 0x00) 
AFIO_MAPR           EQU    (AFIO_BASE + 0x04) 
AFIO_EXTICR1        EQU    (AFIO_BASE + 0x08) 
AFIO_EXTICR2        EQU    (AFIO_BASE + 0x0C) 
AFIO_EXTICR3        EQU    (AFIO_BASE + 0x10) 
AFIO_EXTICR4        EQU    (AFIO_BASE + 0x14) 
                                                           
             
GPIOA_BASE          EQU    0x40010800 
GPIOA_CRL           EQU    (GPIOA_BASE + 0x00) 
GPIOA_CRH           EQU    (GPIOA_BASE + 0x04) 
GPIOA_IDR           EQU    (GPIOA_BASE + 0x08) 
GPIOA_ODR           EQU    (GPIOA_BASE + 0x0C) 
GPIOA_BSRR          EQU    (GPIOA_BASE + 0x10) 
GPIOA_BRR           EQU    (GPIOA_BASE + 0x14) 
GPIOA_LCKR          EQU    (GPIOA_BASE + 0x18) 
                                                       
                  
GPIOC_BASE          EQU    0x40011000 
GPIOC_CRL           EQU    (GPIOC_BASE + 0x00) 
GPIOC_CRH           EQU    (GPIOC_BASE + 0x04) 
GPIOC_IDR           EQU    (GPIOC_BASE + 0x08) 
GPIOC_ODR           EQU    (GPIOC_BASE + 0x0C) 
GPIOC_BSRR          EQU    (GPIOC_BASE + 0x10) 
GPIOC_BRR           EQU    (GPIOC_BASE + 0x14) 
GPIOC_LCKR          EQU    (GPIOC_BASE + 0x18) 
                                                           
                       
USART1_BASE         EQU    0x40013800 
USART1_SR           EQU    (USART1_BASE + 0x00) 
USART1_DR           EQU    (USART1_BASE + 0x04) 
USART1_BRR          EQU    (USART1_BASE + 0x08) 
USART1_CR1          EQU    (USART1_BASE + 0x0c) 
USART1_CR2          EQU    (USART1_BASE + 0x10) 
USART1_CR3          EQU    (USART1_BASE + 0x14) 
USART1_GTPR         EQU    (USART1_BASE + 0x18) 
                            
                
NVIC_BASE           EQU    0xE000E000 
NVIC_SETEN          EQU    (NVIC_BASE + 0x0010)     

NVIC_IRQPRI         EQU    (NVIC_BASE + 0x0400)     

NVIC_VECTTBL        EQU    (NVIC_BASE + 0x0D08)     
    
NVIC_AIRCR          EQU    (NVIC_BASE + 0x0D0C)     
                                               
SETENA0             EQU    0xE000E100 
SETENA1             EQU    0xE000E104 
                            
            
SysTick_BASE        EQU    0xE000E010 
SYSTICKCSR          EQU    (SysTick_BASE + 0x00) 
SYSTICKRVR          EQU    (SysTick_BASE + 0x04) 
                              
    
FLASH_ACR           EQU    0x40022000 
                             
;SCB_BASE           EQU    (SCS_BASE + 0x0D00) 
                             
MSP_TOP             EQU    0x20005000               
               
PSP_TOP             EQU    0x20004E00               
            
                            
BitAlias_BASE       EQU    0x22000000               
        
Flag1               EQU    0x20000200 
b_flas              EQU    (BitAlias_BASE + (0x200*32) + (0*4))               

b_05s               EQU    (BitAlias_BASE + (0x200*32) + (1*4))               

DlyI                EQU    0x20000204 
DlyJ                EQU    0x20000208 
DlyK                EQU    0x2000020C 
SysTim              EQU    0x20000210 


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



    AREA RESET, DATA, READONLY 
    DCD    MSP_TOP            
    DCD    Start               
    DCD    NMI_Handler         
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
    SPACE  20                








                 
;??? 
    AREA |.text|, CODE, READONLY 
 
    ENTRY                            

Start 
 
    ldr    r0, =RCC_CR 
    ldr    r1, [r0] 
    orr    r1, #Bit16 
    str    r1, [r0] 
 

                                            
ClkOk           
    ldr    r1, [r0] 
    ands   r1, #Bit17 
    beq    ClkOk 

    ldr    r1,[r0] 
    orr    r1,#Bit17 
    str    r1,[r0] 

    ldr    r0, =FLASH_ACR 
    mov    r1, #0x00000032 
    str    r1, [r0] 
            
 
    ldr    r0, =RCC_CFGR 
    ldr    r1, [r0] 
    orr    r1, #(Bit18 :OR: Bit19 :OR: Bit20 :OR: Bit16 :OR: Bit14) 
    orr    r1, #Bit10 
    str    r1, [r0] 
 
    ldr    r0, =RCC_CR 
    ldr    r1, [r0] 
    orr    r1, #Bit24 
    str    r1, [r0] 
PllOk 
    ldr    r1, [r0] 
    ands   r1, #Bit25 
    beq    PllOk 
 
    ldr    r0, =RCC_CFGR 
    ldr    r1, [r0] 
    orr    r1, #(Bit18 :OR: Bit19 :OR: Bit20 :OR: Bit16 :OR: Bit14) 
    orr    r1, #Bit10 
    orr    r1, #Bit1 
    str    r1, [r0] 
 
    ldr    r0, =RCC_APB2ENR 
    mov    r1, #(Bit14 :OR: Bit4 :OR: Bit2) 
    str    r1, [r0]      



    ldr    r0, =GPIOC_CRL 
    ldr    r1, [r0] 
    orr    r1, #(Bit28 :OR: Bit29)          
   
    and    r1, #(~Bit30 & ~Bit31)   
    
    str    r1, [r0] 
            
    
    ldr    r0, =GPIOA_CRH 
    ldr    r1, [r0] 
    orr    r1, #(Bit4 :OR: Bit5)          
      
    orr    r1, #Bit7 
    and    r1, #~Bit6 
    
    str    r1, [r0]    


    ldr    r0, =USART1_BRR   
    mov    r1, #0x271 
    str    r1, [r0] 
     
                   
    ldr    r0, =USART1_CR1   
    mov    r1, #0x200c 
    str    r1, [r0] 
    
             
    
    ldr    r0, =SYSTICKRVR           
    
    mov    r1, #9000 
    str    r1, [r0] 
    ldr    r0, =SYSTICKCSR           
 
    mov    r1, #0x03 
    str    r1, [r0] 
            
    ;NVIC                     
    ;ldr   r0, =SETENA0 
    ;mov   r1, 0x00800000 
    ;str   r1, [r0] 
    ;ldr   r0, =SETENA1 
    ;mov   r1, #0x00000100 
    ;str   r1, [r0] 
              
    ;??????????? 
    ldr    r0, =PSP_TOP                   
    ;??????? 
    msr    psp, r0 
    mov    r0, #3 
    msr    control, r0 
              
    ;???SRAM??? 
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
               
;???            
main            
    ldr    r0, =Flag1 
    ldr    r1, [r0] 
    tst    r1, #Bit1                 
    ;SysTick??0.5s,??bit 1 
    beq    main                  ;0.5s???????       
     
    ;0.5s?????? 
    ldr    r0, =b_05s                
    ;??????0.5s?? 
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
            
              
            
;??? ??1?????? 
send_a_char 
    push   {r0 - r3} 
    ldr    r2, =USART1_DR   
    str    r0, [r2] 
b1 
    ldr    r2, =USART1_SR  
    ldr    r2, [r2] 
    tst    r2, #0x40 
    beq    b1 
    ;????(Transmission complete)?? 
    pop    {r0 - r3} 
    bx     lr 


                 
;??? led?? 
LedFlas      
    push   {r0 - r3} 
    ldr    r0, =Flag1 
    ldr    r1, [r0] 
    tst    r1, #Bit0 
    ;bit0 ????? 
    beq    ONLED        ;?0 ??led? 
    ;?1 ??led? 
    ldr    r0, =b_flas 
    mov    r1, #0 
    str    r1, [r0] 
    ;???????0,???????? 
    ;PC.7??0 
    ldr    r0, =GPIOC_BRR 
    ldr    r1, [r0] 
    orr    r1, #Bit7 
    str    r1, [r0] 
    b      LedEx 
ONLED       
    ;?0 ??led? 
    ldr    r0, =b_flas 
    mov    r1, #1 
    str    r1, [r0] 
    ;???????1,???????? 
    ;PC.7??1 
    ldr    r0, =GPIOC_BSRR 
    ldr    r1, [r0] 
    orr    r1, #Bit7 
    str    r1, [r0] 
LedEx        
    pop    {r0 - r3} 
    bx     lr 
                                
;???? 
NMI_Handler 
    bx     lr 


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
    ;????500? ????????? ??0.5s??? 
    ;?????1 
    mov    r1, #1 
    str    r1, [r0] 
TickExit    
    bx     lr 
                                                                           
    ALIGN            
    
    END

/***
 * @Author: rx-ted 1552488649@qq.com
 * @Date: 2024-03-03 18:20:39
 * @LastEditors: rx-ted 1552488649@qq.com
 * @LastEditTime: 2024-03-07 23:30:05
 * @Description: LCD DEMO
 * @Copyright (c) 2024 by rx-ted, All Rights Reserved.
 */

#include "lcd.h" // Hardware-specific library
#include "Arduino.h"
#include "font_fixedsys_mono_16.h"
#include "rtdevice.h"
#include <rtthread.h>
#include <rthw.h>
#include "drv_common.h"

#define BLACK 0x0000
#define BLUE 0x001F
#define RED 0xF800
#define GREEN 0x07E0
#define CYAN 0x07FF
#define MAGENTA 0xF81F
#define YELLOW 0xFFE0
#define WHITE 0xFFFF

uint8_t LCD_CS = A3;    // Chip Select goes to Analog 3
uint8_t LCD_CD = A2;    // Command/Data goes to Analog 2
uint8_t LCD_WR = A1;    // LCD Write goes to Analog 1
uint8_t LCD_RD = A0;    // LCD Read goes to Analog 0
uint8_t LCD_RESET = A4; // Can alternately just connect to Arduino's reset pin
uint8_t d8[] = {D8, D9, D2, D3, D4, D5, D6, D7};
TFTLCD tft = TFTLCD(LCD_CS, LCD_CD, LCD_WR, LCD_RD, LCD_RESET, 240, 320, d8);

// #define BLUE_LED GET_PIN(0, 0)

void lcd_demo()
{


    rt_kprintf("Hello TFT \nLCD test \n");
    rt_kprintf("Using Adafruit 2.4\" TFT Breakout Board Pinout\n");
    tft.begin();
    tft.setRotation(0);
    tft.fillScreen(BLACK);
    tft.drawPixel(0, 0, BLUE);
    tft.drawPixel(240 - 1, 320 - 1, RED);
    tft.drawPixel(0, 320 - 1, YELLOW);
    tft.drawPixel(240 - 1, 0, YELLOW);
    tft.drawLine(20, 50, 200, 200, 10, BLUE);
    tft.fillRect(40, 20, 64, 64, MAGENTA);
    tft.fillRectFast(40, 100, 100, 100, YELLOW);
    tft.drawRectangle(20, 20, 30, 10, WHITE);
    tft.drawChar(20, 200, 'B', RED, 0X00, &font_fixedsys_mono_16, 0);
    tft.drawChar(30, 200, 'E', RED, 0X00, &font_fixedsys_mono_16, 0);
    tft.drawChar(40, 200, 'N', RED, 0X00, &font_fixedsys_mono_16, 0);
    tft.drawChar(50, 200, 'H', RED, 0X00, &font_fixedsys_mono_16, 0);
    tft.drawChar(60, 200, 'E', RED, 0X00, &font_fixedsys_mono_16, 0);
    tft.drawChar(70, 200, 'L', RED, 0X00, &font_fixedsys_mono_16, 0);
    tft.drawChar(80, 200, 'L', RED, 0X00, &font_fixedsys_mono_16, 0);
    tft.drawChar(90, 200, 'O', RED, 0X00, &font_fixedsys_mono_16, 0);
    tft.drawString(10, 220, (char *)"This is some example for lcd, see this demo.", WHITE);

    delay(300);
}

MSH_CMD_EXPORT(lcd_demo, "lcd demo");
int main(void)
{
}
